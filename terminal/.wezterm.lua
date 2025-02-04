-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Window
config.initial_cols = 140 -- Sets the number of columns (width)
config.initial_rows = 32  -- Sets the number of rows (height)
config.hide_tab_bar_if_only_one_tab = true

-- Font
config.font = wezterm.font("JetBrains Mono", {weight="DemiBold", stretch="Normal", style="Normal"})
config.font_size = 16.0

-- Colors
config.colors = {
    background = '#1B2631', -- Dark Blue
    foreground = 'silver', -- Light Gray, for main text
    cursor_bg = '#AEB2B3', -- Lighter Gray, for cursor
    cursor_fg = 'black', -- For cursor text
    cursor_border = '#AEB2B3', -- Lighter Gray, for cursor border
    selection_bg = '#3B4751', -- Slightly lighter blue-gray, for selection background
    selection_fg = 'silver', -- For text within selection

    -- ANSI Color Palette
    ansi = {
        'black', -- Typically the same as the background or slightly lighter/darker
        '#CD3131', -- Red, for errors and warnings
        '#0DBC79', -- Green, for success messages and commands
        '#E5E510', -- Yellow, for status and options
        '#2472C8', -- Blue, closer to your background but visible
        '#BC3FBC', -- Magenta, for identifying unique items like branches
        '#11A8CD', -- Cyan, for secondary information
        '#E5E5E5', -- White, for bright foreground text
    },
    brights = {
        '#666666', -- Bright Black (gray), for secondary content
        '#F14C4C', -- Bright Red, for critical errors and alerts
        '#23D18B', -- Bright Green, more vibrant for highlights
        '#F5F543', -- Bright Yellow, for important warnings
        '#3B8EEA', -- Bright Blue, noticeable against background
        '#D670D6', -- Bright Magenta, for significant items
        '#29B8DB', -- Bright Cyan, for prominent secondary info
        'white', -- Bright White, for the most important text
    },
}

-- Key bindings (custom)
config.keys = {
    -- Horizontal split
    {key = "PageUp", mods = "CTRL", action = wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    -- Vertical split
    {key = "PageDown", mods = "CTRL", action = wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
}

return config
