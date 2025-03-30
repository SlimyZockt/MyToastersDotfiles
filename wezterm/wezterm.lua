-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = {}
-- This is where you actually apply your config choices
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.window_background_opacity = 0.9
if wezterm.target_triple:find("windows") ~= nil then
	config.default_prog = { "pwsh", "-NoLogo" }
end
if wezterm.target_triple:find("linux") ~= nil then
	config.enable_wayland = false
	config.front_end = "WebGpu"
	config.default_prog = { "fish" }
	config.enable_tab_bar = false
end
config.automatically_reload_config = true
-- For example, changing the color scheme:
config.color_scheme = "Kanagawa (Gogh)"

config.window_padding = {
	left = "0.5cell",
	right = "0.5cell",
	top = "0.25cell",
	bottom = "0.25cell",
}

-- and finally, return the configuration to wezterm
return config
