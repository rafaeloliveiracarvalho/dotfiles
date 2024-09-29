-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- For example, changing the color scheme:
config.color_scheme = "Dracula (Official)"
config.font = wezterm.font("JetBrains Mono", {weight = 500})
config.font_size = 14

config.window_decorations = "RESIZE"

-- Cursor Style
config.default_cursor_style = "BlinkingBar"

-- tab bar
-- https://wezfurlong.org/wezterm/config/lua/window-events/format-tab-title.html
-- config.show_tab_index_in_tab_bar = true
-- config.tab_and_split_indices_are_zero_based = false
config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

-- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.linux_fedora

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_right_half_circle_thick

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
    local title = tab_info.tab_title
    -- if the tab title is explicitly set, take that
    if title and #title > 0 then
        return title
    end
    -- Otherwise, use the title from the active pane
    -- in that tab
    return tab_info.active_pane.title
end

wezterm.on(
    "format-tab-title",
    function(tab, tabs, panes, config, hover, max_width)
        local edge_background = "#0b0022"
        local background = "#1b1032"
        local foreground = "#808080"

        if tab.is_active then
            background = "#2b2042"
            foreground = "#c0c0c0"
        elseif hover then
            background = "#3b3052"
            foreground = "#909090"
        end

        local edge_foreground = background

        local title = tab_title(tab)

        -- ensure that the titles fit in the available space,
        -- and that we have room for the edges.
        title = wezterm.truncate_right(title, max_width - 2)

        return {
            {Background = {Color = edge_background}},
            {Foreground = {Color = edge_foreground}},
            {Text = SOLID_LEFT_ARROW},
            {Background = {Color = background}},
            {Foreground = {Color = foreground}},
            {Text = title},
            {Background = {Color = edge_background}},
            {Foreground = {Color = edge_foreground}},
            {Text = SOLID_RIGHT_ARROW}
        }
    end
)

-- Background
config.window_background_opacity = 0.8

return config
