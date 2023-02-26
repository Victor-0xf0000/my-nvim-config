vim.o.termguicolors = true
vim.o.syntax = 'on'
vim.o.errorbells = false
vim.o.smartcase = true
vim.o.showmode = false
vim.bo.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.o.undofile = true
vim.o.incsearch = true
vim.o.hidden = true
vim.o.completeopt='menuone,noinsert,noselect'
vim.bo.autoindent = true
vim.bo.smartindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.wo.number = true
vim.wo.relativenumber = false
vim.wo.wrap = false
vim.g.mapleader = " "
vim.g.sonokai_style = 'espresso'
vim.g.sonokai_better_performance = 1
vim.g.edge_style = 'neon'
vim.g.edge_better_performance = 1
vim.g.gruvbox_material_background = 'dark'
vim.g.gruvbox_material_better_performance = 1

-- do not remove these, why? I don't know
math.randomseed( os.time() )
math.random(); math.random(); math.random()
-- set a random theme from these 
themes={'everforest', 'onedark', 'moonfly', 'gruvbox-material', 'edge', 'sonokai'} 
chosen = themes[math.random(1,table.getn(themes))]
vim.g.colors_name = tostring(chosen)

local key_mapper = function(mode, key, result)
	vim.api.nvim_set_keymap(
		mode,
		key,
		result,
		{noremap=true, silent=true})
end

key_mapper('n', '<F12>', ':e<CR>')
key_mapper('n', '<F9>', ':so $MYVIMRC<CR> :e<CR>')

key_mapper('n', '<C-t>', ':NERDTreeToggle<CR>')

key_mapper('v', '<C-c>', '"+y')
key_mapper('i', '<C-c>', '<ESC>V"+y')
key_mapper('n', '<C-p>', '"+p')
key_mapper('n', '<C-x>', 'V"+y | dd')

key_mapper('n', '<leader>cd', ':cd %:p:h<CR>')
key_mapper('n', '<C-f>', ':FZF<CR>')

-- example on executing vim code in lua
-- vim.api.nvim_exec([[:au BufWritePost *.lua :so $MYVIMRC | :e]], true)
vim.api.nvim_exec([[:au BufEnter main.* :cd %:p:h/..]], true)
vim.api.nvim_exec([[:au BufEnter CMakeLists.txt :cd %:p:h]], true)
vim.api.nvim_exec([[
set wildignore+=blue.vim,darkblue.vim,default.vim,delek.vim,desert.vim,
      \elflord.vim,evening.vim,industry.vim,koehler.vim,morning.vim,murphy.vim,
      \pablo.vim,peachpuff.vim,ron.vim,shine.vim,slate.vim,torte.vim,zellner.vim
:]], true)
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
  use 'vim-airline/vim-airline' 
  
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
end
)

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"cpp"},
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true
  }
}
