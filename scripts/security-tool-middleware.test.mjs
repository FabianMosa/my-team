/**
 * Tests del middleware SecDevOps (`security-tool-middleware.mjs`).
 * Ejecutar: `npm test` (requiere Node 18+ por `node:test`).
 */

import { test } from "node:test";
import assert from "node:assert/strict";
import {
  runSelfTestSuite,
  validateSensitivePath,
  validatePreToolUsePayload,
  extractPathsFromToolInput,
  scanTextForHardcodedSecrets,
} from "./security-tool-middleware.mjs";

test("runSelfTestSuite — paridad con npm run secdevops:selftest", () => {
  runSelfTestSuite();
});

test("validatePreToolUsePayload deniega Write sobre .env", () => {
  const r = validatePreToolUsePayload({
    tool_name: "Write",
    tool_input: { path: "/proyecto/.env", contents: "X=1\n" },
  });
  assert.equal(r.permission, "deny");
});

test("validatePreToolUsePayload permite Write en ruta normal sin secretos", () => {
  const r = validatePreToolUsePayload({
    tool_name: "Write",
    tool_input: { path: "src/lib.ts", contents: "export const x = 1;\n" },
  });
  assert.equal(r.permission, "allow");
});

test("validatePreToolUsePayload deniega secretos en contenido Write", () => {
  const r = validatePreToolUsePayload({
    tool_name: "Write",
    tool_input: {
      path: "src/config.ts",
      contents: "const k = 'ghp_abcdefghijklmnopqrstuvwxyz0123456789AB'\n",
    },
  });
  assert.equal(r.permission, "deny");
});

test("extractPathsFromToolInput recoge path conocido", () => {
  const paths = extractPathsFromToolInput("Write", { path: "foo/bar.ts" });
  assert.ok(paths.includes("foo/bar.ts"));
});

test(".env.example no se bloquea como .env", () => {
  const r = validateSensitivePath("/repo/.env.example");
  assert.equal(r.blocked, false);
});

test("scanTextForHardcodedSecrets no dispara en texto benigno", () => {
  const r = scanTextForHardcodedSecrets("const apiUrl = process.env.API_URL;");
  assert.equal(r.leaked, false);
});
