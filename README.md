# 安装node npm for mason
sudo apt update
sudo apt install nodejs npm


cargo install stylua
go install mvdan.cc/gofumpt@latest

目前nvim 7.2


mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { auync = true } <CR>", opt)
