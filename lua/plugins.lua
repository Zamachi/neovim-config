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
	use { "folke/twilight.nvim" }

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
			'nvim-lua/plenary.nvimc'
		}
	}

	use 'sindrets/diffview.nvim'
	
	use { 'ms-jpq/coq_nvim', branch="coq" } -- Coq completion
	use { 'ms-jpq/coq.artifacts', branch="artifacts" } -- snippets
	use { 'ms-jpq/coq.thirdparty', branch="3p" } -- third party features & integration

	use { 'p00f/nvim-ts-rainbow' }
	use { 'yamatsum/nvim-cursorline' }
	use { 'SmiteshP/nvim-gps' }
end)
