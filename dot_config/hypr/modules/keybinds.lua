-- =========================================================================
--                                 Keybinds
-- =========================================================================

local home             = os.getenv("HOME")

-- Variables
local terminal         = "kitty"
local filemanager      = "nautilus --new-window"
local applauncher      = home .. "/.config/hypr/scripts/wofi-launch.sh"
local wallpaperchanger = home .. "/.config/hypr/scripts/wofi-wallpaper.sh"
local clipbuffer       = home .. "/.config/hypr/scripts/wofi-cliphist.sh"
local volume           = home .. "/.config/hypr/scripts/volume.sh"

-- Screenshots
local shot_region      = "grimblast --freeze copy area"
local shot_window      = "grimblast --freeze copy active"
local shot_screen      = "grimblast --freeze copy output"

local mainMod          = "SUPER"

-- Application launchers
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(filemanager))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd('loginctl terminate-user ""'))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(applauncher))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(wallpaperchanger))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipbuffer))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + BackSpace", hl.dsp.exec_cmd("wlogout"))

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(shot_region))
hl.bind("Print", hl.dsp.exec_cmd(shot_screen))

-- ======= Volume Control =======
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(volume .. " raise"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(volume .. " lower"), { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(volume .. " mute"), { repeating = true, locked = true })

-- ======= Playback Control =======
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"))

-- ======= Window Actions =======

-- Move and resize windows with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Floating windows
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))

-- Move active window
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" }))

-- Move focus
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- =========================================================================
--                         Resizing Submap
-- =========================================================================

-- Activate resizing mode
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
    hl.bind("l", hl.dsp.window.resize({ x = 15, y = 0, relative = true }), { repeating = true })
    hl.bind("h", hl.dsp.window.resize({ x = -15, y = 0, relative = true }), { repeating = true })
    hl.bind("k", hl.dsp.window.resize({ x = 0, y = -15, relative = true }), { repeating = true })
    hl.bind("j", hl.dsp.window.resize({ x = 0, y = 15, relative = true }), { repeating = true })

    -- Exit submap
    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Quick resize with keyboard
hl.bind(mainMod .. " + CTRL + SHIFT + l", hl.dsp.window.resize({ x = 15, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + h", hl.dsp.window.resize({ x = -15, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + k", hl.dsp.window.resize({ x = 0, y = -15, relative = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + j", hl.dsp.window.resize({ x = 0, y = 15, relative = true }))

-- ======= Workspace Actions =======

-- Workspaces 1-10
for i = 1, 10 do
    local key = tostring(i % 10) -- Maps workspace 10 to key 0

    -- Move active window to workspace and switch
    hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i }))

    -- Move active window to workspace silently
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, silent = true }))

    -- Switch to workspace
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
end

-- Relative workspace switching
hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ workspace = "e+1" }))

-- Special workspaces (scratchpads)
hl.bind(mainMod .. " + D", hl.dsp.workspace.toggle_special("messaging"))
hl.bind(mainMod .. " + C", hl.dsp.workspace.toggle_special("essential"))

-- ======= Additional Settings =======

hl.config({
    binds = {
        allow_workspace_cycles = true,
        workspace_back_and_forth = true,
        workspace_center_on = true,
        movefocus_cycles_fullscreen = true,
        window_direction_monitor_fallback = true,
    }
})
