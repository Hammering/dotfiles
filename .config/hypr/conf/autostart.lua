-- Programs started with Hyprland.

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("waybar")
--    hl.exec_cmd("hypridle")
end)

return true
-- vim: ft=lua
