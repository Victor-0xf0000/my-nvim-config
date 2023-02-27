
local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

--- startup and add configure plugins
packer.startup(function()
  local use = use
  use {'nvim-treesitter/nvim-treesitter', branch="0.5-compat"}
  
  -- colorschemes
  use 'sainnhe/everforest'
  use 'joshdick/onedark.vim'
  use 'sainnhe/gruvbox-material'
  use 'sainnhe/edge'
  use 'sainnhe/sonokai'
  use { "bluz71/vim-moonfly-colors", as = "moonfly" }
  
  -- vim airline
  use 'nvim-lualine/lualine.nvim'
  
  -- nerdtree
  use'preservim/nerdtree'          
  use 'ryanoasis/vim-devicons'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  
  -- fuzzy finder
  use 'junegunn/fzf' 
  use 'junegunn/fzf.vim'            
  
  -- others
  use 'mg979/vim-visual-multi'      
  use 'tpope/vim-fugitive'
  use 'jiangmiao/auto-pairs'
  use 'aserebryakov/vim-todo-lists'  
  use 'yegappan/mru'
  use 'mhinz/vim-startify'
  use 'nvim-lua/plenary.nvim'
end
)
