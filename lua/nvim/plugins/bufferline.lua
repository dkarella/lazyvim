return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  opts = {
    options = {
      diagnostics = 'nvim_lsp',
      offsets = {
        {
          filetype = 'snacks_layout_box',
          text = 'Explorer',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
    },
  },
  keys = {
    { '<S-l>', '<cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Prev buffer' },
    { '<leader>bd', '<cmd>bdelete<CR>', desc = 'Delete buffer' },
    { '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', desc = 'Close other buffers' },
    { '<leader>br', '<cmd>BufferLineCloseRight<CR>', desc = 'Close buffers to right' },
    { '<leader>bl', '<cmd>BufferLineCloseLeft<CR>', desc = 'Close buffers to left' },
  },
}
