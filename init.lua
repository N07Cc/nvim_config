if vim.g.vscode then
    -- for VSCode extension
else
    require("config.options")
    require("core.lazy")
    require("core.lsp")
    require("config.autocmds")
    require("config.keymaps")
    vim.cmd([[set fillchars+=eob:\ ]])
    vim.cmd.colorscheme("catppuccin-mocha")
end
