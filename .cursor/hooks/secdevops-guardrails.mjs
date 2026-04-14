#!/usr/bin/env node
/**
 * Hook de Cursor: aplica la política SecDevOps antes de ejecutar herramientas.
 * Delega la lógica en `scripts/security-tool-middleware.mjs` para una sola fuente de verdad.
 *
 * Eventos soportados: preToolUse, beforeShellExecution, beforeReadFile.
 *
 * Nota: en `.cursor/hooks.json`, `preToolUse` y `beforeShellExecution` llevan `failClosed: true`
 * para que un fallo anómalo del proceso (p. ej. Node no encontrado) no deje pasar la acción sin revisión.
 */

import {
  validateShellCommand,
  validateSensitivePath,
  validatePreToolUsePayload,
} from "../../scripts/security-tool-middleware.mjs";

function readStdin() {
  return new Promise((resolve) => {
    const chunks = [];
    process.stdin.on("data", (c) => chunks.push(c));
    process.stdin.on("end", () => resolve(Buffer.concat(chunks).toString("utf8")));
  });
}

function deny(userMessage, agentMessage) {
  console.log(
    JSON.stringify({
      permission: "deny",
      user_message: userMessage,
      agent_message: agentMessage,
    })
  );
}

function allow() {
  console.log(JSON.stringify({ permission: "allow" }));
}

async function main() {
  const raw = await readStdin();
  let input = {};
  try {
    input = JSON.parse(raw || "{}");
  } catch {
    allow();
    return;
  }

  const event = input.hook_event_name || "";

  if (event === "beforeShellExecution") {
    const cmd = typeof input.command === "string" ? input.command : "";
    const r = validateShellCommand(cmd);
    if (!r.allowed) {
      deny(
        `SecDevOps: comando bloqueado (${r.reason})`,
        `El comando de terminal viola la política del proyecto. ${r.reason}`
      );
      return;
    }
    allow();
    return;
  }

  if (event === "beforeReadFile") {
    const fp = typeof input.file_path === "string" ? input.file_path : "";
    const check = validateSensitivePath(fp);
    if (check.blocked) {
      deny(
        `SecDevOps: lectura denegada (${check.reason})`,
        `No intentes leer archivos sensibles. ${check.reason}`
      );
      return;
    }
    const attachments = Array.isArray(input.attachments) ? input.attachments : [];
    for (const att of attachments) {
      const p = att && typeof att.file_path === "string" ? att.file_path : "";
      if (!p) continue;
      const a = validateSensitivePath(p);
      if (a.blocked) {
        deny(
          `SecDevOps: adjunto en ruta restringida (${a.reason})`,
          `Contexto adjunto bloqueado por política. ${a.reason}`
        );
        return;
      }
    }
    allow();
    return;
  }

  if (event === "preToolUse") {
    const toolName = input.tool_name || "";
    const toolInput =
      input.tool_input && typeof input.tool_input === "object"
        ? input.tool_input
        : {};
    const result = validatePreToolUsePayload({
      tool_name: toolName,
      tool_input: toolInput,
    });
    if (result.permission === "deny") {
      console.log(
        JSON.stringify({
          permission: "deny",
          user_message: result.user_message,
          agent_message: result.agent_message,
        })
      );
      return;
    }
    allow();
    return;
  }

  allow();
}

main().catch(() => allow());
