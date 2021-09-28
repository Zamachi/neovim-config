local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd 'packadd packer.nvim'
end

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])


return require('packer').startup(function()

	use 'wbthomason/packer.nvim'
	
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use "Pocco81/Catppuccino.nvim"

	use {
		'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	
	use { "folke/which-key.nvim" }

	use { "norcalli/nvim-colorizer.lua" }

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'
		}

	use { "neovim/nvim-lspconfig" }
	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
	
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}

	use 'sindrets/diffview.nvim'
	
	use { 'ms-jpq/coq_nvim', branch="coq" } -- Coq completion
	use { 'ms-jpq/coq.artifacts', branch="artifacts" } -- snippets
	use { 'ms-jpq/coq.thirdparty', branch="3p" } -- third party features & integration

	use { 'p00f/nvim-ts-rainbow' }
	use { 'SmiteshP/nvim-gps' }
	use { 'nvim-lua/lsp-status.nvim' }
	use {
		'williamboman/nvim-lsp-installer',
	}

	use 'folke/lsp-colors.nvim'

	use {
		"ray-x/lsp_signature.nvim",
	}
	use {
		  "folke/trouble.nvim",
		    requires = "kyazdani42/nvim-web-devicons",
	}
	-- slicno kao Treemacs UI symbol viewer
	use 'simrat39/symbols-outline.nvim'

	--omogucava da konfigurisem LSP sa JSON fajlovima kao Coc-Settings
	use 'tamago324/nlsp-settings.nvim'

	-- linije za indentaciju (visual aid)
	use 'lukas-reineke/indent-blankline.nvim'

	use 'windwp/nvim-autopairs'

	use 'navarasu/onedark.nvim'
    use 'nvim-telescope/telescope-project.nvim'
    use 'preservim/nerdcommenter'
    -- https://github.com/rmagatti/auto-session/
    use 'rmagatti/auto-session'
    use 'sbdchd/neoformat'
    use 'kevinhwang91/nvim-hlslens'
    use 'windwp/nvim-projectconfig'
    use 'tyru/open-browser.vim'
    use 'tamago324/telescope-openbrowser.nvim' -- might not be needed!

    use 'NTBBloodbath/doom-one.nvim'
    use 'liuchengxu/space-vim-theme'
    use 'glepnir/lspsaga.nvim'
end)
