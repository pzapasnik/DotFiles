vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "#vim save" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "#vim quit" })
vim.keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "#vim save & quit" })
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, desc = "#vim quit insert mode" })
-- golang wsl linter
vim.api.nvim_set_keymap('n', '<leader>lw', ':!wsl -fix %<cr>',
	{ noremap = true, silent = true, desc = "#golang fix white spaces" })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "#vim EX file mode" })
--vim.keymap.set("v", "<leader>y", ":w !pbcopy", { desc = "#vim copy to clipbord" })


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "#vim move one line bottom" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "#vim move one line top" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "#vim join this line and line below it" })


vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "#vim Scroll down half a page and center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "#vim Scroll up half a page and center cursor" })
vim.keymap.set("n", "n", "nzzzv", { desc = "#vim Repeat search forward and center cursor" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "#vim Repeat search backward and center cursor" })
--some-prime-plugin, tutorial ? to remove ?
vim.keymap.set("n", "<leader>vwm", function() require("vim-with-me").StartVimWithMe() end,
	{ desc = "#vim Start Vim With Me plugin" })
vim.keymap.set("n", "<leader>svwm", function() require("vim-with-me").StopVimWithMe() end,
	{ desc = "#vim Stop Vim With Me plugin" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "#vim  Put yanked text before cursor in visual mode" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "#vim Yank selected text or current line into clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "#vim Yank current line into clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]],
	{ desc = "#vim Delete selected text or current line without yanking it" })

vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Q key mapping" })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>",
	{ desc = "#tmux Open new mutex window with project workspaces" })

vim.keymap.set("n", "<C-h>", "<c-w>h", { desc = "#vim Move to the left window split" })
vim.keymap.set("n", "<C-j>", "<c-w>j", { desc = "#vim Move to the window split below" })
vim.keymap.set("n", "<C-k>", "<c-w>k", { desc = "#vim Move to the window split above" })
vim.keymap.set("n", "<C-l>", "<c-w>l", { desc = "#vim Move to the right window split" })
vim.keymap.set("n", "<leader>k", "<cmd>cnext<CR>zz", { desc = "#vim Navigate to the next error" })
vim.keymap.set("n", "<leader>j", "<cmd>cprev<CR>zz", { desc = "#vim Navigate to the previous error" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "#vim Start a substitution command pre-filled with the word under cursor" })

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>",
	{ silent = true, desc = "#bash Make the current file executable" })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/zapas/packer.lua<CR>",
	{ desc = "Open packer.lua configuration" })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>",
	{ desc = "Execute 'CellularAutomaton make_it_rain' command" })

vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end, { desc = "#vim Execute the 'so' command" })



-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "#LSP format" })

--plugin do vima ktory tworzy animacje spadajacych literek...
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
