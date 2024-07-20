local colors = require('colors.custom')
local wezterm = require 'wezterm'


local mux = wezterm.mux
local act = wezterm.action

-- -- These are vars to put things in later (i dont use em all yet)
local config = {}
local keys = {}
local mouse_bindings = {}
local launch_menu = {}

-- -- This is for newer wezterm vertions to use the config builder 
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.use_fancy_tab_bar= true
config.show_new_tab_button_in_tab_bar = false
config.colors = colors

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_background_opacity = 1
config.adjust_window_size_when_changing_font_size = false
config.font = wezterm.font('Hack Nerd Font')
config.font_size = 11

config.window_close_confirmation = 'NeverPrompt'
config.window_frame = {
    -- The font used in the tab bar.
    -- Roboto Bold is the default; this font is bundled
    -- with wezterm.
    -- Whatever font is selected here, it will have the
    -- main font setting appended to it to pick up any
    -- fallback fonts you may have used there.
    font = wezterm.font { family = 'Hack Nerd Font', weight = 'Bold' },
  
    -- The size of the font in the tab bar.
    -- Default to 10.0 on Windows but 12.0 on other systems
    font_size = 12.0,
  
    -- The overall background color of the tab bar when
    -- the window is focused
    inactive_titlebar_bg = '#272e33',
    active_titlebar_bg = '#272e33',
  }



-- -- -- makes my cursor blink 
-- config.default_cursor_style = 'BlinkingBar'
-- config.disable_default_key_bindings = true
-- -- 
-- -- this adds the ability to use ctrl+v to paste the system clipboard 
-- config.leader = {key = 'a', mods = 'CTRL', timeout_milliseconds = 1000}
-- config.keys = {{mods = "LEADER", key = "-", action = wezterm.action.SplitVertical {domain = 'CurrentPaneDomain'}},
--                {mods = "LEADER", key = "=", action = wezterm.action.SplitHorizontal {domain = 'CurrentPaneDomain'}},
--                {mods = 'LEADER', key = 'm', action = wezterm.action.TogglePaneZoomState},
--                {key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard'},
--                {key = '9', mods = 'CTRL', action = act.PaneSelect {alphabet = '1234567890'}},
--                {key = '=', mods = 'CTRL', action = wezterm.action.IncreaseFontSize},
--                {key = '-', mods = 'CTRL', action = wezterm.action.DecreaseFontSize}}
-- config.mouse_bindings = mouse_bindings

-- -- There are mouse binding to mimc Windows Terminal and let you copy
-- -- To copy just highlight something and right click. Simple
-- mouse_bindings = {{event = {Down = {streak = 3, button = 'Left'}},
--                    action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone', mods = 'NONE'},
--                   {event = {Down = {streak = 1, button = "Right"}}, mods = "NONE",
--                    action = wezterm.action_callback(function(window, pane)
--     local has_selection = window:get_selection_text_for_pane(pane) ~= ""
--     if has_selection then
--         window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
--         window:perform_action(act.ClearSelection, pane)
--     else
--         window:perform_action(act({PasteFrom = "Clipboard"}), pane)
--     end
-- end)}}

-- This is used to make my foreground (text, etc) brighter than my background
config.foreground_text_hsb = {hue = 1.0, saturation = 1.2, brightness = 1.5}

-- -- IMPORTANT: Sets WSL2 UBUNTU-22.04 as the defualt when opening Wezterm
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_domain = 'WSL:ubuntu-dev'
end
return config
