local status, todo = pcall(require, "todo-comments")
if not status then
	vim.notify("没有找到 todo-comments")
	return
end

todo.setup({})

-- https://github.com/folke/todo-comments.nvim
