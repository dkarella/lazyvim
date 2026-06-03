-- VS Code-specific keymaps (vscode-neovim only)
local map = vim.keymap.set
local vscode = require('vscode')

-- Splits — mirror standalone | and \ bindings
map('n', '|', function() vscode.call('workbench.action.splitEditorDown') end, { desc = 'Split Editor Down' })
map('n', '\\', function() vscode.call('workbench.action.splitEditor') end, { desc = 'Split Editor Right' })

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

-- Diagnostic navigation (mirror standalone ]d / [d)
map('n', ']d', function() vscode.call('editor.action.marker.next') end, { desc = 'Next Diagnostic' })
map('n', '[d', function() vscode.call('editor.action.marker.prev') end, { desc = 'Prev Diagnostic' })

-- Git hunk navigation
map('n', ']h', function() vscode.call('workbench.action.editor.nextChange') end, { desc = 'Next Hunk' })
map('n', '[h', function() vscode.call('workbench.action.editor.previousChange') end, { desc = 'Prev Hunk' })

-- Navigate between editor groups (override shared window nav)
map('n', '<C-h>', function() vscode.call('workbench.action.focusLeftGroup') end, { desc = 'Focus Left Group' })
map('n', '<C-l>', function() vscode.call('workbench.action.focusRightGroup') end, { desc = 'Focus Right Group' })
map('n', '<C-j>', function() vscode.call('workbench.action.focusBelowGroup') end, { desc = 'Focus Below Group' })
map('n', '<C-k>', function() vscode.call('workbench.action.focusAboveGroup') end, { desc = 'Focus Above Group' })
