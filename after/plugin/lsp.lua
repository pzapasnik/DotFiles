local lsp = require('lsp-zero').preset({
	name = 'minimal',
	set_lsp_keymaps = false,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil
cmp_mappings['<C-f>'] = nil


--lua-language-server config
lsp.configure('lua_ls', {
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
		},
	},
})


require("lsp_signature").setup({})

--golang formaters and linters
require('lspconfig').gopls.setup({
	settings = {
		gopls = {
			gofumpt = true
		}
	}
})

lsp.ensure_installed({
	'tsserver',
	'eslint',
})


lsp.set_preferences({
	sign_icons = {}
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false, desc = "#LSP" }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
		{ buffer = bufnr, remap = false, desc = "#LSP Go to definition" })
	vim.keymap.set("n", "<leader>lt", function() vim.lsp.buf.type_definition() end,
		{ buffer = bufnr, remap = false, desc = "#LSP Go to Type definition" })
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
		{ buffer = bufnr, remap = false, desc = "#LSP Show documentation / information" })
	vim.keymap.set("n", "<leader>ls", function() vim.lsp.buf.workspace_symbol() end,
		{ buffer = bufnr, remap = false, desc = "#LSP Search for workspace symbols" })
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
		{ buffer = bufnr, remap = false, desc = "#LSP Go to next diagnostic" })
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
		{ buffer = bufnr, remap = false, desc = "#LSP Go to previouse diagnostic" })
	vim.keymap.set("n", "<leader>lc", function() vim.lsp.buf.code_action() end,
		{ buffer = bufnr, remap = false, desc = "#LSP Execute code action" })
	vim.keymap.set("n", "<leader>lr", function() telescope.lsp_references() end,
		{ buffer = bufnr, remap = false, desc = "#LSP #telescope Telescope find references" })
	vim.keymap.set("n", "<leader>ln", function() vim.lsp.buf.rename() end,
		{ buffer = bufnr, remap = false, desc = "#LSP rename symbol and all references" })
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
		{ buffer = bufnr, remap = false, desc = "#LSP Show signature help" })
	vim.keymap.set("n", "<leader>ll", ":LspRestart<CR>",
		{ buffer = bufnr, remap = false, desc = "#LSP restart" })
end)


vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]] --format on save
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.golines,
		formatting.goimports,
		formatting.fixjson.with({
			args = { "--indent", "2" },
		}),
	},
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end
			})
		end
	end,
})


lsp.setup()
