vim.g.coq_settings={
	auto_start = true
}
-- nvimtree integration for project.nvim
vim.g.nvim_tree_update_cwd = 1
vim.g.nvim_tree_respect_buf_cwd = 1

local catppuccino = require("catppuccino")
local onedark = require("onedark")
local lualine = require('lualine')
local colorizer = require("colorizer")
local which_key = require("which-key")
local twilight = require("twilight")
local gitsigns = require("gitsigns")
local neogit = require("neogit")
local diffview = require("diffview")
local diffview_cb = require("diffview.config").diffview_callback
local nvim_gps = require("nvim-gps")
local lsp_status = require("lsp-status")
local lsp_colors = require("lsp-colors")
local le_coq = require("coq")
local indent_line = require("indent_blankline")
local telescope = require("telescope")
local project_nvim = require("project_nvim")
local autopairs = require("nvim-autopairs")
--local nvim_cursorline = require("nvim-cursorline") --could break setup
local bufferline = require("bufferline")

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

indent_line.setup({
	char = "|",
	buftype_exclude = {"terminal"}
})

project_nvim.setup({
    -- show_hidden = true
})

--set up projects to work with telescope
telescope.load_extension('projects')

telescope.setup({
    extensions = {
	projects = {
	    
	}
    }
})

lsp_colors.setup({
    Error = "#AA0000",
    Warning = "#e0af68",
    Information = "#00A0FF",
    Hint = "#00FF00"
})

autopairs.setup({
    
})

bufferline.setup({
    options = {
    numbers = function(opts) return string.format('%s)', opts.ordinal) end,
    -- number_style = "none", -- buffer_id at index 1, ordinal at index 2
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        return true
      end
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        return true
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        return true
      end
    end,
    offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center", highlight="Directory"}},
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "slant",  --| "thick" | "thin" | { 'any', 'any' }
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by =  'tabs' -- can also define a function for sorting function(buffer_a, buffer_b) end
  }
})


-- deploying the theme
vim.cmd[[colorscheme onedark]]
