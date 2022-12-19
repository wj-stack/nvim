local status, spectre = pcall(require, "nvim-spectre")
if not status then
	vim.notify("没有找到 nvim-spectre")
	return
end
spectre.setup({})
