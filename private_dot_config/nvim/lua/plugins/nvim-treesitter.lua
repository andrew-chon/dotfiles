-- add more treesitter parsers
return {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        ensure_installed = {
            "bash",
            "git_rebase",
            "gitcommit",
            "go",
            "html",
            "java",
            "javascript",
            "jsdoc",
            "json",
            "lua",
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
        context_commentstring = {
            enable = true, -- for nvim-ts-context-commentstring
            enable_autocmd = false,
        },
        highlight = {
            enable = true,
        },

    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
