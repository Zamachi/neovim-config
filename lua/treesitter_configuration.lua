
require("nvim-treesitter.configs").setup{
	--Koje parsere instalirati
	ensure_installed = { "c", "cpp", "json", "python", "lua" },
	--Ukljucuje syntax highlighting od Treesittera
	highlight = {
		enable = true
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

}
-- za code folding (kada kod ima nesto ugnjezdeno/viselinijski komentar pa se "collapsuje")
vim.api.nvim_exec([[
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
]], true)
