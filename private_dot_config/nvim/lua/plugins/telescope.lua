return {
    {
        'nvim-telescope/telescope.nvim',
        version = 'false',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader>/",  "<cmd>Telescope live_grep<cr>",                 desc = "Grep (root dir)" },
            { "<leader>:",  "<cmd>Telescope command_history<cr>",           desc = "Command History" },
            -- find
            { "<leader>fb", "<cmd>Telescope buffers<cr>",                   desc = "Buffers" },
            { "<leader>ff", "<cmd>Telescope find_files<cr>",                desc = "Find Files" },
            { "<leader>fg", "<cmd>Telescope git_files<cr>",                 desc = "Git Files (root dir)" },
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                  desc = "Recent" },
            -- git
            { "<leader>gc", "<cmd>Telescope git_commits<CR>",               desc = "commits" },
            { "<leader>gs", "<cmd>Telescope git_status<CR>",                desc = "status" },
            -- search
            { "<leader>sa", "<cmd>Telescope autocommands<cr>",              desc = "Auto Commands" },
            { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
            { "<leader>sw", "<cmd>Telescope grep_string<cr>",               desc = "Word (root dir)" },
            {
                "<leader>sd",
                "<cmd>Telescope diagnostics bufnr=0<cr>",
                desc =
                "Document diagnostics"
            },
            {
                "<leader>sD",
                "<cmd>Telescope diagnostics<cr>",
                desc =
                "Workspace diagnostics"
            },
            { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
            {
                "<leader>uC",
                function() require('telescope.builtin').colorscheme({ enable_preview = true }) end,
                desc =
                "Colorscheme preview"
            },
        },
        config = function()
            require('telescope').load_extension('fzf')
        end,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },

}
