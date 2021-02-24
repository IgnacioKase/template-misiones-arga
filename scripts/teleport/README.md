# Teleport

Script para teletranportar tropa de un lugar a otro en misiones que se quiere comenzar en un lugar determinado y se quiere planificar en misión y permitir la entrada de jugadores en un período anterior al comienzo de la misión.

Copiar a la carpeta scripts la carpeta **teleport**

## Instrucciones
* Colocar **execVM"scripts\teleport\teleport_inicio.sqf";** en el archivo **initPlayerLocal.sqf**.
* Colocar dentro de la clase **CfgSounds** **#include "scripts\teleport\sounds.hpp"** en el archivo **description.ext**.
  Ejemplo:
    ~~~
    class CfgSounds {
        sounds[] = {};
    #include "core\sounds.hpp"
    #include "scripts\teleport\sounds.hpp"
    };
    ~~~

* Poner algún objeto desde donde se disparará la acción con un addAction y colocarle un nombre de variable. Ej.: **VUL_MASTIL**
* Poner un **activador** (o varios) que delimiten una zona donde todas las unidades que esten dentro del mismo se transportaran a un destino determinado. Se le debe colocar al nombre de la variable un valor como por ejemplo **teleport_a_delta_alfa**
* Poner en el lugar de destino tantos **marcadores** como activadores se pusieron. Deben tener un nombre de variable. Ej.: **delta_alfa**
* En el archivo **teleport_inicio.sqf** dentro de la carpeta **teleport** se ve lo siguiente:
  ~~~
    private _teleport_data = [
        [
            [teleport_a_delta_alfa,"delta_alfa"],      // Origen,"destino"
            [teleport_a_charlie_alfa,"charlie_alfa"]
        ],
        VUL_MASTIL
    ];
  ~~~
  El nombre del activador es el origen, el del marcador el de destino. Este último va entre comillas siempre. Cada renglon es un par origen, destino. Todas las lineas deben terminar con coma, excepto la última. El nombre **VUL_MASTIL** se debe cambiar por el que se puso en el objeto al cual se le agregará un addAction
* En el archivo **teleport.sqf** dentro de la carpeta **teleport** en la linea 11 se ve algo similar a:
  ~~~
    private _authorizedUID = [];
  ~~~
  En la misma se debe poner el número UID de los que podrar activar el teletransportador. Dichos números deben ir entre comillas.
  En la línea 42 esta la instrucción setDate. Eso asegura que la misión comience en el horario que el editor elija.
  ~~~
    [[2021,8,22,18,48]] remoteExec ["setDate"];
  ~~~
  La línea 42 se usa para llamar a scripts que se quieren ejecutar cuando se activa la teletransportación
  ~~~
    [[], "scripts\delayTime.sqf"] remoteExec ["BIS_fnc_execVM", 0, false];
  ~~~
  La línea 44 remueve el addAction para que el transportador solo se pueda usar una vez. Cambiar el nombre **VUL_MASTIL** por el que se le puso al objeto donde se llama el addAction
  ~~~
    removeAllActions VUL_MASTIL;
  ~~~