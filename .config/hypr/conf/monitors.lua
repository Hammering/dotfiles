-- Monitor layout.

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = 1,
    transform = 3,
})

hl.monitor({
    output = "DP-3",
    mode = "2560x1440@60",
    position = "1080x0",
    scale = 1,
    transform = 0,
})

hl.monitor({
    output = "DP-2",
    mode = "1920x1080@60",
    position = "3640x0",
    scale = 1,
    transform = 3,
})

return true
