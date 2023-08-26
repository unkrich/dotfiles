local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  -- use 'kien/ctrlp'
  use 'editorconfig/editorconfig-vim'
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'ellisonleao/gruvbox.nvim'
  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
      -- lualine-nvim
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
      -- null-ls-nvim
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
      -- nvim-web-devicons
  use 'nvim-lua/plenary.nvim'
      -- tabular
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
      -- vim-elixir
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
      -- vim-markdown
      -- vim-prettier


  -- use 'vim-airline/vim-airline' -- Git branch displayed
  -- UI to select things (files, grep results, open buffers...)
  -- use 'nvim-lua/popup.nvim'


  use 'mhartington/oceanic-next'
  -- use 'itchyny/lightline.vim' -- Fancier statusline
  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
