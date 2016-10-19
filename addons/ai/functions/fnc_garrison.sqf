/*
 * Author: Kingsley
 * Garrisons the given units at the given position
 *
 * Arguments:
 * 0: Units <ARRAY>
 * 1: Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[unit1, unit2], [0,0,0]] call mars_ai_fnc_garrison;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_units", []],
    ["_pos", []]
];

if (_units isEqualTo [] || {_pos isEqualTo []}) exitWith {};

[QGVAR(garrison), [_pos, nil, _units, 150]] call CBA_fnc_serverEvent;
