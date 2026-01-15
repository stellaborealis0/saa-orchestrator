#!/bin/bash

set -euo pipefail

# SAA_v11 GITHUB INITIALIZATION
# Propósito: Inicializar repositorio GitHub y sincronizar

PROJECT_ROOT="${1:-$HOME/SAA_v11}"
GITHUB_USER="${2:-tu-usuario}"
GITHUB_REPO="${3:-saa-orchestrator}"

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  SAA v11 GITHUB INITIALIZER v1a                           ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "Proyecto: $PROJECT_ROOT"
echo "GitHub: $GITHUB_USER/$GITHUB_REPO"
echo ""

# Verificar si git existe
if ! command -v git &> /dev/null; then
    echo "✗ Git no está instalado. Instalar primero."
    exit 1
fi

cd "$PROJECT_ROOT"

# Inicializar repositorio si no existe
if [ ! -d ".git" ]; then
    echo "✓ Inicializando repositorio git..."
    git init
    git config user.email "desarrollo@saa.local"
    git config user.name "SAA Developer"
else
    echo "✓ Repositorio git ya existe"
fi

# Agregar remote
echo "✓ Configurando remote de GitHub..."
if git remote | grep -q "origin"; then
    git remote remove origin
fi

git remote add origin "https://github.com/$GITHUB_USER/$GITHUB_REPO.git"

# Crear commit inicial
echo "✓ Creando commit inicial..."
git add -A
git commit -m "SAA v11 initial commit - $(date +%Y%m%d_%H%M)" || true

# Crear rama main si no existe
echo "✓ Configurando rama main..."
git branch -M main

# Mostrar instrucciones finales
echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║  PRÓXIMOS PASOS - CONFIGURACIÓN GITHUB                     ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "1. Crear repositorio en GitHub:"
echo "   https://github.com/new"
echo "   Nombre: $GITHUB_REPO"
echo "   (NO inicializar con README ni .gitignore)"
echo ""
echo "2. Una vez creado, ejecutar:"
echo "   git push -u origin main"
echo ""
echo "3. Verificar:"
echo "   git remote -v"
echo "   git branch -a"
echo ""
