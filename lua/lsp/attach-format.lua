local on_attach = function(client, bufnr)
	-- 禁用格式化功能，交给专门插件插件处理 -> null-ls
	client.server_capabilities.documentFormattingProvider = true
	client.server_capabilities.document_range_formatting = true

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	-- 绑定快捷键
	require("keybindings").mapLSP(buf_set_keymap)
	-- 保存时自动格式化
	vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
end

return on_attach
