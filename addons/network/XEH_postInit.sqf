#include "script_component.hpp"

// Exit on player clients that are not hosts
if (hasInterface && !isServer) exitWith {};

// Exit if HC transferring disabled
if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {_this call FUNC(handleDisconnect)}];
} else {
    // Register HC on server (this part happens on HC only)
    [QGVAR(connected), [player]] call CBA_fnc_serverEvent;
};
