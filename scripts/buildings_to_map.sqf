/*
          Externo encontrado por: Vultur
          Link: https://steamcommunity.com/app/107410/discussions/0/412447331648476799/
          
          Hay que crear un marcador para cubrir todo el mapa o el área donde se desea que 
          aparezcan los nuevos marcadores de construcción. 
          Llámalo Marker1 o como se quiera. Copiar el siguiente código y colócarlo en init.sqf
*/

if (isServer) then {

////Find marker and get the size

_mkr= "Marker1";        /*********** ACA VA EL NOMBRE DEL MARCADOR ***********/
_mkr setmarkerAlpha 0;
_pos=markerpos _mkr;
_mkrY= getmarkerSize _mkr select 0;
_mkrX= getmarkerSize _mkr select 1;
_distance= _mkrX;
if (_mkrY > _mkrX)
then {
_distance=_mkrY;
};

////Create New House Markers

_HouseArray = ["Building","House"];
_nearestBuildings = nearestObjects [_pos, _HouseArray, _distance];
{

_x setVectorUp [0,0,1];
_x enableSimulation false;

_boundingBox = boundingBox _x;
_dir = getDir _x;
_position = getPosATL _x;

_size = _boundingBox select 1;
_size resize 1.5;
_markername = "marker" + str(floor(random 500)) + str(floor(random 500));
//Marker creation
createMarker [_markername, _position];
_markername setMarkerShape "RECTANGLE";
_markername setMarkerSize _size;
_markername setMarkerBrush "SolidFull";
_markername setMarkerColor "ColorGrey";
_markername setMarkerDir _dir;
} forEach _nearestBuildings;
};
