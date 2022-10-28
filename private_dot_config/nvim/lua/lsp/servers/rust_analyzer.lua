local rt = require("rust-tools")
local M = {}

M.setup = function(on_attach, capabilities)
    -- rt.setup({
    --   server = {
    --         on_attach = on_attach,
    --         capabilities = capabilities,
    --     },
    -- })
    rt.setup({})
end

return M
