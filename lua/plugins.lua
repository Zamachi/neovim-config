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
    -- https://github.com/nvim-treesitter/nvim-treesitter
    use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use "Pocco81/Catppuccino.nvim"

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    -- https://github.com/folke/which-key.nvim
    use { "folke/which-key.nvim" }
    -- https://github.com/norcalli/nvim-colorizer.lua
	use { "norcalli/nvim-colorizer.lua" }
    -- https://github.com/nvim-telescope/telescope.nvim
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- https://github.com/kyazdani42/nvim-tree.lua
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'
		}
    -- https://github.com/neovim/nvim-lspconfig
	use { "neovim/nvim-lspconfig" }
    -- https://github.com/TimUntersberger/neogit
	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
	-- https://github.com/lewis6991/gitsigns.nvim
    use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}
    -- https://github.com/sindrets/diffview.nvim
	use 'sindrets/diffview.nvim'
    -- https://github.com/ms-jpq/coq_nvim
	use { 'ms-jpq/coq_nvim', branch="coq" } -- Coq completion
	use { 'ms-jpq/coq.artifacts', branch="artifacts" } -- snippets
	use { 'ms-jpq/coq.thirdparty', branch="3p" } -- third party features & integration
    
    -- https://github.com/p00f/nvim-ts-rainbow
	use { 'p00f/nvim-ts-rainbow' }
    -- https://github.com/SmiteshP/nvim-gps
	use { 'SmiteshP/nvim-gps' }
    -- https://github.com/nvim-lua/lsp-status.nvim 
	use { 'nvim-lua/lsp-status.nvim' }
	-- https://github.com/williamboman/nvim-lsp-installer
    use {
		'williamboman/nvim-lsp-installer',
	}
    -- https://github.com/folke/lsp-colors.nvim
	use 'folke/lsp-colors.nvim'
    -- https://github.com/ray-x/lsp_signature.nvim 
	use {
		"ray-x/lsp_signature.nvim",
	}
    -- https://github.com/folke/trouble.nvim
	use {
		  "folke/trouble.nvim",
		    requires = "kyazdani42/nvim-web-devicons",
	}

	-- slicno kao Treemacs UI symbol viewer
	-- https://github.com/simrat39/symbols-outline.nvim
    use 'simrat39/symbols-outline.nvim'

	--omogucava da konfigurisem LSP sa JSON fajlovima kao Coc-Settings
	-- https://github.com/tamago324/nlsp-settings.nvim
    use 'tamago324/nlsp-settings.nvim'
	-- linije za indentaciju (visual aid)
    -- https://github.com/lukas-reineke/indent-blankline.nvim
	use 'lukas-reineke/indent-blankline.nvim'
    -- https://github.com/windwp/nvim-autopairs
	use 'windwp/nvim-autopairs'
    -- https://github.com/joshdick/onedark.vim
	use 'navarasu/onedark.nvim'
    -- https://github.com/nvim-telescope/telescope-project.nvim
    use 'nvim-telescope/telescope-project.nvim'
    -- https://github.com/preservim/nerdcommenter
    use 'preservim/nerdcommenter'
    -- https://github.com/rmagatti/auto-session/
    use 'rmagatti/auto-session'
    use 'sbdchd/neoformat'
    use 'kevinhwang91/nvim-hlslens'
    -- https://github.com/windwp/nvim-projectconfig
    use 'windwp/nvim-projectconfig'
    -- https://github.com/tyru/open-browser.vim
    use 'tyru/open-browser.vim'
    use 'tamago324/telescope-openbrowser.nvim' -- might not be needed!

    use 'NTBBloodbath/doom-one.nvim'
    use 'liuchengxu/space-vim-theme'
    -- https://github.com/glepnir/lspsaga.nvim
    use 'glepnir/lspsaga.nvim'
    -- https://github.com/famiu/bufdelete.nvim
    use 'famiu/bufdelete.nvim'
    -- https://github.com/jghauser/mkdir.nvim
    use {
        'jghauser/mkdir.nvim',
        config = function()
            require('mkdir')
        end
    }
end)
