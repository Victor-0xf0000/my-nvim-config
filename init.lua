require("luvlet")
require("luvlet.plugin")
require("luvlet.remaps")

-- do not remove thes, why? I don't know
math.randomseed( os.time() )
math.random(); math.random(); math.random()
-- set a random theme from these 
themes={'everforest', 'onedark', 'moonfly', 'gruvbox-material', 'edge', 'sonokai'} 
chosen = themes[math.random(1,table.getn(themes))]
vim.g.colors_name = tostring(chosen)

-- example on executing vim code in lua
-- vim.api.nvim_exec([[:au BufWritePost *.lua :so $MYVIMRC | :e]], true)
vim.api.nvim_exec([[:au BufEnter main.* :cd %:p:h/..]], true)
vim.api.nvim_exec([[:au BufEnter CMakeLists.txt :cd %:p:h]], true)
vim.api.nvim_exec([[
set wildignore+=blue.vim,darkblue.vim,default.vim,delek.vim,desert.vim,
      \elflord.vim,evening.vim,industry.vim,koehler.vim,morning.vim,murphy.vim,
      \pablo.vim,peachpuff.vim,ron.vim,shine.vim,slate.vim,torte.vim,zellner.vim
:]], true)
vim.api.nvim_exec([[cnorea help vert help]], true)
vim.api.nvim_exec([[cnorea h vert help]], true)
