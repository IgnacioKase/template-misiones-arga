# Sentencias
(en general se ubican en el Init de objeto/personaje)

## Uso del comando "setVariable":
(#TODO: escribir explicación)
> [Documentación oficial](https://community.bistudio.com/wiki/setVariable)


## Sentencias ACE
-Ingeniero / Exp en Explosivos / Medico / Instalaciones / Piloto (el mismo debe ser ingeniero a su vez)
> Configura los roles

- **this setVariable ["ACE_IsEngineer",1,true];** //1 0 2 para personaje Ingeniero
- **this setVariable ["ACE_isEOD",1,true];** //Personaje Experto en Explosivos
- **this setVariable ["ace_medical_medicClass", 2, true];** //1 o 2 Personaje Medico
- **this setVariable ["ACE_isRepairVehicle", 1, true];** //Vehiculo de Reparacion
- **this setVariable ["ace_medical_medicClass",1, true];** //Vehiculo de Reparacion
- **this setVariable ["ACE_isRepairFacility", 1, true];** //Edificio de Reparacion

- **this setVariable ["ACE_GForceCoef",0.4];** // De 1 a 0, reduce la Fuerza G, 0 desabilita la fuerza G del personaje.


## Sentencias de VCOM:
Todos estos parámetros son booleanos, es decir toman valores de **true** o **false**.
	
 - **VCM_NOFLANK**: Impide a la IA de realizar movimientos avanzados, tales como el flanqueo.
 - **VCM_NORESCUE**: Evita que la IA acuda a los pedidos de refuerzo.
 - **VCM_TOUGHSQUAD**: Evita que la IA pida refuerzos.
 - **Vcm_Disable**: Desactiva la VCOM completamente en el grupo.
 - **VCM_DisableForm**: Impide a VCOM cambiar la formación del grupo.
 - **VCM_Skilldisable**: Evita que VCOM cambie la skills de las unidades.

		(group this) setVariable ["VCM_NOFLANK",true];
		(group this) setVariable ["VCM_NORESCUE",true];
		(group this) setVariable ["VCM_TOUGHSQUAD",true];
		(group this) setVariable ["Vcm_Disable",true];
		(group this) setVariable ["VCM_DisableForm",true];
		(group this) setVariable ["VCM_Skilldisable",true];



## IA inmovil
>(Tambien en ocupantes de vehiculos no le permite el movimiento)

- this disableAI "move"; // this disableAI "PATH";
> PATH: hace que la ai no se mueva pero gira para apuntarte.
MOVE: hace que la ai no se mueva ni gire regularmente.



## Sentencias para Arsenales

**Sentencia Arsenal Virtual**

- 0=["AmmoboxInit",[this,true]] spawn BIS_fnc_arsenal;

**Sentencia Arsenal ACE**

- [_box, true] call ace_arsenal_fnc_initBox;



## Sentencias adicionales para Vehiculos.

**Velocidad Maxima de Vehiculo por IA**

- This limitspeed "Numero";


**Banderas sobre vehiculo.**

- This forceFlagTexture "\A3\Data_F\Flags\Flag_uno_CO.paa"; // [Mas texturas de banderas](https://community.bistudio.com/wiki/Flag_Textures)


**Vehiculo sin transmision de daño para ocupantes:**

- this addEventHandler ["GetIn", {_unit = _this select 2; _unit allowDamage false;}]; this addEventHandler ["GetOut", {_unit = _this select 2; _unit allowDamage true;}];



## Sentencias de Ambiente.

**Sentencia textura cartel**

- this setObjectTextureGlobal [0,"Escudo1.jpg"];	

 >La imagen no se ajusta automaticamente limite del objeto, debe estar en carpeta de mision o subcarpeta imgs siendo "imgs/Escudo1.jpg"**


**Animacion Ambiental Fija** 
>(Ojo, en servidor puede transportarse al spawnear de su posicion original la IA).
- [this, "LISTEN_BRIEFING"] call BIS_fnc_ambientAnim;	// [Mas opciones](https://community.bistudio.com/wiki/BIS_fnc_ambientAnim)
