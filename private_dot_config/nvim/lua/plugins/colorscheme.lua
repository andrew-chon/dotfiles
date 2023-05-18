return {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- load the colorscheme here
        vim.cmd([[colorscheme nordfox]])
    end,
}
