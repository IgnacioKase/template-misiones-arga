# Bengalas

* Colocar en la carpeta scripts el archivo **settings_bengalas.sqf**
* Copiar la carpeta AL_flare_fix en la carpeta **scripts**
* En el archivo initServer.sqf colocar la siguiente linea:
  ~~~
    execVM "scripts\settings_bengalas.sqf";
  ~~~

* En los morteros vanilla colocor esta línea dentro del campo **init**
  
  ~~~
  this addEventHandler ["Fired",{private ["_al_flare"]; _al_flare = _this select 6;[[_al_flare],"scripts\AL_flare_fix\al_flare_enhance.sqf"] remoteExec ["execVM",0,true]}];
  ~~~
