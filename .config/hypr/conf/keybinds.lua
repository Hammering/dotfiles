-- Keyboard and mouse bindings.

local mainMod = "SUPER"
local mainMod2 = "ALT"
local function bind(key, dispatcher, opts)
    hl.bind(mainMod .. " + " .. key, dispatcher, opts)
end
local function bind_exec(key, command, opts)
    bind(key, hl.dsp.exec_cmd(command), opts)
end
bind_exec("Return", terminal)
bind_exec("SHIFT + Return", "librewolf")
bind("C", hl.dsp.window.close())
hl.bind("Print", hl.dsp.exec_cmd("~/.custom/screenshot_wayland.sh region"), { locked = true })
bind_exec("SHIFT + P", "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit")
bind_exec("F", fileManager)
bind("V", hl.dsp.window.float({ action = "toggle" }))
bind_exec("D", menu)
bind_exec("CTRL + L", lock)
bind_exec("Tab", "rofi -show window")
bind_exec("O", "rofi -show ssh")
bind("Backspace", hl.dsp.layout("togglesplit"))
bind("SHIFT + Space", hl.dsp.window.float({ action = "toggle" }))
bind("N", hl.dsp.window.fullscreen({ mode = 0 }))

hl.bind(mainMod .. " + " .. mainMod2 .. " + P", hl.dsp.exit())
--bind("Y", hl.dsp.focus({ direction = "parent" }))
--bind("U", hl.dsp.focus({ direction = "child" }))

local monitorDirections = { H = "left", J = "down", K = "up", L = "right" }
for key, direction in pairs(monitorDirections) do
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.workspace.move({ monitor = direction }))
    bind(key, hl.dsp.focus({ direction = direction }))
    hl.bind(mainMod .. " + " .. mainMod2 .. " + " .. key, hl.dsp.window.move({ direction = direction }))
end

local workspaces = { ["1"] = 1, ["2"] = 2, ["3"] = 3, ["4"] = 4, ["5"] = 5, Q = 6, W = 7, E = 8, R = 9, T = 10, ["6"] = 11, ["7"] = 12, ["8"] = 13, ["9"] = 14, ["0"] = 15 }
for key, workspace in pairs(workspaces) do
    bind(key, hl.dsp.focus({ workspace = workspace }))
    hl.bind(mainMod .. " + " .. mainMod2 .. " + " .. key, hl.dsp.window.move({ workspace = workspace, follow = false }))
end

bind("S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
bind("mouse_down", hl.dsp.focus({ workspace = "e+1" }))
bind("mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

local media = {
    XF86AudioRaiseVolume = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+",
    XF86AudioLowerVolume = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
    XF86AudioMute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
    XF86AudioMicMute = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle",
    XF86MonBrightnessUp = "brightnessctl -e4 -n2 set 5%+",
    XF86MonBrightnessDown = "brightnessctl -e4 -n2 set 5%-",
}
for key, command in pairs(media) do
    hl.bind(key, hl.dsp.exec_cmd(command), { locked = true, repeating = true })
end
for key, command in pairs({ XF86AudioNext = "playerctl next", XF86AudioPause = "playerctl play-pause", XF86AudioPlay = "playerctl play-pause", XF86AudioPrev = "playerctl previous" }) do
    hl.bind(key, hl.dsp.exec_cmd(command), { locked = true })
end

return true
-- vim: ft=lua
