#!/bin/bash

set -euo pipefail

# SAA v11 MACHINE SYNCHRONIZER
# Propósito: Sincronizar SAA_v11 entre máquinas del ecosistema

PROJECT_ROOT="${1:-.}"

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  SAA v11 MACHINE SYNCHRONIZER v1a                         ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

source "$PROJECT_ROOT/config/.saa-config" 2>/dev/null || true

echo "Máquinas disponibles:"
echo "  1. iMac  ($SAA_IMAC_HOST)"
echo "  2. WS    ($SAA_WS_HOST)"
echo "  3. TO    ($SAA_TO_HOST)"
echo ""
echo "Sincronización via:"
echo "  • GitHub (primario)"
echo "  • RSYNC (respaldo)"
echo "  • Git pull en cada máquina"
echo ""

# Verificar conexión git
if ! git -C "$PROJECT_ROOT" remote -v | grep -q "origin"; then
    echo "✗ Git remote no configurado. Ejecutar primero:"
    echo "  bash scripts/installation/saa-init-github-v11a.sh"
    exit 1
fi

# Push a GitHub
echo "✓ Sincronizando con GitHub..."
cd "$PROJECT_ROOT"
git add -A
git commit -m "Auto-sync $(date +%Y%m%d_%H%M)" || true
git push origin main || echo "⚠ Git push falló (rama remota puede no existir)"

# Mostrar instrucciones para otros hosts
echo ""
echo "═══════════════════════════════════════════════════════════"
echo "PRÓXIMOS PASOS EN OTRAS MÁQUINAS"
echo "═══════════════════════════════════════════════════════════"
echo ""
echo "En WS ($SAA_WS_USER@$SAA_WS_HOST):"
echo "  ssh $SAA_WS_USER@$SAA_WS_HOST"
echo "  cd ~/SAA_v11 && git pull origin main"
echo ""
echo "En TO ($SAA_TO_USER@$SAA_TO_HOST):"
echo "  ssh $SAA_TO_USER@$SAA_TO_HOST"
echo "  cd ~/SAA_v11 && git pull origin main"
echo ""
