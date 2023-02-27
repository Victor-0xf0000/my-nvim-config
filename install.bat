@echo on
rm -rf %appdata%/../local/nvim/lua
rm -rf %appdata%/../local/nvim/after
rm -rf %appdata%/../nvim/init.lua
cp -R init.lua %appdata%/../local/nvim/
cp -R after/ %appdata%/../local/nvim/
cp -R lua/ %appdata%/../local/nvim/
