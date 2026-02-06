if vim.g.vscode then
    -- for VSCode extension
    require("3rd-party.vscode.options")
    require("core.lazy")
    require("3rd-party.vscode.autocmds")
    require("3rd-party.vscode.keymaps")
else
    require("config.options")
    require("core.lazy")
    require("core.lsp")
    require("config.autocmds")
    require("config.keymaps")
    vim.cmd([[set fillchars+=eob:\ ]])
    vim.cmd.colorscheme("catppuccin-mocha")
end
