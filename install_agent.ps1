# Instala .cursor, .cursorrules, ai-team y STACK.md desde esta carpeta (plantilla) hacia el proyecto destino.
# NO copia README.md ni AGENTS.md.
# Uso (PowerShell), desde el proyecto destino:
#   powershell -ExecutionPolicy Bypass -File "C:\ruta\my-team\install_agent.ps1"
# Con sobrescritura:
#   powershell -ExecutionPolicy Bypass -File "...\install_agent.ps1" -Force

param(
  [switch]$Force
)

$ErrorActionPreference = "Stop"
$BasePath = $PSScriptRoot

$required = @(".cursor", ".cursorrules", "ai-team")
foreach ($name in $required) {
  $p = Join-Path $BasePath $name
  if (-not (Test-Path $p)) {
    Write-Error "No existe en plantilla: $name ($p)"
  }
}

$DestRoot = Get-Location

function Copy-Merge {
  param(
    [string]$Source,
    [string]$Destination,
    [bool]$Overwrite
  )
  if (Test-Path $Source -PathType Container) {
    if (-not (Test-Path $Destination)) {
      New-Item -ItemType Directory -Path $Destination | Out-Null
    }
    Get-ChildItem -LiteralPath $Source -Force | ForEach-Object {
      $target = Join-Path $Destination $_.Name
      Copy-Merge -Source $_.FullName -Destination $target -Overwrite $Overwrite
    }
  } else {
    $dir = Split-Path $Destination -Parent
    if (-not (Test-Path $dir)) {
      New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
    if ($Overwrite -or -not (Test-Path $Destination)) {
      Copy-Item -LiteralPath $Source -Destination $Destination -Force
    }
  }
}

Write-Host "🚀 Installing Cursor AI stack → $DestRoot"

foreach ($d in $required) {
  $src = Join-Path $BasePath $d
  $dst = Join-Path $DestRoot $d
  Write-Host "📦 Copying $d/ …"
  Copy-Merge -Source $src -Destination $dst -Overwrite ([bool]$Force)
}

$stackSrc = Join-Path $BasePath "STACK.md"
if (Test-Path $stackSrc) {
  $stackDst = Join-Path $DestRoot "STACK.md"
  if (-not $Force -and (Test-Path $stackDst)) {
    Write-Host "⏭️  Omitiendo STACK.md (ya existe; usa -Force)"
  } else {
    Write-Host "📄 Copying STACK.md …"
    Copy-Item -LiteralPath $stackSrc -Destination $stackDst -Force
  }
}

$ok = $true
foreach ($d in $required) {
  if (-not (Test-Path (Join-Path $DestRoot $d))) { $ok = $false }
}
if (-not $ok) {
  Write-Error "Installation failed"
}
Write-Host "✅ Installation successful"
Write-Host "🎉 Cursor AI ready"
