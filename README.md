# DevNeganSmith Headshots

Recurso ligero para **FiveM** que convierte en letal un disparo válido en la cabeza de un jugador.

## ¿Qué hace?

- Detecta impactos reales en el hueso de la cabeza.
- Mata inmediatamente al jugador cuando el impacto cumple las condiciones configuradas.
- Puede limitarse únicamente a daño **jugador contra jugador**.
- Permite excluir armas mediante `config.lua`.
- No requiere base de datos.
- Diseñado para funcionar de forma independiente y ser compatible con servidores Qbox/QBX.

## Instalación rápida

1. Copia la carpeta `devnegansmith_headshots` dentro de `resources`.
2. Añade en tu `server.cfg`:

```cfg
ensure devnegansmith_headshots
```

3. Reinicia el recurso o el servidor.

## Configuración

La configuración principal se encuentra en `config.lua`.

```lua
Config.Enabled = true
Config.PlayerVsPlayerOnly = true
```

También puedes añadir armas a `Config.ExcludedWeapons` para impedir que activen el headshot letal.

## Compatibilidad

- FiveM / GTA V
- Qbox / QBX
- No depende de ESX ni QBCore para su lógica principal
- Puede convivir con recursos de ambulancia siempre que estos no sobrescriban de forma incompatible el evento de daño

## Autor

**DevNeganSmith**

Versión: `1.0.0`
