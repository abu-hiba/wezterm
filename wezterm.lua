local wezterm = require "wezterm"
local act = wezterm.action
local config = {}

config.leader = { key = ";", mods = "CTRL" }
config.keys = {
    -- This will create a new split and run your default program inside it
    { key = "v",          mods = "LEADER",         action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
    -- This will create a new split and run your default program inside it
    { key = "s",          mods = "LEADER",         action = act.SplitVertical { domain = "CurrentPaneDomain" } },
    -- This will close current pane
    { key = "w",          mods = "LEADER",         action = act.CloseCurrentPane { confirm = false } },
    -- Moving focus between panes in current tab
    { key = "h",          mods = "LEADER",         action = act.ActivatePaneDirection "Left" },
    { key = "l",          mods = "LEADER",         action = act.ActivatePaneDirection "Right" },
    { key = "k",          mods = "LEADER",         action = act.ActivatePaneDirection "Up" },
    { key = "j",          mods = "LEADER",         action = act.ActivatePaneDirection "Down" },
    -- Moving focus between tabs
    { key = "h",          mods = "SUPER",          action = act.ActivateTabRelative(-1) },
    { key = "l",          mods = "SUPER",          action = act.ActivateTabRelative(1) },
    -- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
    { key = "LeftArrow",  mods = "OPT",            action = act.SendKey { key = "b", mods = "ALT" } },
    { key = "RightArrow", mods = "OPT",            action = act.SendKey { key = "f", mods = "ALT" } },
    -- Adjust pane size
    { key = "J",          mods = "LEADER",         action = act.AdjustPaneSize { "Down", 5 }, },
    { key = "H",          mods = "LEADER",         action = act.AdjustPaneSize { "Left", 5 } },
    { key = "K",          mods = "LEADER",         action = act.AdjustPaneSize { "Up", 5 } },
    { key = "L",          mods = "LEADER",         action = act.AdjustPaneSize { "Right", 5 }, },
    { key = "t",          mods = "LEADER",         action = act.SpawnTab "CurrentPaneDomain" },
    -- Toggle full screen
    { key = "UpArrow",    mods = "CTRL|ALT|SUPER", action = act.ToggleFullScreen },
    -- Copy mode
    { key = "x",          mods = "LEADER",         action = act.ActivateCopyMode },
}

for i = 1, 8 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "LEADER",
        action = act.ActivateTab(i - 1),
    })
end

config.initial_cols = 254
config.initial_rows = 70
config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = "Tokyo Night"

config.font = wezterm.font("JetBrains Mono", { bold = true })
config.font_size = 13.0
config.line_height = 1.2

config.color_schemes = {
    ["Tokyo Night"] = {
        foreground = "#c0caf5",
        background = "#1a1b26",
        cursor_bg = "#c0caf5",
        cursor_border = "#c0caf5",
        cursor_fg = "#1a1b26",
        selection_bg = "#33467C",
        selection_fg = "#c0caf5",

        ansi = {
            "#15161E", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7",
            "#bb9af7", "#7dcfff", "#a9b1d6"
        },
        brights = {
            "#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7",
            "#bb9af7", "#7dcfff", "#c0caf5"
        }
    }
}

return config
