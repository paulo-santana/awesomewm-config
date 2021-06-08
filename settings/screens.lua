local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')

local widgets = require('settings.widgets') -- ~/.config/awesome/settings/widgets.lua
local mouse_buttons = require('settings.mouse_buttons') -- ~/.config/awesome/settings/mouse_buttons.lua
--local beautiful = require('settings.theme')


--local function set_wallpaper(s)
--    -- Wallpaper
--    if beautiful.wallpaper then
--        local wallpaper = beautiful.wallpaper
--        -- If wallpaper is a function, call it with the screen
--        if type(wallpaper) == "function" then
--            wallpaper = wallpaper(s)
--        end
--        gears.wallpaper.maximized(wallpaper, s, true)
--    end
--end


--screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    --set_wallpaper(s)

    -- tag list
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- a prompt box
    s.mypromptbox = awful.widget.prompt()

    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = mouse_buttons.taglist_buttons,
	}

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = mouse_buttons.tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            widgets.mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            widgets.mykeyboardlayout,
            wibox.widget.systray(),
            widgets.mytextclock,
            s.mylayoutbox,
        },
    }
end)
