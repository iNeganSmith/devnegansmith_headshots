# DevNeganSmith Headshots

Sistema ligero de **headshots letales configurables** para FiveM, independiente del framework.

> Creado y mantenido por **DevNeganSmith**.

## Compatibilidad

| Entorno | Estado |
|---|---|
| Standalone | ✅ Compatible |
| ESX Legacy | ✅ Compatible |
| QBCore | ✅ Compatible |
| Qbox / QBX | ✅ Compatible |

El recurso no utiliza APIs, callbacks, exports ni eventos propios de ningún framework.

## Características

- Detecta impactos reales en el hueso de la cabeza.
- Convierte un headshot válido en muerte inmediata.
- Puede limitarse únicamente a daño jugador contra jugador.
- Permite excluir armas desde `config.lua`.
- No requiere base de datos ni SQL.
- No requiere `ox_lib`, `ox_target`, ESX, QBCore ni `qbx_core`.
- Incluye una protección breve contra procesamiento duplicado del mismo evento.
- Funciona completamente del lado del cliente.

## Dependencias

Ninguna dependencia externa.

## Instalación

1. Coloca `devnegansmith_headshots` dentro de tus recursos.
2. Añade en `server.cfg`:

```cfg
ensure devnegansmith_headshots
```

3. Reinicia el recurso o el servidor.

## Configuración rápida

```lua
Config.Enabled = true
Config.PlayerVsPlayerOnly = true
```

Puedes excluir armas desde `Config.ExcludedWeapons`.

## Compatibilidad con ambulancia, last stand y sistemas médicos

La compatibilidad con **ESX, QBCore y Qbox** está cubierta porque el recurso no depende del framework.

Sin embargo, al confirmar un headshot válido el recurso utiliza:

```lua
SetEntityHealth(victim, 0)
```

Por ello se recomienda probarlo con cualquier recurso que modifique:

- estado de muerte;
- last stand;
- heridas;
- sangrado;
- invencibilidad;
- revive;
- respawn;
- protección de daño.

Ejemplos: `esx_ambulancejob`, `qb-ambulancejob`, `qbx_ambulancejob`, Wasabi Ambulance, ARS Ambulance u otros sistemas médicos personalizados.

Esto no significa que sean incompatibles; significa que la lógica médica puede cambiar el resultado esperado y debe validarse en el servidor donde se instale.

## Pruebas recomendadas

- disparo en cabeza de jugador;
- disparo al cuerpo;
- arma excluida;
- daño producido por NPC;
- interacción con last stand;
- interacción con ambulancia;
- revive y respawn;
- recursos que alteren daño o invencibilidad.

## Documentación

Consulta [`DOCUMENTACION.md`](DOCUMENTACION.md) y [`TERMS.md`](TERMS.md).

## Licencia

Distribuido bajo **MIT License**. Consulta [`LICENSE`](LICENSE).

© 2026 **DevNeganSmith**
