
1 spawn DNA_fnc_raceManager;

removeVest player;
removeHeadgear player;
removeUniform player;

sleep 0.1;

#include "mission_variables.sqf"

waitUntil {!isNull player};

_randomUniform = possible_uniforms call BIS_fnc_selectRandom;
_randomHead = possible_headgears call BIS_fnc_selectRandom;

player forceAddUniform _randomUniform;
player addHeadGear _randomHead;

if (!isDedicated) then {
    player action ["lightOn", vehicle player];

    setViewDistance 500;

    playMusic "main_intro";

    sleep _introWaitSeconds;

    while {(true)} do {
        playMusic "main_track";
        sleep _trackLoopSeconds;
    };
};