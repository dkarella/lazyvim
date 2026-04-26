-- Standalone-only keymaps (VS Code handles splits via its own commands)
local map = vim.keymap.set

map("n", "|", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "\\", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Close Window", remap = true })
map("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })

-- Terminal mode: ctrl-hjkl moves out of the terminal window
map("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Focus Left Window" })
map("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Focus Below Window" })
map("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Focus Above Window" })
map("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Focus Right Window" })
