local builtin = require('telescope.builtin')
require('telescope').load_extension('dap')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "telescope find files" })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<C-p>', function()
	local ok, _ = pcall(builtin.git_files)
	if not ok then
		builtin.find_files()
	end
end)
vim.keymap.set('n', '<leader>pk', builtin.keymaps, { desc = "telescope keymaps" })
vim.keymap.set('n', '<leader>pu', function()
	builtin.grep_string({
		search = '',
		file_ignore_patterns = { "swaggerui/**" },
	})
end, { desc = "grep in files and filenames" })
vim.keymap.set('n', '<leader>pi', builtin.live_grep, { desc = "#telescope live grep" })
vim.keymap.set('n', '<leader>pg', builtin.git_status, { desc = "#telescope Git diff" })
