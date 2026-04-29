-- Minimal Neovim config based on kickstart.nvim
-- Designed for use with vscode-neovim (also works standalone)
-- vim.g.vscode == 1 when running inside VSCode
--
-- Layout:
--   lua/shared/   shared modules (options, keymaps, autocmds, lazy bootstrap, shared plugins)
--   lua/nvim/     standalone-only (keymaps + plugins)
--   lua/vsc/      vscode-only     (keymaps + plugins) — name avoids clash with `vscode` plugin module

require('shared.config.options')
require('shared.config.keymaps')
require('shared.config.autocmds')

if vim.g.vscode then
  require('vsc.keymaps')
else
  require('nvim.keymaps')
end

require('shared.config.lazy')
