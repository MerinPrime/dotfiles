-- =========================================================================
--                          Autostart Configuration
-- =========================================================================

hl.on("hyprland.start", function()
    -- Environment & DBus setup
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- Set initial workspace
    hl.dispatch(hl.dsp.focus({ workspace = 1 }))

    -- Core UI components
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("waybar")
    hl.exec_cmd("mako")

    -- Utilities & Polkit
    hl.exec_cmd("/usr/lib/mate-polkit/polkit-mate-authentication-agent-1")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Complex shell commands (WOB Overlay)
    hl.exec_cmd('sh -c "rm -f /tmp/wob.sock && mkfifo /tmp/wob.sock && tail -f /tmp/wob.sock | wob"')
end)
