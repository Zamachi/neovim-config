local which_key = require("which-key")

-- U CommitMessage (kada se u Neogit statusu pretisne c pa opet c za Commit) omogucava da se komituje sa C-c C-c, umesto :wq
vim.cmd("autocmd FileType NeogitCommitMessage nnoremap <buffer> <C-c><C-c> :wq<CR>")

--remapuje gx da koristi open-browser-smart-search za link pod kursorom
vim.api.nvim_set_keymap('n','gx', '<Plug>(openbrowser-smart-search)<cr>', {})


which_key.register({
	f = {
		name = "file", -- optional group name
		f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
	},
	w = {
		name = "Window Management",
		v = { "<cmd>wincmd v<cr>", "Split Window vertically" },
		s = { "<cmd>wincmd s<cr>", "Split Window horizontally" },
		h = { "<cmd>wincmd h<cr>", "Move to the Window on the left"},
		l = { "<cmd>wincmd l<cr>", "Move to the Window on the right"},
		k = { "<cmd>wincmd k<cr>", "Move to the Window above"},
		j = { "<cmd>wincmd j<cr>", "Move to Window below"},
		d = { "<cmd>wincmd q<cr>", "Delete current Window"},
		
	},
	b = {
		name = "Buffer Management",
		b = { "<cmd>Telescope buffers<cr>", "Switch to a buffer" },
		K = {"<cmd>bd<cr>", "Kill a current buffer"},
	},
	t = {
		name = "Toggles",
		N = { "<cmd>NvimTreeToggle<cr>", "Toggle Neovim project tree" },
		s = {"<cmd>SymbolsOutline<cr>", "Toggle symbol hierarchy" },
		e = {"<cmd>LspTroubleToggle<cr>", "Toggle error list"}
	},
	s = {
		name = "Searching...",
		b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current buffer"}
	},
	g = {
		name = "Git version control",
		s = {"<cmd>Neogit<cr>", "(Neo)git status"}
	},
	p = {
		name = "Project management",
		p = {"<cmd>Telescope project display_type=full<cr>", "Open projects..."},
        e = {"<cmd>lua.require('nvim-projectconfig').edit_project_config()<cr>", "Edit current project's configuration"},
        l = {"<cmd>lua.require('nvim-projectconfig').load_project_config()<cr>", "Load project configuration"}
	},
    q = {
        name = "Session management",
        s = {"<cmd>SaveSession<cr>", "Save session for cwd"},
        r = {"<cmd>RestoreSession<cr>", "Restore a previous session"}
    },
    h = {
        name = "GitSigns",
        -- PRAZNO ZNACI DA CUVAMO DEFAULT KEYBINDING
    },
    c = {
        name = "Comment(ing)"
         --PRAZNO ZNACI DA CUVAMO DEFAULT KEYBINDING
    }

}, { prefix = "<Leader>" })
