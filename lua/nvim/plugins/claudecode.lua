-- Claude Code IDE extension: in-editor Claude terminal + diff review
return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  opts = {
    terminal = {
      snacks_win_opts = {
        position = 'float',
        width = 0.9,
        height = 0.9,
        border = 'rounded',
        keys = {
          -- Ctrl-hjkl hides the float and navigates to the adjacent window.
          -- Single Esc is preserved so Claude CLI can still cancel generations.
          term_nav_h = { '<C-h>', function(self) self:hide(); vim.cmd('wincmd h') end, mode = 't', desc = 'Hide + Focus Left' },
          term_nav_j = { '<C-j>', function(self) self:hide(); vim.cmd('wincmd j') end, mode = 't', desc = 'Hide + Focus Below' },
          term_nav_k = { '<C-k>', function(self) self:hide(); vim.cmd('wincmd k') end, mode = 't', desc = 'Hide + Focus Above' },
          term_nav_l = { '<C-l>', function(self) self:hide(); vim.cmd('wincmd l') end, mode = 't', desc = 'Hide + Focus Right' },
        },
      },
    },
  },
  keys = {
    { 'C',          '<cmd>ClaudeCode<cr>',           desc = 'Toggle Claude' },
    { 'C',          '<cmd>ClaudeCodeSend<cr>',       mode = 'v', desc = 'Send to Claude' },
    { '<leader>a',  nil,                             desc = 'AI/Claude Code' },
    { '<leader>af', '<cmd>ClaudeCodeFocus<cr>',      desc = 'Focus Claude' },
    { '<leader>ar', '<cmd>ClaudeCode --resume<cr>',  desc = 'Resume Claude' },
    { '<leader>aC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
    { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
    { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>',      desc = 'Add current buffer' },
    { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
    { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>',   desc = 'Deny diff' },
  },
}
