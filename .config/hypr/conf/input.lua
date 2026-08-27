-- Keyboard, pointer, touchpad, and gestures.

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "altgr-intl",
        kb_options = "lv3:ralt_switch",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = { natural_scroll = false },
    },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })

return true
-- vim: ft=lua
