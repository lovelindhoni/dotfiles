local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

local config = wezterm.config_builder()

local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

config.font = wezterm.font("JetBrains Mono")

local function split_nav(key)
	return {
		key = key,
		mods = "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = "CTRL" },
				}, pane)
			else
				win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
			end
		end),
	}
end

config.font_size = 18

config.window_decorations = "RESIZE"

config.window_frame = {
	font_size = 13.0,
}

-- config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	top = 10,
	bottom = 10,
	left = 10,
	right = 10,
}

local onedark_colors, _ = wezterm.color.load_scheme("./.config/wezterm/colors/onedark.toml")

local tokyonight_colors, _ = wezterm.color.load_scheme("./.config/wezterm/colors/tokyonight_night.toml")

local everforest_dark_hard, _ = wezterm.color.load_scheme("./.config/wezterm/colors/everforest-dark-hard.toml")
config.colors = everforest_dark_hard

config.window_background_opacity = 1
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.warn_about_missing_glyphs = false

local action = wezterm.action

config.keys = {
	{
		key = "r",
		mods = "LEADER",
		action = action.ReloadConfiguration,
	},
	{
		key = "\\",
		mods = "LEADER",
		action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	split_nav("h"),
	split_nav("j"),
	split_nav("k"),
	split_nav("l"),
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "m",
		mods = "LEADER",
		action = action.TogglePaneZoomState,
	},
	{ key = "[", mods = "LEADER", action = action.ActivateCopyMode },
	{
		key = "c",
		mods = "LEADER",
		action = action.SpawnTab("CurrentPaneDomain"),
	},

	{
		key = "p",
		mods = "LEADER",
		action = action.ActivateTabRelative(-1),
	},
	{
		key = "n",
		mods = "LEADER",
		action = action.ActivateTabRelative(1),
	},
	-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
	{
		key = "a",
		mods = "LEADER|CTRL",
		action = action.SendKey({ key = "a", mods = "CTRL" }),
	},
}
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = action.ActivateTab(i - 1),
	})
end

return config
