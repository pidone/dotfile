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
  use 'wbthomason/packer.nvim'

  use { "catppuccin/nvim", as = "catppuccin" }
  use { "romgrk/barbar.nvim", wants = "nvim-tree/nvim-web-devicons" }
  use { "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } }
  use { "nvim-lualine/lualine.nvim" }

   use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  }
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    branch = "0.1.x",
  }

  use "chrisbra/csv.vim"

  use "lewis6991/gitsigns.nvim"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "rhysd/vim-clang-format"
  use "fatih/vim-go"
  use "SirVer/ultisnips"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/nvim-cmp"
  use "neovim/nvim-lspconfig"
  use "onsails/lspkind-nvim"
  use "quangnguyen30192/cmp-nvim-ultisnips"
  use "williamboman/nvim-lsp-installer"
  use "numToStr/Comment.nvim"
  use { "kylechui/nvim-surround", tag = "*" }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
