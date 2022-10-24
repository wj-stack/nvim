-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
local opts = {
	settings = {
		-- default
	},
	flags = {
		debounce_text_changes = 150,
	},
	on_attach = require("lsp.attach-no-format"), -- 默认 null-ls 格式化
}

-- 查看目录等信息
return {
	on_setup = function(server)
		server.setup(opts)
	end,
}
