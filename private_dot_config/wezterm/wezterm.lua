-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.font = wezterm.font 'Iosevka Extended'
config.color_scheme = 'nordfox'
config.window_close_confirmation = 'NeverPrompt'
config.enable_tab_bar = false
config.front_end = 'WebGpu'

-- and finally, return the configuration to wezterm
return config
