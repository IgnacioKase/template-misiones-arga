# Sentencias

## Uso del comando "setVariable":
(#TODO: escribir explicación)
> [Documentación oficial](https://community.bistudio.com/wiki/setVariable)

## Sentencias de VCOM:
Todos estos parámetros son booleanos, es decir toman valores de **true** o **false**.
	
		(group this) setVariable ["VCM_NOFLANK",true];
		(group this) setVariable ["VCM_NORESCUE",true];
		(group this) setVariable ["VCM_TOUGHSQUAD",true];
		(group this) setVariable ["Vcm_Disable",true];
		(group this) setVariable ["VCM_DisableForm",true];
		(group this) setVariable ["VCM_Skilldisable",true];

 - **VCM_NOFLANK**: Impide a la IA de realizar movimientos avanzados, tales como el flanqueo.
 - **VCM_NORESCUE**: Evita que la IA acuda a los pedidos de refuerzo.
 - **VCM_TOUGHSQUAD**: Evita que la IA pida refuerzos.
 - **Vcm_Disable**: Desactiva la VCOM completamente en el grupo.
 - **VCM_DisableForm**: Impide a VCOM cambiar la formación del grupo.
 - **VCM_Skilldisable**: Evita que VCOM cambie la skills de las unidades.

