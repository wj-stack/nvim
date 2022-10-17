# 安装node npm for mason
sudo apt update
sudo apt install nodejs npm


cargo install stylua
go install mvdan.cc/gofumpt@latest

目前nvim 7.2


mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { auync = true } <CR>", opt)



sudo apt install software-properties-common 
sudo apt update
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt install neovim

// 安装pip 
sudo apt install python3-pip
sudo apt install python3-venv
pip3 install jedi
pip3 install jedi-language-server
// 安装高版本node
sudo apt install -y nodejs npm 
sudo npm install n -g
sudo n stable
// 安装yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update

