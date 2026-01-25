return {
    "mason-org/mason.nvim",
    cmd = "Mason",
    lazy = false,
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
            border = "rounded",
        },
        ensure_installed = {
            "lua-language-server",
            "basedpyright",
        },
    },
    config = function(_, opts)
        require("mason").setup(opts)
    end,
}
