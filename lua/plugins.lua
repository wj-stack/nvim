local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

local packer = require("packer")

packer.startup({
	function(use)
		-- Packer 可以管理自己本身
		use("wbthomason/packer.nvim")
		-- 你的插件列表...

		--------------------- colorschemes --------------------
		-- tokyonight
		use("folke/tokyonight.nvim")
		use("sainnhe/sonokai")
		-------------------------------------------------------

		-- nvim-tree
		use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

		-- bufferline
		use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
		-- lualine
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use("arkav/lualine-lsp-progress")

		-- telescope
		use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
		-- telescope extensions
		use("LinArcX/telescope-env.nvim")

		-- dashboard-nvim
		use("glepnir/dashboard-nvim")
		-- project
		use("ahmedkhalf/project.nvim")

		-- treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				require("nvim-treesitter.install").update({ with_sync = true })
			end,
		})

		--------------------- LSP --------------------
		use({ "williamboman/mason.nvim" })
		use({ "williamboman/mason-lspconfig.nvim" })

		-- Lspconfig
		use({ "neovim/nvim-lspconfig" })

		-- 补全引擎
		use("hrsh7th/nvim-cmp")
		-- snippet 引擎
		use("hrsh7th/vim-vsnip")
		-- 补全源
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
		use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		use("hrsh7th/cmp-path") -- { name = 'path' }
		use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

		-- 常见编程语言代码段
		use("rafamadriz/friendly-snippets")

		-- lsp - ui
		use("onsails/lspkind-nvim")
		use("tami5/lspsaga.nvim")

		-- null-ls
		use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

		-- indent-blankline
		use("lukas-reineke/indent-blankline.nvim")

		-- autopairs
		use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter

		-- comment
		use({ "numToStr/Comment.nvim" })
		use({ "JoosepAlviste/nvim-ts-context-commentstring" })

		use({
			"akinsho/toggleterm.nvim",
		})

		-- git
		use({ "lewis6991/gitsigns.nvim" })

		-- surround
		use({ "kylechui/nvim-surround" })
		-- Todo comment
		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
		})
	end,
	config = {
		-- 并发数限制
		max_jobs = 16,
		-- 自定义源
		git = {
			-- default_url_format = "https://hub.fastgit.xyz/%s",
			-- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
			-- default_url_format = "https://gitcode.net/mirrors/%s",
			-- default_url_format = "https://gitclone.com/github.com/%s",
		},
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
	vim.cmd,
	[[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
