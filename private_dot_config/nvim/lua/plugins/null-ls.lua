require("null-ls").setup({
  sources = {
    -- Change sources here
    require("null-ls").builtins.formatting.prettierd,
    require("null-ls").builtins.diagnostics.eslint_d,
    require("null-ls").builtins.code_actions.eslint_d,
    require("null-ls").builtins.formatting.gofmt
  },
  on_attach = function(client)
    if client.server_capabilities.document_formatting then
        vim.cmd([[
        augroup LspFormatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
        augroup END
        ]])
    end
  end,
})
