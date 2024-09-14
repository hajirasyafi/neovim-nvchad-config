-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- EXAMPLE
local servers = {
	html = {},
	cssls = {},
	bashls = {},
	htmx = {
		filetypes = {
			"gohtml",
			"gohtmltmpl",
			"templ",
			"htmx",
		},
	},
	ts_ls = {},
	gopls = {},
	tailwindcss = {
		filetypes = {
			"typescriptreact",
			"javascriptreact",
			"html",
			"htmx",
			"templ",
			"blade",
			"gohtml",
			"gohtmltmpl",
			"css",
			"less",
			"postcss",
			"sass",
			"scss",
		},
	},
	templ = {},
	phpactor = {},
	clangd = {},
	prismals = {},
	eslint = {
		settings = {
			workingDirectories = {
				mode = "auto",
			},
		},
	},
	pyright = {
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					typeCheckingMode = "basic",
				},
			},
		},
	},
	lemminx = {},
}
local nvlsp = require("nvchad.configs.lspconfig")

-- lsps with default config
for name, opts in pairs(servers) do
	opts.on_init = nvlsp.on_init
	opts.on_attach = nvlsp.on_attach
	opts.capabilities = nvlsp.capabilities

	require("lspconfig")[name].setup(opts)
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
