/*
 * Author: ACE3 Project, Kingsley
 * Processes the change in mouse position for the editor camera
 *
 * Arguments:
 * 0: Mouse x coord <NUMBER>
 * 1: Mouse y coord <NUMBER>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [0.5, 0.5] call mars_editor_fnc_handleMouse;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_x", "_y"];

private _leftButton = GVAR(mouse) select 0;
private _rightButton = GVAR(mouse) select 1;

private _oldX = GVAR(mousePos) select 0;
private _oldY = GVAR(mousePos) select 1;

// Get change in pos
private _deltaX = _oldX - _x;
private _deltaY = _oldY - _y;

if (_rightButton) then {
    if (!GVAR(mapOpen)) then {
        // Pan/Tilt amount should be influnced by zoom level (it should really be exponential)
        private _zoomMod = (GVAR(camZoom) * GVAR(camPanSpeedCoef)) max 0.5;

        GVAR(camPan) = GVAR(camPan) - ((_deltaX * 360) / _zoomMod);
        GVAR(camTilt) = ((GVAR(camTilt) + ((_deltaY * 180) / _zoomMod)) min 89) max -89;
    };
};

GVAR(mousePos) = [_x, _y];
