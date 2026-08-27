-- Appearance, layout, animations, and miscellaneous settings.

hl.config({
    general = {
        gaps_in = 1,
        gaps_out = 5,
        border_size = 2,
        col = {
            active_border = { colors = { "rgba(6C00E0ee)", "rgba(ff7b00ee)" }, angle = 225 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    
    cursor = {
		no_warps = true,
		warp_on_change_workspace = 0,
	},

    dwindle = {
         force_split = 2,
         preserve_split = true,
         smart_split = false,
     },

     scrolling = {
         direction = "down",
         column_width = 1.0,
         fullscreen_on_one_column = false,
     },
      
    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 0.90,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a,
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },

    },
    
    ecosystem = {
        enforce_permissions = true,
    },
        
    animations = { enabled = true },

    master = { new_status = "master" },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },
})

local curves = {
    { "easeOutQuint", 0.23, 1, 0.32, 1 },
    { "easeInOutCubic", 0.65, 0.05, 0.36, 1 },
    { "linear", 0, 0, 1, 1 },
    { "almostLinear", 0.5, 0.5, 0.75, 1 },
    { "quick", 0.15, 0, 0.1, 1 },
}
for _, curve in ipairs(curves) do
    hl.curve(curve[1], { type = "bezier", points = { { curve[2], curve[3] }, { curve[4], curve[5] } } })
end

local animations = {
    { "global", 10, "default" },
    { "border", 5.39, "easeOutQuint" },
    { "windows", 4.79, "easeOutQuint" },
    { "windowsIn", 4.1, "easeOutQuint", "popin 87%" },
    { "windowsOut", 1.49, "linear", "popin 87%" },
    { "fadeIn", 1.73, "almostLinear" },
    { "fadeOut", 1.46, "almostLinear" },
    { "fade", 3.03, "quick" },
    { "layers", 3.81, "easeOutQuint" },
    { "layersIn", 4, "easeOutQuint", "fade" },
    { "layersOut", 1.5, "linear", "fade" },
    { "fadeLayersIn", 1.79, "almostLinear" },
    { "fadeLayersOut", 1.39, "almostLinear" },
    { "workspaces", 1.94, "almostLinear", "fade" },
    { "workspacesIn", 1.21, "almostLinear", "fade" },
    { "workspacesOut", 1.94, "almostLinear", "fade" },
    { "zoomFactor", 7, "quick" },
}
for _, animation in ipairs(animations) do
    local config = { leaf = animation[1], enabled = true, speed = animation[2], bezier = animation[3] }
    if animation[4] then config.style = animation[4] end
    hl.animation(config)
end

return true
-- vim: ft=lua
