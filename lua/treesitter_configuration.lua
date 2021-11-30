--dohvata konfiguracije svih parsera
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

-- parser za org mode
parser_config.org = {
	install_info = {
		url = "https://github.com/milisims/tree-sitter-org",
		revision = "main",
		files = { "src/parser.c", "src/scanner.cc" },
	},
	filetype = "org",
}

require("nvim-treesitter.configs").setup({
	--Koje parsere instalirati
	ensure_installed = { "org", "c", "cpp", "json", "python", "lua", "html", "css", "javascript", "php" },
	--Ukljucuje syntax highlighting od Treesittera
	highlight = {
		enable = true,
		disable = { "org" },
		additional_vim_regex_highlighting = { "org" },
	},
	-- inkrementalna selekcija se bazira na hijerarhiji koda
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	-- enable Treesitter indentation
	--indent = {
	--	enable = true
	--}
	rainbow = {
		enable = true,
		extended_mode = true, -- Hajlajtuje i delimitere kao html tagove, boolean, tabele itd.
		max_file_lines = nil,
		-- colors = {}, -- Lua tabela sa hexadec stringovima za boje koje se koriste
		-- termcolors = {} -- Isto kao i iznad, samo za Terminal Neovim
	},
	autopairs = { enable = true },
})
-- za code folding (kada kod ima nesto ugnjezdeno/viselinijski komentar pa se "collapsuje")
vim.api.nvim_exec(
	[[
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
]],
	true
)
