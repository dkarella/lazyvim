-- Gitsigns: per-line git diff markers in the sign column + inline hunk preview
return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    -- Sign-column glyphs per change type
    signs = {
      add          = { text = '┃' },
      change       = { text = '┃' },
      delete       = { text = '▁' },
      topdelete    = { text = '▔' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    on_attach = function(bufnr)
      local gs = require('gitsigns')
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      -- Navigate between hunks
      map('n', ']h', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.nav_hunk('next') end)
        return '<Ignore>'
      end, 'Next Hunk')
      map('n', '[h', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.nav_hunk('prev') end)
        return '<Ignore>'
      end, 'Prev Hunk')

      -- Inspect / preview hunks
      map('n', '<leader>hp', gs.preview_hunk, 'Preview Hunk')
      map('n', '<leader>hd', gs.diffthis, 'Diff Against Index')
      map('n', '<leader>hD', function() gs.diffthis('~') end, 'Diff Against Last Commit')
      map('n', '<leader>hb', function() gs.blame_line({ full = true }) end, 'Blame Line (full)')
      -- Show deleted lines inline in the buffer
      map('n', '<leader>hx', gs.toggle_deleted, 'Toggle Deleted (inline)')

      -- Stage / reset hunks
      map('n', '<leader>hs', gs.stage_hunk, 'Stage Hunk')
      map('n', '<leader>hr', gs.reset_hunk, 'Reset Hunk')
      map('v', '<leader>hs', function() gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, 'Stage Hunk')
      map('v', '<leader>hr', function() gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, 'Reset Hunk')
      map('n', '<leader>hu', gs.undo_stage_hunk, 'Undo Stage Hunk')
      map('n', '<leader>hS', gs.stage_buffer, 'Stage Buffer')
      map('n', '<leader>hR', gs.reset_buffer, 'Reset Buffer')

      -- Text object: select a hunk (e.g. `vih`, `dih`)
      map({ 'o', 'x' }, 'ih', gs.select_hunk, 'Select Hunk')
    end,
  },
}
