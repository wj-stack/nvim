local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	hide_numbers = false,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "double", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		winblend = 20,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
	winbar = {
		enabled = true,
		name_formatter = function(term) --  term: Terminal
			return term.name
		end,
	},
})

local Terminal = require("toggleterm.terminal").Terminal

local map = {} -- is show ?
local cap = 1 -- float term
local idx = 1 -- 2 - cap show else hide
local function _toggle(c, isCreate)
	local create = Terminal:new({
		hide_numbers = false,
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = false,
		insert_mappings = true,
		persist_size = true,
		direction = "horizontal",
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			border = "double", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
			winblend = 20,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
		count = c,
		on_open = function(t)
			map[t.name] = true
			print("open term : " .. t.name)
		end,

		on_close = function(t)
			map[t.name] = false
			print("close term : " .. t.name)
		end,
	})
	create:toggle()
	if isCreate then
		cap = cap + 1
	end
end

function LeftTerm()
	for key, value in pairs(map) do
		-- terminal name and value
	end

	idx = idx - 1
	if idx < 2 then
		idx = 2
	end
	print("terminal" .. idx)
	for i = 2, cap do
		if map[i] == true and i ~= idx then
			_toggle(i, false) -- show
		end
		map[i] = false
		if i == idx and map[i] == false then
			map[i] = true
			_toggle(i, false) -- show
		end
	end
end

function RightTerm()
	idx = idx + 1
	if idx > cap then
		idx = cap
	end
	for i = 2, cap do
		if map[i] == true and i ~= idx then
			_toggle(i, false) -- show
		end
		map[i] = false
		if i == idx and map[i] == false then
			map[i] = true
			_toggle(i, false) -- show
		end
	end
end

function NewTerm()
	-- idx = cap + 1
	-- map[cap + 1] = true
	-- _toggle(cap + 1, true)
	_toggle(cap + 1, false)
end
-- TODO: t[] 切换 <leader>t 创建term
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua NewTerm()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "t[", "<cmd>lua LeftTerm()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "t]", "<cmd>lua RightTerm()<CR>", { noremap = true, silent = true })
