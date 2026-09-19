# Documentación - DevNeganSmith Headshots

## Descripción

`devnegansmith_headshots` es un recurso client-side para FiveM que escucha el evento nativo de daño de red y verifica si el jugador local recibió un disparo válido en el hueso de la cabeza.

Cuando se cumplen todas las condiciones configuradas, el recurso establece la vida de la víctima en `0`, provocando una muerte inmediata por headshot.

## Archivos

### `fxmanifest.lua`
Define el recurso, autor, versión y archivos que FiveM debe cargar.

### `config.lua`
Contiene las opciones configurables del recurso.

### `client.lua`
Contiene la detección del daño y la lógica del headshot letal.

## Configuración

### Activar o desactivar

```lua
Config.Enabled = true
```

- `true`: el sistema está activo.
- `false`: el recurso permanece cargado, pero no aplica headshots letales.

### Solo jugador contra jugador

```lua
Config.PlayerVsPlayerOnly = true
```

Con `true`, solo un atacante controlado por otro jugador puede activar el headshot letal. Esto evita que NPCs, caídas, vehículos u otras fuentes de daño se interpreten como un headshot válido.

### Armas excluidas

```lua
Config.ExcludedWeapons = {
    [`WEAPON_UNARMED`] = true,
    [`WEAPON_STUNGUN`] = true,
}
```

Añade aquí cualquier arma que no deba activar la muerte inmediata.

## Funcionamiento interno

El recurso escucha:

```lua
CEventNetworkEntityDamage
```

Después comprueba:

1. Que el sistema esté habilitado.
2. Que la víctima sea el jugador local.
3. Que exista un atacante válido.
4. Que, si está configurado, el atacante sea otro jugador.
5. Que el atacante utilice un arma de fuego.
6. Que el arma no esté en la lista de exclusión.
7. Que el último hueso dañado sea el de la cabeza (`31086`).

Si todo es válido, establece la salud de la víctima en `0`.

El recurso incluye además una protección corta de 250 ms para evitar que el mismo evento de daño se procese dos veces de forma accidental.

## Instalación

Coloca:

```text
resources/[standalone]/devnegansmith_headshots
```

o en la categoría de recursos que utilices.

Después añade:

```cfg
ensure devnegansmith_headshots
```

## Dependencias

No tiene dependencias obligatorias externas.

## Consideraciones de compatibilidad

El recurso modifica el resultado final del daño de un headshot válido. Si otro script controla muerte, invencibilidad, daño, estados `laststand` o sistemas médicos personalizados, conviene probar la interacción en servidor antes de producción.

No modifica directamente Qbox/QBX, inventarios ni base de datos.

## Autor y versión

- Autor: **DevNeganSmith**
- Recurso: `devnegansmith_headshots`
- Versión: `1.0.0`
