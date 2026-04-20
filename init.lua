-- Minimal Neovim config based on kickstart.nvim
-- Designed for use with vscode-neovim (also works standalone)
-- vim.g.vscode == 1 when running inside VSCode

-- ============================================================
-- OPTIONS
-- ============================================================
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.swapfile = false
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- ============================================================
-- KEYMAPS
-- ============================================================
local map = vim.keymap.set

-- Window navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Focus Left Window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Focus Right Window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Focus Below Window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Focus Above Window' })

-- Function navigation (uses Vim built-in [m / ]m under the hood)
map('n', '[f', '[m', { desc = 'Previous function' })
map('n', ']f', ']m', { desc = 'Next function' })

-- Windows (standalone only — VS Code handles splits via vscode.call below)
if not vim.g.vscode then
  map('n', '|', '<C-W>s', { desc = 'Split Window Below', remap = true })
  map('n', '\\', '<C-W>v', { desc = 'Split Window Right', remap = true })
end

-- Buffers — copy path/name to clipboard
map('n', '<leader>bn', function()
  local rel = vim.fn.expand('%')
  local fname = rel
  for token in rel.gmatch(rel, '[^/]+') do
    fname = token
  end
  vim.fn.setreg('+', fname)
end, { desc = 'Copy buffer file name to clipboard' })

map('n', '<leader>bp', function()
  local rel = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':.')
  vim.fn.setreg('+', rel)
end, { desc = 'Copy buffer relative path to clipboard' })

map('n', '<leader>bP', function()
  local abs = vim.api.nvim_buf_get_name(0)
  vim.fn.setreg('+', abs)
end, { desc = 'Copy buffer absolute path to clipboard' })

-- Terminal: escape to normal mode
map('t', '<C-x>', [[<C-\><C-n>]], { desc = 'Enter normal mode in terminal' })

-- Insert macros
map('i', '<C-t>', function()
  vim.api.nvim_put({ '// TODO: @danny ' }, 'c', true, true)
end, { desc = 'Insert TODO comment' })

map('i', '<C-n>', function()
  vim.api.nvim_put({ '// NOTE: @danny ' }, 'c', true, true)
end, { desc = 'Insert NOTE comment' })

-- Quit
map('n', '<leader>qq', '<cmd>qa<CR>', { desc = 'Quit Neovim' })

-- Clear search highlight on <Esc>
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- VS Code-specific keymaps (vscode-neovim only)
if vim.g.vscode then
  local vscode = require('vscode')
  -- Splits — mirror standalone | and \ bindings
  map('n', '|', function() vscode.call('workbench.action.splitEditorDown') end, { desc = 'Split Editor Down' })
  map('n', '\\', function() vscode.call('workbench.action.splitEditor') end, { desc = 'Split Editor Right' })
  -- File explorer (replaces snacks.explorer which is disabled in VS Code)
-- Tab navigation
  map('n', 'H', function() vscode.call('workbench.action.previousEditor') end, { desc = 'Previous Tab' })
  map('n', 'L', function() vscode.call('workbench.action.nextEditor') end, { desc = 'Next Tab' })
  map('n', '<leader>bo', function() vscode.call('workbench.action.closeOtherEditors') end, { desc = 'Close Other Tabs' })
  map('n', '<leader>bl', function() vscode.call('workbench.action.closeEditorsToTheLeft') end, { desc = 'Close Tabs to Left' })
  map('n', '<leader>br', function() vscode.call('workbench.action.closeEditorsToTheRight') end, { desc = 'Close Tabs to Right' })
  -- File/string search
  map('n', '<leader><leader>', function() vscode.call('workbench.action.quickOpen') end, { desc = 'Find Files' })
  map('n', '<leader>/', function() vscode.call('workbench.action.findInFiles') end, { desc = 'Find in Files' })
  -- LSP-style navigation (migrated from VSCodeVim config)
  map('n', 'gI', function() vscode.call('editor.action.goToImplementation') end, { desc = 'Go to Implementation' })
  map('n', 'gr', function() vscode.call('editor.action.goToReferences') end, { desc = 'Go to References' })
  map('n', 'K', function() vscode.action('editor.action.showHover', { args = { { focus = true } } }) end, { desc = 'Show Hover (focused)' })
  -- Navigate between editor groups
  map('n', '<C-h>', function() vscode.call('workbench.action.focusLeftGroup') end, { desc = 'Focus Left Group' })
  map('n', '<C-l>', function() vscode.call('workbench.action.focusRightGroup') end, { desc = 'Focus Right Group' })
  map('n', '<C-j>', function() vscode.call('workbench.action.focusBelowGroup') end, { desc = 'Focus Below Group' })
  map('n', '<C-k>', function() vscode.call('workbench.action.focusAboveGroup') end, { desc = 'Focus Above Group' })
end

-- ============================================================
-- AUTOCMDS
-- ============================================================

-- Disable autoformat for YAML/JSON (no formatter configured here,
-- but keeping for parity if one is added later)
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'yaml', 'json', 'jsonc' },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- ============================================================
-- BOOTSTRAP lazy.nvim
-- ============================================================
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system({
    'git', 'clone', '--filter=blob:none', '--branch=stable',
    'https://github.com/folke/lazy.nvim.git', lazypath,
  })
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================
-- PLUGINS
-- ============================================================
require('lazy').setup({

  -- Treesitter: parser management + syntax highlighting
  -- nvim-treesitter v2 removed the `configs` module; highlighting goes through
  -- Neovim's built-in vim.treesitter API. The plugin handles parsers only.
  {
    'nvim-treesitter/nvim-treesitter',
    cond = not vim.g.vscode,
    build = ':TSUpdate',
    config = function()
      -- Auto-enable treesitter highlighting per filetype
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(ev)
          pcall(vim.treesitter.start, ev.buf)
        end,
      })
    end,
  },

  -- Smart word motions: W/E/B are camelCase & snake_case aware
  -- Useful in both standalone and VSCode
  {
    'chrisgrieser/nvim-spider',
    lazy = false,
    config = function()
      vim.keymap.set({ 'n', 'o', 'x' }, 'W', function() require('spider').motion('w') end, { desc = 'Spider-w' })
      vim.keymap.set({ 'n', 'o', 'x' }, 'E', function() require('spider').motion('e') end, { desc = 'Spider-e' })
      vim.keymap.set({ 'n', 'o', 'x' }, 'B', function() require('spider').motion('b') end, { desc = 'Spider-b' })
    end,
  },

  -- The plugins below are UI/standalone only — disabled inside VSCode

  -- Colorscheme
  {
    'EdenEast/nightfox.nvim',
    cond = not vim.g.vscode,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('carbonfox')
    end,
  },

  -- Snacks: terminal (LazyDocker), file explorer, fuzzy picker
  {
    'folke/snacks.nvim',
    cond = not vim.g.vscode,
    priority = 1000,
    lazy = false,
    opts = {
      terminal = {
        win = {
          position = 'right',
          width = 0.5,
          winbar = false,
        },
      },
      explorer = { show_hidden = true },
      picker = {
        sources = {
          files = { hidden = true },
          grep  = { hidden = true },
        },
      },
      scroll = { enabled = false },
    },
    keys = {
      { '<leader>ld',     function() Snacks.terminal('lazydocker') end, desc = 'LazyDocker' },
      { '<leader>e',      function() Snacks.explorer() end,             desc = 'File Explorer' },
      { '<leader><leader>', function() Snacks.picker.files() end,        desc = 'Find Files' },
      { '<leader>/',      function() Snacks.picker.grep() end,           desc = 'Grep' },
    },
  },

  -- Undotree
  {
    'mbbill/undotree',
    cond = not vim.g.vscode,
    keys = {
      { '<leader>uu', '<cmd>UndotreeToggle<cr>', desc = 'Toggle Undotree' },
    },
  },

  -- Which-key: keymap hints
  {
    'folke/which-key.nvim',
    cond = not vim.g.vscode,
    event = 'VimEnter',
    opts = {
      icons = { mappings = false },
      spec = {
        { '<leader>b', group = 'buffer' },
        { '<leader>l', group = 'tools' },
        { '<leader>u', group = 'ui' },
      },
    },
  },

}, {
  -- Lazy.nvim settings
  checker = { enabled = true, notify = false },
  performance = {
    rtp = {
      disabled_plugins = { 'gzip', 'tarPlugin', 'tohtml', 'tutor', 'zipPlugin' },
    },
  },
})
