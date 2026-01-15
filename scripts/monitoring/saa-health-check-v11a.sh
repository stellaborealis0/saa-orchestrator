#!/bin/bash

set -euo pipefail

# SAA v11 HEALTH CHECK
# Propósito: Verificar estado de todos los componentes

PROJECT_ROOT="${1:-.}"

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  SAA v11 HEALTH CHECK v1a                                 ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

source "$PROJECT_ROOT/config/.saa-config" 2>/dev/null || true

# Variables de salida
CHECKS_PASSED=0
CHECKS_FAILED=0

check_component() {
    local name="$1"
    local command="$2"
    
    echo -n "Verificando $name... "
    
    if eval "$command" > /dev/null 2>&1; then
        echo "✓"
        ((CHECKS_PASSED++))
    else
        echo "✗"
        ((CHECKS_FAILED++))
    fi
}

# Verificaciones
check_component "Estructura de directorios" "test -d $PROJECT_ROOT/scripts"
check_component "Config cargable" "test -f $PROJECT_ROOT/config/.saa-config"
check_component "Git configurado" "test -d $PROJECT_ROOT/.git"
check_component "Módulos Python" "test -d $PROJECT_ROOT/modules"
check_component "Tests disponibles" "test -d $PROJECT_ROOT/tests"
check_component "Documentación" "test -d $PROJECT_ROOT/docs"

echo ""
echo "═══════════════════════════════════════════════════════════"
echo "RESUMEN"
echo "═══════════════════════════════════════════════════════════"
echo "Checks pasados: $CHECKS_PASSED"
echo "Checks fallidos: $CHECKS_FAILED"
echo ""

if [ $CHECKS_FAILED -eq 0 ]; then
    echo "✓ Sistema SAA_v11 completamente operativo"
    exit 0
else
    echo "✗ Se encontraron problemas"
    exit 1
fi
