# DevNeganSmith Headshots

Sistema ligero de **headshots letales configurables** para servidores **FiveM Qbox/QBX**.

> Creado y mantenido por **DevNeganSmith**.

## Características

- Detecta impactos reales en el hueso de la cabeza.
- Convierte un headshot válido en muerte inmediata.
- Puede limitarse únicamente a daño **jugador contra jugador**.
- Permite excluir armas desde `config.lua`.
- No requiere base de datos.
- No requiere llamadas directas a `qbx_core`.
- Incluye protección breve contra procesamiento duplicado del mismo evento.

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

## Compatibilidad

- FiveM / GTA V
- Qbox / QBX
- Puede convivir con sistemas médicos personalizados si no existe una lógica de muerte o invencibilidad incompatible.

Se recomienda probar especialmente la interacción con ambulancia, last stand y recursos que modifiquen daño.

## Documentación

Consulta [`DOCUMENTACION.md`](DOCUMENTACION.md) y [`TERMS.md`](TERMS.md).

## Licencia

Distribuido bajo **MIT License**. Consulta [`LICENSE`](LICENSE).

© 2026 **DevNeganSmith**
