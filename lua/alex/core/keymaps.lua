local opts = { noremap = true, silent = true }
local keymap = vim.keymap

-- general keymap

-- use jk to exit insert mode
keymap.set({ "n", "i", "v" }, "jk", "<ESC>") -- return to normal mode
keymap.set({ "n", "i", "v" }, "jj", "<ESC>:update<CR>") --return to normal mdoe and savey
keymap.set({ "n", "i", "v" }, "<C-s>", ":update<CR>") --return to normal mdoe and savey

-- move blocks of code visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete line without copying to register
keymap.set("n", "<leader>dd", '"_dd')

-- delete word without copying to register
keymap.set("n", "<leader>dw", '"_dw')

--delete single character without copying into register
keymap.set("n", "x", '"_x')

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- plugin keymaps
--

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>fe", ":NvimTreeFindFile<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>") -- list available help tags

-- diff-view
keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<CR>")
keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>")

-- LSP
keymap.set({ "n", "v" }, "<leader>fm", function()
	vim.lsp.buf.format()
end, opts)

-- Buffers
keymap.set("n", "<leader>b", "<cmd> enew <CR>")

-- Comment
keymap.set({ "n", "i" }, "<C-_>", function()
	require("Comment.api").toggle.linewise.current()
end, opts)

-- Telescope
-- git
keymap.set("n", "<leader>cm", "<cmd>Telescope git_commits <CR>", opts)
keymap.set("n", "<leader>gt", "<cmd>Telescope git_status <CR>", opts)

-- Editor Config
keymap.set("n", "<leader>config", "e ~/.config/nvim <CR>", opts)
