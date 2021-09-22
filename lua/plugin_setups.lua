--autostartuje completion modul
vim.g.coq_settings = { auto_start = true }

-- nvimtree integration for project.nvim
vim.g.nvim_tree_update_cwd = 1
vim.g.nvim_tree_respect_buf_cwd = 1

local catppuccino = require("catppuccino")
local onedark = require("onedark")
local lualine = require('lualine')
local colorizer = require("colorizer")
local which_key = require("which-key")
local gitsigns = require("gitsigns")
local neogit = require("neogit")
local nvim_gps = require("nvim-gps")
local lsp_status = require("lsp-status")
local le_coq = require("coq")
local indent_line = require("indent_blankline")
local telescope = require("telescope")
local autopairs = require("nvim-autopairs")
--local nvim_cursorline = require("nvim-cursorline") --could break setup


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
        lsp_trouble = true,
        lsp_saga = false,
        gitgutter = false,
        gitsigns = true,
        telescope = true,
        nvimtree = {enabled = true, show_root = true},
        which_key = true,
        indent_blankline = {enabled = true, colored_indent_levels = false},
        dashboard = false,
        neogit = true,
        vim_sneak = false,
        fern = false,
        barbar = false,
        bufferline = false,
        markdown = false,
        lightspeed = false,
        ts_rainbow = true,
        hop = false
    }
})

vim.g.onedark_style = "deep"
vim.g.onedark_transparent_background = false
onedark.setup({
    
})

nvim_gps.setup({
		icons = {
			["class-name"] = ' ',      -- Classes and class-like objects
			["function-name"] = ' ',   -- Functions
			["method-name"] = ' ',      -- Methods (functions inside class-like objects)
		    ["container-name"] = '⛶ '
        },
		-- Disable any languages individually over here
		-- Any language not disabled here is enabled by default
		languages = {
			-- ["bash"] = false,
			-- ["go"] = false,
		},
		separator = ' > ',
})


lualine.setup({
	options = { 
		--theme = "catppuccino"
		theme = "onedark"
	},
	extensions = { "nvim-tree"},
	sections = {
		lualine_c = {
			'filename',
			-- gps je za breadcrumbs na statusline-u
			{ nvim_gps.get_location, condition = nvim_gps.is_available }, 	
		},
		lualine_x = {
			{ lsp_status.status  } ,
			'encoding', 'fileformat', 'filetype'},
	}
})

colorizer.setup({
	"css";
	"javascript";
	lua = { mode = "background" };
	html= { mode = "background" };
}, { mode = "foreground" })

which_key.setup({
--empty means it's default settings
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


indent_line.setup({
	char = "|",
	buftype_exclude = {"terminal"}
})

--project_nvim.setup({
    -- show_hidden = true
--})

--ocitava telescope extenziju za projekte 
telescope.load_extension('project')

telescope.setup({
    extensions = {
	    project = {
	    }
    }
})


autopairs.setup({
    
})


-- deploying the theme
vim.cmd[[colorscheme onedark]]
