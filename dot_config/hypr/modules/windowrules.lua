-- =========================================================================
--                          Window Rules
-- =========================================================================

-- Picture in Picture (Generic)
hl.window_rule({
    name = "pip-generic",
    float = true,
    match = { class = "^$", title = "^(Picture in picture)$" }
})

-- File Dialogs
hl.window_rule({
    name = "save-file",
    float = true,
    match = { class = "^$", title = "^(Save File)$" }
})

hl.window_rule({
    name = "open-file",
    float = true,
    match = { class = "^$", title = "^(Open File)$" }
})

-- Audio Control
hl.window_rule({
    name = "audio-control",
    float = true,
    workspace = "special:essential",
    match = { class = "^(com.saivert.pwvucontrol)$" }
})

-- VPN
hl.window_rule({
    name = "amnezia-vpn",
    float = true,
    workspace = "special:essential",
    match = { title = "^(AmneziaVPN)$" }
})

-- Bluetooth Manager (Overskride)
hl.window_rule({
    name = "overskride",
    float = true,
    size = "1000 600",
    workspace = "special:essential",
    match = { class = "^(io.github.kaii_lb.Overskride)$" }
})

-- Portals
hl.window_rule({
    name = "portals",
    float = true,
    match = { class = "^(xdg-desktop-portal-gtk|xdg-desktop-portal-kde|xdg-desktop-portal-hyprland)(.*)$" }
})

-- Polkit Agent
hl.window_rule({
    name = "polkit-agent",
    float = true,
    center = true,
    dim_around = true,
    opacity = 0.8,
    stay_focused = true,
    match = { class = "^(polkit-mate-authentication-agent-1)(.*)$" }
})

-- Steam Updater
hl.window_rule({
    name = "steam-updater",
    float = true,
    match = { class = "^$", title = "^(Steam - Self Updater)$" }
})

-- Nautilus Opacity
hl.window_rule({
    name = "nautilus-opacity",
    opacity = 0.85,
    match = { class = "^(org.gnome.Nautilus)$" }
})

-- Vesktop Opacity
hl.window_rule({
    name = "vesktop-opacity",
    opacity = 0.96,
    match = { class = "^(vesktop)$" }
})

-- Telegram Opacity & Focus
hl.window_rule({
    name = "telegram-rules",
    opacity = 0.96,
    focus_on_activate = false,
    match = { class = "^(org.telegram.desktop)$" }
})

-- Specific Picture-in-Picture
hl.window_rule({
    name = "pip-specific",
    float = true,
    size = "960 540",
    match = { title = "^(Picture-in-Picture)$" }
})

-- Nautilus Previewer (Detailed)
hl.window_rule({
    name = "nautilus-preview",
    float = true,
    center = true,
    no_max_size = true,
    border_size = 0,
    no_shadow = true,
    dim_around = true,
    opacity = 0.95,
    pin = true,
    stay_focused = true,
    match = { class = "^(org.gnome.NautilusPreviewer)$" }
})

-- Scratchpads (Messaging)
hl.window_rule({
    name = "vesktop-scratchpad",
    workspace = "special:messaging silent",
    match = { class = "^(vesktop)$" }
})

hl.window_rule({
    name = "telegram-scratchpad",
    workspace = "special:messaging silent",
    match = { class = "^(org.telegram.desktop)$" }
})


-- =========================================================================
--                          Layer Rules
-- =========================================================================

hl.layer_rule({
    name = "wofi-rule",
    dim_around = true,
    blur = true,
    ignore_alpha = 0.0,
    match = { namespace = "wofi" }
})

hl.layer_rule({
    name = "logout-dialog-rule",
    animation = "slide top",
    blur = true,
    match = { namespace = "logout_dialog" }
})

hl.layer_rule({
    name = "waybar-rule",
    animation = "no",
    blur = true,
    ignore_alpha = 0.0,
    match = { namespace = "waybar" }
})

hl.layer_rule({
    name = "wallpaper-rule",
    animation = "fade 50%",
    match = { namespace = "wallpaper" }
})

hl.layer_rule({
    name = "notifications-rule",
    animation = "fade",
    blur = true,
    ignore_alpha = 0.0,
    match = { namespace = "notifications" }
})
