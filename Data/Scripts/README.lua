--[[
    Basic Custom Player Animation with IK
    By KoalaEsper
    
    The script is set up to listen for when abilities are activated, and then
    search for coressponding IK Anchors to activate.
    For now the animations will lock player in place.
    Abilities should have unique names, and IK anchors should be named as
    <ability>_<phase>_<part>

    The last part is only relevant for body anchor, in which a new, fixed one
    will be spawned and activated.
    This is due to how if attached, player will keep on rotating.
    For now 

    That's pretty much it. Duplicate or Add Abilities and IK Anchors.
    Position them, and the script will handle the rest.
]]--