local apps = require("./config/applications")

local mod = "SUPER"
-- general
hl.bind(mod .. " + SHIFT + Return", hl.dsp.exec_cmd(apps.terminal))
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + E", hl.dsp.exit())
hl.bind(mod .. " + Z", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + P", hl.dsp.exec_cmd(apps.menu))
hl.bind(mod .. " + SHIFT + P", hl.dsp.exec_cmd(apps.browser))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mod .. " + M", hl.dsp.window.fullscreen({ action = "toggle", mode = "maximized" }))
hl.bind(mod .. " + Tab", hl.dsp.focus({ workspace = "previous" }))

-- util
hl.bind(mod .. " + W", hl.dsp.exec_cmd(apps.cycle_wallpaper))
hl.bind(mod .. " + S", hl.dsp.exec_cmd(apps.screenshot))

-- media
hl.bind("Xf86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind("Xf86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))
hl.bind("Xf86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))

-- master/slave windows
hl.bind(mod .. " + J", hl.dsp.layout("cyclenext"))
hl.bind(mod .. " + K", hl.dsp.layout("cycleprev"))
hl.bind(mod .. " + SHIFT + J", hl.dsp.layout("swapnext"))
hl.bind(mod .. " + SHIFT + K", hl.dsp.layout("swapprev"))
hl.bind(mod .. " + SHIFT + H", hl.dsp.layout("addmaster"))
hl.bind(mod .. " + SHIFT + L", hl.dsp.layout("removemaster"))
hl.bind(mod .. " + H", hl.dsp.layout("mfact -0.05")) -- decrease master area
hl.bind(mod .. " + L", hl.dsp.layout("mfact +0.05")) -- increase master area

-- resize/move windows w/ mouse
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- workspaces
for i = 1, 9 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end
