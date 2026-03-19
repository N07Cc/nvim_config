return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    opts = {
        highlight = {
            enable = true,
            disable = function(_, buf)
                local max_filesize = 1024 * 1024 -- 1 MB
                local ok, stats = pcall((vim.uv or vim.loop).fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
        },
        indent = { enable = true },
        autopairs = { enable = true },
        auto_install = true,
        ensure_installed = {
            "bash",
            "c",
            "diff",
            "html",
            "javascript",
            "jsdoc",
            "json",
            "jsonc",
            "lua",
            "luadoc",
            "luap",
            "markdown",
            "markdown_inline",
            "printf",
            "python",
            "query",
            "regex",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "xml",
            "yaml",
            "go", -- golang
            "gomod",
            "gowork",
            "gosum",
            "gotmpl",
            "latex", -- latex
            "bibtex",
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn", -- set to `false` to disable one of the mappings
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
