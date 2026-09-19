# Documentación - DevNeganSmith Headshots

## Descripción

`devnegansmith_headshots` es un recurso client-side para **FiveM Qbox/QBX** que escucha el evento nativo de daño de red y verifica si el jugador local recibió un impacto válido en la cabeza.

Cuando se cumplen las condiciones configuradas, el recurso establece la vida de la víctima en `0`, produciendo una muerte inmediata.

## Archivos

### `fxmanifest.lua`
Define el recurso, autor, versión y archivos cargados por FiveM.

### `config.lua`
Contiene las opciones configurables.

### `client.lua`
Contiene la detección del daño y la lógica del headshot letal.

## Configuración

### Activar o desactivar

```lua
Config.Enabled = true
```

### Solo jugador contra jugador

```lua
Config.PlayerVsPlayerOnly = true
```

Con `true`, el atacante debe ser otro jugador.

### Armas excluidas

```lua
Config.ExcludedWeapons = {
    [`WEAPON_UNARMED`] = true,
    [`WEAPON_STUNGUN`] = true,
}
```

Añade aquí cualquier arma que no deba activar la muerte inmediata.

## Funcionamiento interno

El recurso escucha `CEventNetworkEntityDamage` y comprueba que el sistema esté activo, que exista un atacante válido, que se cumpla la condición PvP, que el arma sea válida y que el último hueso dañado sea la cabeza (`31086`).

Si todo es válido, establece la salud de la víctima en `0`. Incluye una protección corta para evitar procesar dos veces el mismo evento.

## Dependencias

No requiere dependencias externas ni llamadas directas a `qbx_core`.

## Instalación

```text
resources/[devnegansmith]/devnegansmith_headshots
```

```cfg
ensure devnegansmith_headshots
```

## Pruebas recomendadas

- disparo en cabeza de jugador;
- disparo al cuerpo;
- arma excluida;
- daño producido por NPC;
- interacción con last stand;
- interacción con ambulancia;
- respawn y revivir;
- recursos que alteren daño o invencibilidad.

## Autor

- Autor: **DevNeganSmith**
- Recurso: `devnegansmith_headshots`
- Framework objetivo: **Qbox / QBX**
- Versión: `1.0.0`

## Licencia y términos

Código bajo **MIT License**. Consulta [`LICENSE`](LICENSE) y [`TERMS.md`](TERMS.md).
