local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font          = "Iosevka Nerd Font Mono 13"


theme.bg_normal     = "#1d2021"
theme.bg_focus      = "#928374"
theme.bg_urgent     = "#fe8019"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#928374"
theme.fg_focus      = "#0c0c0c"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(4)
theme.border_width  = dpi(1)
theme.border_normal = "#1d2021"
theme.border_focus  = "#928374"
theme.border_marked = "#cc241d"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"


theme.taglist_fg_occupied = "#fbf1c7"

-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.bg_focus
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.bg_focus
)

theme.taglist_shape_border_width = dpi(3)
theme.taglist_shape_border_color = "#1d2021"
theme.taglist_spacing = dpi(0)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]
--theme.notification_width = 200
--theme.notification_height = 50
theme.notification_border_width = 2
theme.notification_bg = "#1d2021"
theme.notification_fg = "#fbf1c7"


-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

theme.wallpaper = "~/.config/background"


-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
