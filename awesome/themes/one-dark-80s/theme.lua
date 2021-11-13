--  _ __ __ ___   _____ _ __
-- | '__/ _` \ \ / / _ \ '_  \  Antonin Fischer (raven2cz)
-- | | | (_| |\ V /  __/ | | |  https://fishlive.org/
-- |_|  \__,_| \_/ \___|_| |_|  https://github.com/raven2cz
--
-- A customized theme.lua for awesomewm-git (Master) / OneDark Eighties Theme (https://github.com/raven2cz)
------------------------
-- OneDark 80s Theme  --
------------------------

local theme_name = "one-dark-80s"
local awful = require("awful")
local gfs = require("gears.filesystem")
local gears = require("gears")
local themes_path = gfs.get_themes_dir()
local rnotification = require("ruled.notification")
local dpi = require("beautiful.xresources").apply_dpi
-- Widget and layout library
local wibox = require("wibox")
-- Window Enhancements
local lain = require("lain")
-- Fishlive Utilities
local fishlive = require("fishlive")
-- Notification library
local naughty = require("naughty")
local menubar = require('menubar')
local xdg_menu = require("archmenu")

-- Use Polybar instead of classic Awesome Bar
local usePolybar = false

-- {{{ Main
local theme = {}
theme.dir = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name
-- }}}

-- activate random seed by time
math.randomseed(os.time());
-- To guarantee unique random numbers on every platform, pop a few
for i = 1,10 do
  math.random()
end

-- {{{ Styles
-- Global font
theme.font          = "Iosevka Nerd Font 9"
theme.font_larger   = "Iosevka Nerd Font 11"
theme.font_notify   = "mononoki Nerd Font 11"

-- {{{ Colors
--base16-eighties-one-dark color palatte
theme.base00 = "#2d2d2d"
theme.base01 = "#393939"
theme.base02 = "#515151"
theme.base03 = "#747369"
theme.base04 = "#a09f93"
theme.base05 = "#d3d0c8"
theme.base06 = "#e8e6df"
theme.base07 = "#f2f0ec"
theme.base08 = "#f2777a"
theme.base09 = "#f99157"
theme.base0A = "#ffcc66"
theme.base0F = "#d27b53"
theme.base0E = "#cc99cc"
theme.base0C = "#66cccc"
theme.base0D = "#6699cc"
theme.base0B = "#99cc99"

--one-dark-extended color palette
theme.base10 = "#2C2C2C"
theme.base11 = "#273450"
theme.base18 = "#b74822"
theme.base1A = "#F0DFAF"

-- random shuffle foreground colors, 8 colors
theme.baseColors = {
  theme.base08,
  theme.base09,
  theme.base0A,
  theme.base0E,
  theme.base0C,
  theme.base0D,
  theme.base0B,
  theme.base18,
  theme.base1A,
}
fishlive.util.shuffle(theme.baseColors)

theme.fg_normal  = theme.base06
theme.fg_focus   = theme.base1A
theme.fg_urgent  = theme.base0E
theme.fg_minimize = theme.base07

theme.bg_normal  = theme.base10
theme.bg_focus   = theme.base00
theme.bg_urgent  = theme.base18
theme.bg_systray = theme.base10
theme.bg_minimize = theme.base03
theme.bg_underline = theme.base0C

theme.notification_opacity = 0.84
theme.notification_bg = theme.bg_normal
theme.notification_fg = theme.fg_focus
-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(5)
theme.border_width  = dpi(1)
theme.border_color_normal = theme.base10
theme.border_color_active = theme.base0A
theme.border_color_marked = theme.base0E
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = theme.base02
theme.titlebar_bg_normal = theme.base02
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
theme.widgetbar_fg  = theme.base05
theme.fg_widget     = theme.base05
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = theme.base0E
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)
-- }}}

-- {{{ Notification Center
theme.clear_icon = theme.dir .. "/icons/clear.png"
theme.clear_grey_icon = theme.dir .. "/icons/clear_grey.png"
theme.notification_icon = theme.dir .. "/icons/notification.png"
theme.delete_icon = theme.dir .. "/icons/delete.png"
theme.delete_grey_icon = theme.dir .. "/icons/delete_grey.png"
theme.xcolor0 = theme.base02
theme.groups_bg  = theme.base01
theme.xbackground = theme.base01
theme.bg_very_light = theme.base03
theme.bg_light = theme.base02
theme.border_radius = dpi(0)
theme.wibar_height = dpi(27)
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = theme.dir .. "/taglist/squarefz.png"
theme.taglist_squares_unsel = theme.dir .. "/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = theme.dir .. "/awesome-icon.png"
theme.menu_submenu_icon      = themes_path .. "default/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile        = theme.dir .. "/layouts/tile.png"
theme.layout_tileleft    = theme.dir .. "/layouts/tileleft.png"
theme.layout_tilebottom  = theme.dir .. "/layouts/tilebottom.png"
theme.layout_tiletop     = theme.dir .. "/layouts/tiletop.png"
theme.layout_fairv       = theme.dir .. "/layouts/fairv.png"
theme.layout_fairh       = theme.dir .. "/layouts/fairh.png"
theme.layout_spiral      = theme.dir .. "/layouts/spiral.png"
theme.layout_dwindle     = theme.dir .. "/layouts/dwindle.png"
theme.layout_max         = theme.dir .. "/layouts/max.png"
theme.layout_fullscreen  = theme.dir .. "/layouts/fullscreen.png"
theme.layout_magnifier   = theme.dir .. "/layouts/magnifier.png"
theme.layout_floating    = theme.dir .. "/layouts/floating.png"
theme.layout_cornernw    = theme.dir .. "/layouts/cornernw.png"
theme.layout_cornerne    = theme.dir .. "/layouts/cornerne.png"
theme.layout_cornersw    = theme.dir .. "/layouts/cornersw.png"
theme.layout_cornerse    = theme.dir .. "/layouts/cornerse.png"
theme.layout_cascade     = theme.dir .. "/layouts/cascade.png"
theme.layout_cascadetile = theme.dir .. "/layouts/cascadetile.png"
theme.layout_centerfair  = theme.dir .. "/layouts/centerfair.png"
theme.layout_centerwork  = theme.dir .. "/layouts/centerwork.png"
theme.layout_centerworkh = theme.dir .. "/layouts/centerworkh.png"
theme.layout_termfair    = theme.dir .. "/layouts/termfair.png"
theme.layout_treetile    = theme.dir .. "/layouts/treetile.png"
theme.layout_machi       = theme.dir .. "/layouts/machi.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = theme.dir .. "/titlebar/close_focus.png"
theme.titlebar_close_button_normal = theme.dir .. "/titlebar/close_normal.png"

theme.titlebar_minimize_button_normal = theme.dir .. "/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = theme.dir .. "/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_focus_active  = theme.dir .. "/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = theme.dir .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = theme.dir .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = theme.dir .. "/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = theme.dir .. "/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = theme.dir .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = theme.dir .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = theme.dir .. "/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = theme.dir .. "/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = theme.dir .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = theme.dir .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = theme.dir .. "/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = theme.dir .. "/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = theme.dir .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/titlebar/maximized_normal_inactive.png"

return theme
