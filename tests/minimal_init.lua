-- Minimal init.lua for running tests in a headless Neovim instance.
-- This avoids loading user configuration and plugins.

-- Disable swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Add the plugin root to runtimepath so `require` can find the plugin modules
vim.opt.rtp:prepend(".")

-- Disable loading of default plugins to keep the test environment minimal
vim.opt.loadplugins = false
