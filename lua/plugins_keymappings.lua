local which_key = require("which-key")

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
		K = {"<cmd>bd<cr>", "Kill a current buffer"}
	},
	t = {
		name = "Toggles",
		T = { "<cmd>Twilight<cr>", "Toggle Twilight" },
		N = { "<cmd>NvimTreeToggle<cr>", "Toggle Neovim project tree" }
	},
	s = {
		name = "Search...",
		b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current buffer"}
	},
	g = {
		name = "Git version control",
		s = {"<cmd>Neogit<cr>", "(Neo)git status"}
	}

}, { prefix = "<Leader>" })
