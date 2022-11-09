local M = {}

M.setup = function(on_attach, capabilities)
    require'lspconfig'.sumneko_lua.setup{
      on_attach = on_attach,
      capabilities = capabilities,
    }
end

return M
