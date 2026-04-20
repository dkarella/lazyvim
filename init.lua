-- Minimal Neovim config based on kickstart.nvim
-- Designed for use with vscode-neovim (also works standalone)
-- vim.g.vscode == 1 when running inside VSCode
--
-- Layout:
--   lua/shared/   shared modules (options, keymaps, autocmds, lazy bootstrap, shared plugins)
--   lua/nvim/     standalone-only (keymaps + plugins)
--   lua/vscode/   vscode-only     (keymaps + plugins)

require('shared.config.options')
require('shared.config.keymaps')
require('shared.config.autocmds')

if vim.g.vscode then
  require('vscode.keymaps')
else
  require('nvim.keymaps')
end

require('shared.config.lazy')
