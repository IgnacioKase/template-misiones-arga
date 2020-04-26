/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/

private _defaultDistance = _this select 0;
private _inAreaDistance = _this select 1;
private _color = "Vacio";
private _inArea = false;

try {
    if (getMarkerType "vision" == "Empty") then {
       _color = (getMarkerColor "vision");
    }
    else {
        if (isServer) then {
            systemChat "No se encontro marcador con color de ejemplo. El mismo deberia llevar de nombre de variable: vision. Ademas debe ser tipo Empty";
        };
    };
};

if(_color == "Vacio")then{
    exit;
};

{
    if ((getMarkerType _x != "Empty") && ((getMarkerColor _x) == _color)) then {
        _x setMarkerAlphaLocal 0;
    };
} forEach allMapMarkers;

while {true} do {
    _inArea = false;

    {
        if ((getMarkerType _x != "Empty") && ((getMarkerColor _x) == _color) && !_inArea) then {
            if (player inArea _x)then{
                _inArea = ((getPos player) select 2) < 20;
            };
        };
    } forEach allMapMarkers;

    if (viewDistance == _defaultDistance && _inArea) then {
        setViewDistance _inAreaDistance;
    };

    if (viewDistance == _inAreaDistance && !_inArea) then {
        setViewDistance _defaultDistance;
    };
    
    sleep 5;
};

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/