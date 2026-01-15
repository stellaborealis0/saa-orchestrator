# SAA v11 - Quick Start Guide

## 1. Instalación Inicial

```bash
# En tu máquina (iMac, WS o TO)
bash ~/Downloads/saa-bootstrap-v11-setup.sh

# Verificar instalación
bash ~/SAA_v11/scripts/installation/saa-system-install-v11a.sh
```

## 2. Configuración GitHub

```bash
# Inicializar repositorio
cd ~/SAA_v11
bash scripts/installation/saa-init-github-v11a.sh tu-usuario saa-orchestrator
```

## 3. Usar Orquestador

```bash
# Orquestar nueva tarea
bash scripts/orchestration/saa-orchestrate-v11a.sh ~/SAA_v11 "Tu descripción"

# Sincronizar entre máquinas
bash scripts/orchestration/saa-sync-machines-v11a.sh ~/SAA_v11

# Verificar salud del sistema
bash scripts/monitoring/saa-health-check-v11a.sh ~/SAA_v11
```

## 4. Estructura de Módulos

Importar módulos en Python:

```python
import sys
sys.path.insert(0, '/path/to/SAA_v11')

from modules.ralph import RalphOrchestrator
from modules.llama_integration import LlamaArbitrator
from modules.evaluation import RazorEvaluator

# Instanciar
ralph = RalphOrchestrator()
llama = LlamaArbitrator(model_path="...", port=8000)
razor = RazorEvaluator()
```

## 5. Estructura de Directorios

- `scripts/` - Scripts ejecutables (bash)
- `modules/` - Módulos Python importables
- `config/` - Configuración centralizada
- `data/` - Datos (modelos, métricas, trades)
- `docs/` - Documentación
- `tests/` - Suite de pruebas

## Troubleshooting

### "command not found"
```bash
source config/.saa-config
export PATH=$SAA_SCRIPTS_DIR:$PATH
```

### "Git remote not configured"
```bash
bash scripts/installation/saa-init-github-v11a.sh
```

### "Módulos no importan"
```python
import sys
sys.path.insert(0, '/full/path/to/SAA_v11')
```
