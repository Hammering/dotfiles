-- Hyprland Lua configuration.
-- Split by concern; paths in require() are relative to this file.

require("conf.monitors")
require("conf/programs")
require("conf/autostart")
require("conf/environment")
require("conf/look-and-feel")
require("conf/input")
require("conf/keybinds")
require("conf/window-rules")
require("conf/permissions")

return true

-- vim: ft=lua
-- hyprland.lua is loaded instead of hyprland.conf on Hyprland 0.55+.
-- Keep hyprland.conf as a rollback/reference copy until the Lua config is verified.
