return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
        { "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous tab" },
        { "<S-l>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
        { "[b",    "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous tab" },
        { "]b",    "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },

    },
    opts = {
        options = {
            -- stylua: ignore
            close_command = function(n) require("mini.bufremove").delete(n, false) end,
            -- stylua: ignore
            right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
            diagnostics = "nvim_lsp",
            always_show_bufferline = false,
            offsets = {
                {
                    filetype = "neo-tree",
                    text = function()
                        return vim.fn.getcwd()
                    end,
                    highlight = "Directory",
                    text_align = "left",
                },
            },
        },
    },
}
