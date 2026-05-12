-- =========================================================================
--                          Animations Configuration
-- =========================================================================

hl.config({
    animations = {
        enabled = true,
    }
})

hl.curve("md3_decel", {
    type = "bezier",
    points = { { 0.05, 0.7 }, { 0.1, 1 } }
})

hl.curve("md3_accel", {
    type = "bezier",
    points = { { 0.3, 0 }, { 0.8, 0.15 } }
})

hl.curve("linear", {
    type = "bezier",
    points = { { 0, 0 }, { 1, 1 } }
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 5.5,
    bezier = "md3_decel",
    style = "popin 85%"
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 4,
    bezier = "md3_accel",
    style = "popin 85%"
})

hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 5.5,
    bezier = "md3_decel"
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "default"
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 4,
    bezier = "md3_decel"
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 5.5,
    bezier = "md3_decel",
    style = "slidefade 15%"
})

hl.animation({
    leaf = "specialWorkspace",
    enabled = true,
    speed = 5.5,
    bezier = "md3_decel",
    style = "slidefadevert 15%"
})
