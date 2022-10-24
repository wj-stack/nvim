-- Use a protected call so we don't error out on first use
local status_ok, mason = pcall(require, "mason")
if not status_ok then
	print("没有找到 mason")
	return
end

-- :h mason-default-settings
mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local status_ok_, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_ then
	print("没有找到 mason-lspconfig")
	return
end
-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
mason_lspconfig.setup({
	-- 确保安装，根据需要填写
	ensure_installed = {
		"sumneko_lua",
		-- "tsserver",
		-- "tailwindcss",
		"bashls", -- for bash
		-- "cssls",
		-- "dockerls",
		-- "emmet_ls",
		-- "html",
		"lemminx", -- xml
		"jsonls",
		-- "pyright",
		-- "rust_analyzer",
		-- "taplo",
		"yamlls",
		"cmake",
		"clangd",
		"gopls",
		-- "gofumpt",
		-- "goimports",
	},
	automatic_installation = false,
})

local servers = {
	sumneko_lua = require("lsp.config.lua"), -- /lua/lsp/config/lua.lua
	gopls = require("lsp.config.gopls"), -- 给专门的格式化工具格式化
	bashls = require("lsp.config.default"), -- lsp format
	lemminx = require("lsp.config.default"),
	jsonls = require("lsp.config.default"),
	yamlls = require("lsp.config.default"),
	cmake = require("lsp.config.default"),
	clangd = require("lsp.config.default-lsp-format"),
}
local config = require("lspconfig")
for name, server in pairs(servers) do
	if config[name] == nil then
		return
	end

	server.on_setup(config[name])
end
