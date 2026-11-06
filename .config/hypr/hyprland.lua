require("./config/monitors")
require("./config/env")
require("./config/rules")
require("./config/binds")
require("./config/autostart")

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,

        col = {
            active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing = true,

        layout = "master",
    },

    render = {
        cm_auto_hdr = 0,
    },

    decoration = {
        rounding = 4,
        active_opacity = 1.0,
        inactive_opacity = 0.95,

        shadow = {
            enabled = true,
            range = 8,
            render_power = 3,
            color = 0xee1a1a1a,
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 2,
            vibrancy = 0.1696
        }
    },

    animations = {
        enabled = false,
    },

    master = {
        new_status = "slave",
    },

    cursor = {
        no_warps = true,
        persistent_warps = true,
    },

    input = {
        repeat_rate = 50,
        repeat_delay = 250,
        accel_profile = "flat",
        kb_layout = "us,se",
        kb_options = "grp:win_space_toggle",
        numlock_by_default = true,
    },

    binds = {
        allow_workspace_cycles = true,
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})
