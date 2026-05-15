-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                     Monitor Configuration                   ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

hl.monitor({
    output = "DP-1",
    mode = "3440x1440@144.00hz",
    position = "0x0",
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60",
    position = "-1920x0",
})

hl.workspace_rule({
    workspace = "1",
    monitor = "DP-1",
    persistent = true,
})

hl.workspace_rule({
    workspace = "2",
    monitor = "HDMI-A-1",
    persistent = true,
})
