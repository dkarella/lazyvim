-- Snacks: terminal (LazyDocker), file explorer, fuzzy picker
return {
  'folke/snacks.nvim',
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
    { '<leader>gB',     function() Snacks.gitbrowse() end,             desc = 'Git Browse (open)', mode = { 'n', 'v' } },
    { '<leader>gg',     function() Snacks.lazygit({ win = { position = 'float', width = 0.9, height = 0.9 } }) end, desc = 'LazyGit' },
  },
}
