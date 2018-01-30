local redflat      = require("redflat")
local gears      = require("gears")
local awful      = require("awful")
awful.rules      = require("awful.rules")
require("awful.autofocus")
local wibox      = require("wibox")
local beautiful  = require("beautiful")
local naughty    = require("naughty")
local menubar = require("menubar")
local separator = redflat.gauge.separator.vertical()

-- | Theme | --
local env = require('env-config')
env:init({ theme = "blue" })

-- | Error handling | --

if awesome.startup_errors then
  naughty.notify({ preset = naughty.config.presets.critical,
  title = "Oops, something went wrong!",
  text = awesome.startup_errors })
end

do
  local in_error = false
  awesome.connect_signal("debug::error", function (err)
    if in_error then return end
    in_error = true

    naughty.notify({
      preset = naughty.config.presets.critical,
      title = "Oops, something went wrong!",
      text = err
    })
    in_error = false
  end)
end

-- Disable cursor animation:
local oldspawn = awful.util.spawn
awful.util.spawn = function (s)
  oldspawn(s, false)
end

-- Java GUI's fix:
awful.util.spawn_with_shell("wmname LG3D")

-- | Variable definitions | --
local exec   = function (s) oldspawn(s, false) end

modkey        = env.mod
tmux          = "termite -e tmux"
rootterm      = "sudo -i termite"
browser       = "google-chrome"
filemanager   = env.fm

-- | Table of layouts | --

local layouts =
{
  awful.layout.suit.tile,
  awful.layout.suit.tile.left,
  awful.layout.suit.floating
}

-- | Tags | --

tags = {}
for s = 1, screen.count() do
  tags[s] = awful.tag({ "Main", "Web", "Com", "Dev", "Ext" }, s, layouts[1])
end

-- | Menu | --

menu_main = {
  { "hibernate", "sudo pm-hibernate" },
  { "poweroff",  "sudo poweroff"     },
  { "restart",   awesome.restart     },
  { "reboot",    "sudo reboot"       },
  { "quit",      awesome.quit        }
}

mainmenu = awful.menu({
  items = {
    { " awesome",       menu_main   },
    { " file manager",  filemanager },
    { " root terminal", rootterm    },
    { " user terminal", terminal    }
  }
})

-- | Taglist | --
taglist = {}
taglist.style = { separator = separator, widget = redflat.gauge.tag.blue.new, show_tip = true }
taglist.buttons = awful.util.table.join(
awful.button({ }, 1, awful.tag.viewonly),
awful.button({ modkey }, 1, awful.client.movetotag),
awful.button({ }, 3, awful.tag.viewtoggle),
awful.button({ modkey }, 3, awful.client.toggletag),
awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
)

-- | Tasklist | --
tasklist = {}
tasklist.buttons = awful.util.table.join(
awful.button({ }, 1, function (c)
  if c == client.focus then
    c.minimized = true
  else
    c.minimized = false
    if not c:isvisible() then
      awful.tag.viewonly(c:tags()[1])
    end
    client.focus = c
    c:raise()
  end
end),
awful.button({ }, 3, function ()
  if instance then
    instance:hide()
    instance = nil
  else
    instance = awful.menu.clients({
      theme = { width = 250 }
    })
  end
end),
awful.button({ }, 4, function ()
  awful.client.focus.byidx(1)
  if client.focus then client.focus:raise() end
end),
awful.button({ }, 5, function ()
  awful.client.focus.byidx(-1)
  if client.focus then client.focus:raise() end
end))


-- PA volume control
--------------------------------------------------------------------------------
local volume = {}
volume.widget = redflat.widget.pulse(nil, { widget = redflat.gauge.audio.blue.new })

volume.buttons = awful.util.table.join(
awful.button({}, 4, function() redflat.widget.pulse:change_volume()                end),
awful.button({}, 5, function() redflat.widget.pulse:change_volume({ down = true }) end),
awful.button({}, 2, function() redflat.widget.pulse:mute()                         end)
)

-- System resource monitoring widgets
--------------------------------------------------------------------------------
local sysmon = { widget = {}, buttons = {}, icon = {} }

-- icons
sysmon.icon.battery = redflat.util.table.check(beautiful, "icon.widget.battery")
sysmon.icon.cpuram = redflat.util.table.check(beautiful, "icon.widget.monitor")

-- battery
sysmon.widget.battery = redflat.widget.sysmon(
{ func = redflat.system.pformatted.bat(25), arg = "BAT1" },
{ timeout = 60, widget = redflat.gauge.icon.single, monitor = { is_vertical = true, icon = sysmon.icon.battery } }
)

-- CPU and RAM usage
local cpu_storage = { cpu_total = {}, cpu_active = {} }

local cpuram_func = function()
  local cpu_usage = redflat.system.cpu_usage(cpu_storage).total
  local mem_usage = redflat.system.memory_info().usep

  return {
    text = "CPU: " .. cpu_usage .. "%  " .. "RAM: " .. mem_usage .. "%",
    value = { cpu_usage / 100,  mem_usage / 100},
    alert = cpu_usage > 80 or mem_usage > 70
  }
end

sysmon.widget.cpuram = redflat.widget.sysmon(
{ func = cpuram_func },
{ timeout = 2,  widget = redflat.gauge.monitor.double, monitor = { icon = sysmon.icon.cpuram } }
)

-- battery
sysmon.widget.battery = redflat.widget.sysmon(
	{ func = redflat.system.pformatted.bat(25), arg = "BAT0" },
	{ timeout = 60, widget = redflat.gauge.icon.single, monitor = { is_vertical = true, icon = sysmon.icon.battery } }
)

-- Textclock widget
--------------------------------------------------------------------------------
local textclock = {}
textclock.widget = redflat.widget.textclock({ timeformat = "%H:%M", dateformat = "%b  %d  %a" })
local textcalendar = {}
textcalendar.widget = redflat.widget.textclock({ timeformat = "%b %d %a" })

-- System tray widget
local tray = {}
tray.widget = redflat.widget.minitray({ timeout = 10 })

tray.buttons = awful.util.table.join(
	awful.button({}, 1, function() redflat.widget.minitray:toggle() end)
)

-- Panel
promptbox       = {}
layoutbox = {}

awful.screen.connect_for_each_screen(function (s)
  -- wallpaper
  if beautiful.wallpaper then
    if awful.util.file_readable(beautiful.wallpaper) then
      gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    else
      gears.wallpaper.set(beautiful.color.bg)
    end
  end

  promptbox[s] = awful.widget.prompt()
  -- layoutbox widget
  layoutbox[s] = redflat.widget.layoutbox({ screen = s })

  -- taglist widget
  taglist[s] = redflat.widget.taglist({ screen = s, buttons = taglist.buttons, hint = env.tagtip }, taglist.style)

  -- tasklist widget
  tasklist[s] = redflat.widget.tasklist({ screen = s, buttons = tasklist.buttons }, tasklist.style)

  -- panel wibox
  s.panel = awful.wibar({ position = "bottom", screen = s, height = beautiful.panel_height or 36 })

  -- add widgets to the wibox
  s.panel:setup {
    layout = wibox.layout.align.horizontal,
    { -- left widgets
      layout = wibox.layout.fixed.horizontal,

      env.wrapper(layoutbox[s], "layoutbox", layoutbox.buttons),
      separator,
      env.wrapper(promptbox[s], "promptbox"),
      env.wrapper(taglist[s], "taglist"),
      separator,
    },
    { -- middle widget
      layout = wibox.layout.align.horizontal,
      expand = "outside",

      nil,
      env.wrapper(tasklist[s], "tasklist"),
    },
    { -- right widgets
      layout = wibox.layout.fixed.horizontal,

      separator,
      env.wrapper(sysmon.widget.cpuram, "cpuram", sysmon.buttons.cpuram),
      separator,
      env.wrapper(volume.widget, "volume", volume.buttons),
      separator,
      env.wrapper(textclock.widget, "textclock"),
      separator,
      env.wrapper(textcalendar.widget, "textclock"),
      separator,
      env.wrapper(tray.widget, "tray", tray.buttons),
      --separator,
      --env.wrapper(sysmon.widget.battery, "battery")
    },
  }
end)

-- volume functions
local volume_raise = function() redflat.widget.pulse:change_volume({ show_notify = true })              end
local volume_lower = function() redflat.widget.pulse:change_volume({ show_notify = true, down = true }) end
local volume_mute  = function() redflat.widget.pulse:mute() end

-- | Mouse bindings | --
root.buttons(awful.util.table.join(
  awful.button({ }, 3, function () mainmenu:toggle() end)
  -- awful.button({ }, 4, awful.tag.viewnext),
  -- awful.button({ }, 5, awful.tag.viewprev)
))

-- | Key bindings | --
globalkeys = awful.util.table.join(
  -- Custom
awful.key({ }, "XF86AudioRaiseVolume",  volume_raise),
awful.key({ }, "XF86AudioLowerVolume",  volume_lower),
awful.key({ }, "XF86AudioMute",         volume_mute),
awful.key({ modkey }, "v",              volume_mute),
awful.key({ modkey, "Shift" }, "p", function () awful.util.spawn(browser) end),
awful.key({ modkey, "Shift" }, "f", function () awful.util.spawn("nautilus --no-desktop") end),
awful.key({ modkey, "Shift" }, "e", function () awful.util.spawn("atom") end),

awful.key({ modkey            }, "p",      function() menubar.show() end),
awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
awful.key({ modkey,           }, "Tab", awful.tag.history.restore),

awful.key({ modkey,           }, "j",
function ()
  awful.client.focus.byidx( 1)
  if client.focus then client.focus:raise() end
end),
awful.key({ modkey,           }, "k",
function ()
  awful.client.focus.byidx(-1)
  if client.focus then client.focus:raise() end
end),
-- awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

-- Layout manipulation
awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
awful.key({ modkey,           }, "Escape",
function ()
  awful.client.focus.history.previous()
  if client.focus then
    client.focus:raise()
  end
end),

-- Standard program
awful.key({ modkey, "Shift"   }, "Return", function () awful.util.spawn("termite") end),
awful.key({ modkey, "Control" }, "r", awesome.restart),
awful.key({ modkey, "Shift"   }, "q", awesome.quit),

awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

awful.key({ modkey, "Control" }, "n", awful.client.restore),

-- Prompt
awful.key({ modkey },            "r",     function () promptbox[mouse.screen]:run() end),

awful.key({ modkey }, "x",
function ()
  awful.prompt.run({ prompt = "Run Lua code: " },
  promptbox[mouse.screen].widget,
  awful.util.eval, nil,
  awful.util.getdir("cache") .. "/history_eval")
end)
)

clientkeys = awful.util.table.join(
awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
awful.key({ modkey,           }, "q",      function (c) c:kill()                         end),
awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
awful.key({ modkey, "Shift"   }, "r",      awesome.restart                                  ),
awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
awful.key({ modkey,           }, "n",
function (c)
  -- The client currently has the input focus, so it cannot be
  -- minimized, since minimized clients can't have the focus.
  c.minimized = true
end),
awful.key({ modkey,           }, "m",
function (c)
  c.maximized_horizontal = not c.maximized_horizontal
  c.maximized_vertical   = not c.maximized_vertical
end)
)

for i = 1, 9 do
  globalkeys = awful.util.table.join(globalkeys,
  awful.key({ modkey }, "#" .. i + 9,
  function ()
    local screen = mouse.screen
    local tag = awful.tag.gettags(screen)[i]
    if tag then
      awful.tag.viewonly(tag)
    end
  end),
  awful.key({ modkey, "Control" }, "#" .. i + 9,
  function ()
    local screen = mouse.screen
    local tag = awful.tag.gettags(screen)[i]
    if tag then
      awful.tag.viewtoggle(tag)
    end
  end),
  awful.key({ modkey, "Shift" }, "#" .. i + 9,
  function ()
    if client.focus then
      local tag = awful.tag.gettags(client.focus.screen)[i]
      if tag then
        awful.client.movetotag(tag)
      end
    end
  end),
  awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
  function ()
    if client.focus then
      local tag = awful.tag.gettags(client.focus.screen)[i]
      if tag then
        awful.client.toggletag(tag)
      end
    end
  end))
end

clientbuttons = awful.util.table.join(
awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
awful.button({ modkey }, 1, awful.mouse.client.move),
awful.button({ modkey }, 3, awful.mouse.client.resize))

awful.menu.menu_keys = {
  up    = { "k", "Up" },
  down  = { "j", "Down" },
  exec  = { "l", "Return", "Space" },
  enter = { "l", "Right" },
  back  = { "h", "Left" },
  close = { "q", "Escape" }
}

root.keys(globalkeys)

-- | Rules | --

awful.rules.rules = {
  { rule = { },
  properties = { border_width = beautiful.border_width,
  border_color = beautiful.border_normal,
  focus = awful.client.focus.filter,
  size_hints_honor = false,
  raise = true,
  keys = clientkeys,
  buttons = clientbuttons } },
  { rule = { class = "gcolor2" },
  properties = { floating = true } },
  { rule = { class = "xmag" },
  properties = { floating = true } },
  { rule = { class = "gimp" },
  properties = { floating = true } },
}

-- | Signals | --

client.connect_signal("manage", function (c, startup)
  c:connect_signal("mouse::enter", function(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
      and awful.client.focus.filter(c) then
      client.focus = c
    end
  end)

  if not startup then
    if not c.size_hints.user_position and not c.size_hints.program_position then
      awful.placement.no_overlap(c)
      awful.placement.no_offscreen(c)
    end
  end

  local titlebars_enabled = false
  if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
    local buttons = awful.util.table.join(
    awful.button({ }, 1, function()
      client.focus = c
      c:raise()
      awful.mouse.client.move(c)
    end),
    awful.button({ }, 3, function()
      client.focus = c
      c:raise()
      awful.mouse.client.resize(c)
    end)
    )

    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(awful.titlebar.widget.iconwidget(c))
    left_layout:buttons(buttons)

    local right_layout = wibox.layout.fixed.horizontal()
    right_layout:add(awful.titlebar.widget.floatingbutton(c))
    right_layout:add(awful.titlebar.widget.maximizedbutton(c))
    right_layout:add(awful.titlebar.widget.stickybutton(c))
    right_layout:add(awful.titlebar.widget.ontopbutton(c))
    right_layout:add(awful.titlebar.widget.closebutton(c))

    local middle_layout = wibox.layout.flex.horizontal()
    local title = awful.titlebar.widget.titlewidget(c)
    title:set_align("center")
    middle_layout:add(title)
    middle_layout:buttons(buttons)

    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_right(right_layout)
    layout:set_middle(middle_layout)

    awful.titlebar(c):set_widget(layout)
  end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- | run_once | --

function run_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
    findme = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

-- | Autostart | --

-- os.execute("pkill compton")
-- run_once("compton")
-- run_once("parcellite")
