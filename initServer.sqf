enableSaving [false, false];
enableTeamSwitch false;

_allMarkers = (missionConfigFile >> "Mission" >> "Mission" >> "Entities");

_center = createCenter sideLogic;
_group = createGroup _center;

for "_i" from 1 to ((count _allMarkers) - 1) do {
    if (getText(_allMarkers select _i >> "dataType") == "Marker") then {

        _mkName = getText(_allMarkers select _i >> "name");
        _originalMarker = _mkName;

        _mkPos = getMarkerPos _mkName;
        _mkDir = markerDir _mkname;

        _find = [_mkName, "_"] call CBA_fnc_find;

        if (_find > -1) then {
            _mkName = [_mkName, "_"] call CBA_fnc_split;

            if (([(_mkName select 0), 0, 3] call CBA_fnc_substr) == "DNA") then {
                _helper = createVehicle ["VR_Area_01_circle_4_yellow_F", [0 + (random(150)), 0 + (random(150)),50 + 0 + (random(150))], [], 0, "NONE"];

                _mkPos set [2, 0.5];
                _helper setPosATL _mkPos;
                _helper setDir _mkDir;
                _helper setVectorUp [0,0,0];
            };
        };
    };
};