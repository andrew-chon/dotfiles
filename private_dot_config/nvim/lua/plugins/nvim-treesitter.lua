-- add more treesitter parsers
return {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        ensure_installed = {
            "bash",
            -- "css",
            "comment",
            "git_rebase",
            "gitcommit",
            "go",
            "gomod",
            -- "html",
            -- "java",
            "javascript",
            "jsdoc",
            "json",
            "lua",
            "make",
            "markdown",
            "markdown_inline",
            "python",
            "regex",
            "rust",
            "sql",
            "terraform",
            "tsx",
            "typescript",
            "vim",
            "yaml",
        },
        highlight = {
            enable = true,
        },

    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
