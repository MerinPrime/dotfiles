-- =========================================================================
--                          Layout & Variables
-- =========================================================================

hl.config({
    general = {
        gaps_in = 8,
        gaps_out = 14,
        border_size = 3,
        ["col.active_border"] = ACTIVE_BORDER,
        ["col.inactive_border"] = INACTIVE_BORDER,
        layout = "dwindle",
        allow_tearing = false,
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0,
        vrr = 2,
        focus_on_activate = true,
    },

    ecosystem = {
        no_donation_nag = true,
        no_update_news = true,
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },
})
