-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information


-- Set relativenumber
vim.o.relativenumber = true

vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- split window
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sb", "<C-w>s") -- split window horizontally

-- ZenMod
vim.keymap.set("n", "<leader>sn", ":ZenMode<CR>")

-- [[ Highlight  on Cody]]
vim.api.nvim_set_hl(0, "CmpItemKindCody", { fg = "Red" })

vim.keymap.set('n', '<leader>cp', function()
  require("sg.cody.commands").focus_prompt()
end)

vim.keymap.set('n', '<leader>ch', function()
  require("sg.cody.commands").focus_history()
end)


return {}
