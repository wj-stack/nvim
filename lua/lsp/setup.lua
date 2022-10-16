-- :h mason-default-settings
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
	-- 确保安装，根据需要填写
	ensure_installed = {
		"sumneko_lua",
		-- "tsserver",
		-- "tailwindcss",
		-- "bashls",
		-- "cssls",
		-- "dockerls",
		-- "emmet_ls",
		-- "html",
		"jsonls",
		-- "pyright",
		-- "rust_analyzer",
		-- "taplo",
		"yamlls",
		"gopls",
	},
	automatic_installation = false,
})

local servers = {
	sumneko_lua = require("lsp.config.lua"), -- /lua/lsp/config/lua.lua
	gopls = require("lsp.config.gopls"), -- /lua/lsp/config/lua.lua
	---- html = {},
	---- jsonls = {},
	---- tsserver = {}
}
local config = require("lspconfig")
for name, server in pairs(servers) do
	if config[name] == nil then
		return
	end
	server.on_setup(config[name])
end


