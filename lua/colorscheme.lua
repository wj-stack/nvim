local colorscheme = "sonokai"
-- local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("没有找到 colorscheme " .. colorscheme)
	return
end
