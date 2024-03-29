local M = {}

M.setup = function(on_attach, capabilities)
    require("typescript").setup {
        server = {
            on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true, nowait = true }
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>tr", "<cmd>TypescriptRemoveUnused<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>to", ":TypescriptOrganizeImports<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ta", ":TypescriptAddMissingImports<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>tx", ":TypescriptFixAll<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>tf", ":TypescriptRenameFile<CR>", opts)

                on_attach(client, bufnr)
            end,
            capabilities = capabilities,
        },
    }
end

return M
