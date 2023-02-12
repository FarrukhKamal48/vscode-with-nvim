local theme = "onedark" -- choose theme name, does not have to be exact

local colorscheme = "onedark" -- actual variable for theme, must be exact

if theme == "onedark" then
	require("user.themes.onedarkTheme")
	colorscheme = "onedark"
elseif theme == "tokyonight" then
	require("user.themes.tokyonight")
	colorscheme = "tokyonight"
elseif theme == "darkplus" then
	require("user.themes.darkplus")
	colorscheme = "darkplus"
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
