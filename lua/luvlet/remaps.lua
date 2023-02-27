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
--vim.g.sonokai_style = 'espresso'
--vim.g.edge_style = 'neon'
--vim.g.gruvbox_material_style = 'dark'

vim.g.startify_lists = {{
  type='sessions',
  header={' Sessions'}
}, {
  type='bookmarks',
  header={' Bookmarks'}
},{
  type='files', 
  header={' MRU'}
}}
vim.g.startify_files_number = 5
vim.g.startify_session_persistence = 0

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

key_mapper('n', '<leader>ut', ':UndotreeToggle<cr>')
