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

-- Explore
vim.keymap.set("n", "<leader>se", ":Explore<CR>")

-- keymap :%!jq '.'
vim.keymap.set("n", "<leader>jq", ":%!jq '.'<CR>")

-- save file
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- format File
vim.keymap.set("n", "<leader>ff", ":Format<CR>")

-- [[ Highlight  on Cody]]
vim.api.nvim_set_hl(0, "CmpItemKindCody", { fg = "Red" })

vim.keymap.set('n', '<leader>cp', function()
    require("sg.cody.commands").focus_prompt()
end)

vim.keymap.set('n', '<leader>ch', function()
    require("sg.cody.commands").focus_history()
end)

vim.keymap.set("n", '<leader>gl', ":Glow<CR>")

-- [[ Copilot ]]
vim.g.copilot_assume_mapped = true
local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- [[ Emmet setup ]]
lspconfig.emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "css", "eruby", "html", "html.tmpl", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
    init_options = {
        html = {
            options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                ["bem.enabled"] = true,
            },
        },
    }
})

-- remove trailing whitespace
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { "*" },
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        pcall(function() vim.cmd [[%s/\s\+$//e]] end)
        vim.fn.setpos(".", save_cursor)
    end,
})

-- set filetype=html for *.gohtml
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.gohtml, *.html, *.html.tmpl" },
    command = "set filetype=html",
})

-- format file on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go" },
    command = "Format"
})

return {}
