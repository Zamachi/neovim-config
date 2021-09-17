local catppuccino = require("catppuccino")
local lualine = require('lualine')
local colorizer = require("colorizer")
local which_key = require("which-key")
local twilight = require("twilight")
local gitsigns = require("gitsigns")
local neogit = require("neogit")
local diffview = require("diffview")
local diffview_cb = require("diffview.config").diffview_callback

catppuccino.setup({
    colorscheme = "neon_latte",
    transparency = false,
    term_colors = false,
    styles = {
        comments = "bold",
        functions = "NONE",
        keywords = "NONE",
        strings = "NONE",
        variables = "NONE"
    },
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = "italic",
                hints = "italic",
                warnings = "italic",
                information = "italic"
            },
            underlderlines = {
                errors = "underline",
                hints = "underline",
                warnings = "underline",
                information = "underline"
            }
        },
        lsp_trouble = false,
        lsp_saga = false,
        gitgutter = false,
        gitsigns = true,
        telescope = true,
        nvimtree = {enabled = true, show_root = true},
        which_key = true,
        indent_blankline = {enabled = false, colored_indent_levels = false},
        dashboard = false,
        neogit = true,
        vim_sneak = false,
        fern = false,
        barbar = false,
        bufferline = false,
        markdown = false,
        lightspeed = false,
        ts_rainbow = false,
        hop = false
    }
})

vim.cmd[[colorscheme catppuccino]]
lualine.setup({
	options = { theme = "catppuccino" },
	extensions = { "nvim-tree"}
})

colorizer.setup({
	"css";
	"javascript";
	html= { mode = "background" };
}, { mode = "foreground" })

which_key.setup({
--empty means it's default settings
})

twilight.setup({
	dimming = {
		alpha = 0.25, -- koliko dimmujemo
		color = { "Normal", "#ffffff"}, 
		inactive = true -- kada je true, svi drugi prozori su dimmed(osim ako ne sadrze isti buffer)
	},
	context = 10, --koliko linija ce se prikazivati od trenutne linije? 
	treesitter = true, -- da li se koristi Treesitter ugradjeni plugin(gde moze)
	expand = { -- sta se "expanduje" u treesitteru
		"function",
		"method",
		"table",
		"if_statement"
	},
	exclude = {}

})

neogit.setup({	
	disable_signs = false,
  	disable_context_highlighting = false,
    	disable_commit_confirmation = true,
      	auto_refresh = true,
        disable_builtin_notifications = false,
	commit_popup = {
		kind = "split",
	},
	-- customize displayed signs
	signs = {
	-- { CLOSED, OPENED }
		section = { ">", "v" },
		item = { ">", "v" },
		hunk = { "", "" },
	},
	integrations = {
		-- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
		-- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
		-- Requires you to have `sindrets/diffview.nvim` installed.
		-- use { 
			--   'TimUntersberger/neogit', 
			--   requires = { 
				--     'nvim-lua/plenary.nvim',
			    	--     'sindrets/diffview.nvim' 
			--   }
		-- }
		diffview = true 
	},
	-- override/add mappings
	--mappings = {
		-- modify status buffer mappings
	--	commit = {
			-- Adds a mapping with "B" as key that does the "BranchPopup" command
			--["B"] = "BranchPopup",
			-- Removes the default mapping of "s"
			--["s"] = "",
	--		["<C-c><C-c>"] = "Commit"
	--	}
	--}
})

gitsigns.setup({
	
})

diffview.setup({

})

