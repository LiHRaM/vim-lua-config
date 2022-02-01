-- FWIW: the `...` evaluates to the string that was used to include the current module.
-- I use them throughout this configuration to make it easier to refer to relative locations.

require(... .. ".options")
return require(... .. ".plugins")
