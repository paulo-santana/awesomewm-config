---@diagnostic disable: lowercase-global
require('settings.bootstrap')

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

require('settings.layouts')
require('settings.rules')
require('settings.clients')
require('settings.screens')
