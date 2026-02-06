local vscode = require("vscode")

-- keymaps
local opt = { noremap = true, silent = true }

-- 普通模式和可视模式的按键映射
vim.keymap.set({ "n", "v" }, "L", "$", opt)
vim.keymap.set({ "n", "v" }, "H", "^", opt)
vim.keymap.set({ "n", "v" }, "Y", '"+y', opt)
vim.keymap.set({ "n", "v" }, "C", '"+c', opt)
vim.keymap.set({ "n", "v" }, "D", '"+d', opt)
vim.keymap.set({ "n" }, ">", ">>", opt)
vim.keymap.set({ "n" }, "<", "<<", opt)
vim.keymap.set({ "n" }, "YY", '"+yy', opt)
vim.keymap.set({ "n" }, "CC", '"+cc', opt)
vim.keymap.set({ "n" }, "DD", '"+dd', opt)
-- vim.keymap.set({ "n" }, "j", "gj", opt)
-- vim.keymap.set({ "n" }, "k", "gk", opt)

-- stylua: ignore start
-- 使用 vscode.action 或 vscode.call 接口进行映射
-- vim.keymap.set({ "n" }, "<C-p>", function() vscode.call("workbench.action.closeActiveEditor") end, opt)
vim.keymap.set({ "n" }, "<CR>", function() vscode.call("editor.action.insertLineAfter") end, opt)
vim.keymap.set({ "n" }, "<leader>s", function() vscode.call("workbench.action.files.save") end, opt)
vim.keymap.set({ "n" }, "<leader>q", function() vscode.call("workbench.action.closeActiveEditor") end, opt)
vim.keymap.set({ "n" }, "<leader>t", function() vscode.call("openInIntegratedTerminal") end, opt)
vim.keymap.set({ "n" }, "<leader>T", function() vscode.call("workbench.action.terminal.newWithProfile") end, opt)
-- vim.keymap.set("n", "?", function() vscode.call("actions.find") end, opt)
vim.keymap.set({ "n" }, "<leader>ee", function() vscode.call("workbench.view.explorer") end, opt)
vim.keymap.set({ "n" }, "<leader>a", function() vscode.call("outline.focus") end, opt)
vim.keymap.set({ "n" }, "<leader>z", function() vscode.call("workbench.action.toggleZenMode") end, opt)
vim.keymap.set({ "n" }, "<leader>ff", function() vscode.call("workbench.action.quickOpen") end, opt)
vim.keymap.set({ "n" }, "<leader>fw", function() vscode.call("workbench.action.findInFiles") end, opt)
vim.keymap.set({ "n" }, "<leader>fn", function() vscode.call("workbench.action.files.newUntitledFile") end, opt)
vim.keymap.set({ "n" }, "<leader>fo", function() vscode.call("workbench.action.gotoSymbol") end, opt)
vim.keymap.set({ "n" }, "<leader>rn", function() vscode.call("editor.action.rename") end, opt)
vim.keymap.set({ "n" }, "<leader>xf", function() vscode.call("editor.action.quickFix") end, opt)
vim.keymap.set({ "n" }, "gd", function() vscode.call("editor.action.revealDefinition") end, opt)
vim.keymap.set({ "n" }, "gD", function() vscode.call("editor.action.peekDefinition") end, opt)
vim.keymap.set({ "n" }, "gl", function() vscode.call("editor.action.openLink") end, opt)

-- 导航和编辑器操作的按键映射
vim.keymap.set({ "n" }, "<leader>wh", function() vscode.call("workbench.action.navigateLeft") end, opt)
vim.keymap.set({ "n" }, "<leader>wl", function() vscode.call("workbench.action.navigateRight") end, opt)
vim.keymap.set({ "n" }, "<leader>wj", function() vscode.call("workbench.action.navigateDown") end, opt)
vim.keymap.set({ "n" }, "<leader>wk", function() vscode.call("workbench.action.navigateUp") end, opt)
vim.keymap.set({ "n" }, "<leader>wH", function() vscode.call("workbench.action.moveEditorToPreviousGroup") end, opt)
vim.keymap.set({ "n" }, "<leader>wL", function() vscode.call("workbench.action.moveEditorToNextGroup") end, opt)
vim.keymap.set({ "n" }, "<leader>w=", function() vscode.call("workbench.action.evenEditorWidths") end, opt)
vim.keymap.set({ "n" }, "<leader>=", function() vscode.action("editor.action.format") end, opt)
-- stylua: ignore end

-- vim.keymap.set({ "n", "x", "i" }, "<C-d>", function()
--     require("vscode-multi-cursor").addSelectionToNextFindMatch()
-- end)

vim.keymap.set({ "n" }, "<leader>ga", function()
    vscode.action("tongyi.show.panel.chat")
end, opt)
