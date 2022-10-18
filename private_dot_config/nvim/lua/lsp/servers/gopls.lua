-- local M = {}

-- local util = require "lspconfig/util"

-- M.setup = function(on_attach, capabilities)
--     local lspconfig = require "lspconfig"

--     lspconfig.gopls.setup {
--         on_attach = on_attach,
--         flags = {
--             debounce_text_changes = 150,
--         },
--         capabilities = capabilities,
--         cmd = {"gopls", "serve"},
--         filetypes = {"go", "gomod"},
--         root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--         settings = {
--           gopls = {
--             analyses = {
--               unusedparams = true,
--             },
--             staticcheck = true,
--           },
--         },
--     }
-- end

-- return M