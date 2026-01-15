#!/bin/bash

set -euo pipefail

# SAA_v11 SYSTEM INSTALLER
# Propósito: Instalación profesional SAA en cualquier máquina
# Fecha: 15 Enero 2026

PROJECT_ROOT="${1:-$HOME/SAA_v11}"

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  SAA v11 SYSTEM INSTALLER v1a                            ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "Instalación en: $PROJECT_ROOT"
echo ""

# Crear estructura base si no existe
if [ ! -d "$PROJECT_ROOT" ]; then
    echo "✓ Creando directorio raíz..."
    mkdir -p "$PROJECT_ROOT"
fi

# Crear directorios esenciales
echo "✓ Creando estructura de directorios..."
mkdir -p "$PROJECT_ROOT"/{scripts,config,data,backups,logs,tests,docs,models,modules}
mkdir -p "$PROJECT_ROOT"/scripts/{installation,orchestration,monitoring,utilities,deployment}
mkdir -p "$PROJECT_ROOT"/modules/{ralph,llama-integration,arbitrage,risk-management,evaluation}
mkdir -p "$PROJECT_ROOT"/data/{models,cache,metrics,quotes,trades}
mkdir -p "$PROJECT_ROOT"/backups/{daily,weekly,models}
mkdir -p "$PROJECT_ROOT"/tests/{unit,integration,performance}
mkdir -p "$PROJECT_ROOT"/docs/{architecture,api,troubleshooting}

# Crear archivo de configuración
echo "✓ Generando configuración del sistema..."
cat > "$PROJECT_ROOT/config/.saa-config" << 'CONFIG'
# SAA_v11 CONFIGURATION
# Auto-generated: 15 Enero 2026

# Máquinas del ecosistema
SAA_IMAC_HOST="192.168.1.55"
SAA_IMAC_USER="gerardo"
SAA_WS_HOST="192.168.1.160"
SAA_WS_USER="eviwork"
SAA_TO_HOST="192.168.1.180"
SAA_TO_USER="eviwork"

# Puertos y servicios
SAA_RALPH_PORT="8001"
SAA_LLAMA_PORT="8000"
SAA_OLLAMA_PORT="11434"

# Configuración de modelos
SAA_MODEL_PHI35="Phi-3.5-mini-instruct-Q4_K_M.gguf"
SAA_MODEL_QWEN7B="qwen2.5:7b-coder"
SAA_MODEL_QWEN32B="qwen2.5-coder:32b"
SAA_MODEL_DEEPSEEK="deepseek-1.5b"

# Paths
SAA_SCRIPTS_DIR="$PROJECT_ROOT/scripts"
SAA_MODULES_DIR="$PROJECT_ROOT/modules"
SAA_DATA_DIR="$PROJECT_ROOT/data"
SAA_LOGS_DIR="$PROJECT_ROOT/logs"
SAA_BACKUPS_DIR="$PROJECT_ROOT/backups"

# Logging
SAA_LOG_LEVEL="INFO"
SAA_LOG_FILE="$SAA_LOGS_DIR/saa-system.log"

# Performance
SAA_RALPH_MIN_INTERVAL="3.0"
SAA_LLAMA_TIMEOUT="30"
SAA_BATCH_SIZE="10"

# Seguridad
SAA_ENABLE_VALIDATION="true"
SAA_AUTO_BACKUP="true"
CONFIG

echo "✓ Archivo de configuración creado"

# Crear archivo de estado
cat > "$PROJECT_ROOT/.saa-status" << 'STATUS'
{
  "version": "11a",
  "installed_at": "2026-01-15",
  "components": {
    "system": "ready",
    "scripts": "ready",
    "modules": "pending",
    "models": "pending"
  },
  "status": "initialized"
}
STATUS

echo "✓ Archivo de estado creado"

# Crear .gitignore
cat > "$PROJECT_ROOT/.gitignore" << 'GITIGNORE'
# Datos sensibles
*.gguf
models/
data/models/
data/cache/
data/quotes/
data/trades/

# Archivos de sistema
.DS_Store
*.pyc
__pycache__/
*.egg-info/
.pytest_cache/

# Logs
logs/
*.log

# Backups
backups/

# Variables de entorno
.env
.env.local

# IDE
.vscode/
.idea/
*.swp
*.swo

# Compilados
build/
dist/

# Temporal
tmp/
.cache/
GITIGNORE

echo "✓ .gitignore creado"

# Crear README
cat > "$PROJECT_ROOT/README.md" << 'README'
# SAA v11 - Smart Arbitrage Assistant

Ecosistema profesional de trading algorítmico con orquestación distribuida.

## Estructura

```
SAA_v11/
├── scripts/          # Scripts operativos
├── config/           # Configuración centralizada
├── data/             # Datos (modelos, métricas, trades)
├── backups/          # Copias de seguridad automáticas
├── logs/             # Logging centralizado
├── tests/            # Suite de pruebas
├── docs/             # Documentación
├── models/           # Almacén de modelos GGUF
└── modules/          # Módulos Python importables
```

## Instalación Rápida

```bash
# Opción 1: Script automático
bash scripts/installation/saa-system-install-v11a.sh /path/to/SAA_v11

# Opción 2: Manual (ya hecho)
source config/.saa-config
```

## Uso

Ver documentación en `docs/` y scripts disponibles en `scripts/`.

## Estatus

- Sistema: ✓ Instalado
- Módulos: Pendiente
- Modelos: Pendiente

## Máquinas del Ecosistema

- iMac (Coordinador)
- WS (Generación de código)
- TO (Trading executor)
README

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║  ✓ INSTALACIÓN COMPLETADA                                 ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "Próximos pasos:"
echo "1. cd $PROJECT_ROOT"
echo "2. source config/.saa-config"
echo "3. Ver disponible en: scripts/ y docs/"
echo ""
