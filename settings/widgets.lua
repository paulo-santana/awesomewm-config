local awful = require('awful')
local wibox = require('wibox')

local beautiful = require('settings.theme') -- ~/.config/awesome/settings/theme.lua
local menus = require('settings.menus') -- ~/.config/awesome/settings/theme.lua

local widgets = {}

widgets.mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = menus.mymainmenu })

widgets.mykeyboardlayout = awful.widget.keyboardlayout()
widgets.mytextclock = wibox.widget.textclock()

return widgets
