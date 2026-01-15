# SAA v11 - Arquitectura

## Componentes Principales

### 1. Ralph Orchestrator
- **Rol**: Interpretador de tareas + Generador de propuestas
- **Motor**: Qwen7B-local (2-4s por tarea)
- **Entrada**: Descripción natural
- **Salida**: 3-5 propuestas de código

### 2. Llama Arbitrator  
- **Rol**: Validador técnico
- **Motor**: Phi-3.5 (GPU AMD)
- **Entrada**: Código Python
- **Salida**: Risk score + recomendaciones

### 3. Razor Evaluator
- **Rol**: Scoring multicriterio
- **Criterios**: Compilation, Logic, Performance, Quality, Maintainability
- **Entrada**: Propuestas validadas
- **Salida**: Ranking ordenado

### 4. Máquinas del Ecosistema

| Máquina | IP | Rol | LLMs |
|---------|----|----|------|
| iMac | 192.168.1.55 | Coordinador | Qwen7B, Qwen32B |
| WS | 192.168.1.160 | Generación | Qwen7B, Qwen32B, DeepSeek |
| TO | 192.168.1.180 | Execution | Backtest, Trading |

## Flujo de Ejecución

```
Usuario
  ↓
Ralph (Interpretar + Proponer) → 2-4s
  ↓
WS (Generar × 3-5 modelos) → 5-7s
  ↓
Llama (Validar técnico) → 0.3-0.5s × prop
  ↓
Razor (Evaluar integral) → 2s
  ↓
Decision Engine (Auto-approve si score > 0.85)
  ↓
Aider (Refinar - opcional) → 3-5s
  ↓
Backtest / Deploy (TO) → 5-30min
```

**Latencia total**: ~16 segundos (sin backtest)

## Configuración Centralizada

Todos los valores están en: `config/.saa-config`

Cargar: `source config/.saa-config`
