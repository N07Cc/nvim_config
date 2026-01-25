return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        -- log_level = vim.log.levels.DEBUG, -- 启用调试日志
        formatters_by_ft = {
            lua = { "stylua" },
            -- python = { "ruff_organize_imports", lsp_format = "last" },
            -- go = { "goimports", "gofmt" },
            -- toml = { "taplo" },
            -- markdown = { "markdownlint-cli2" },
        },
    },
}
