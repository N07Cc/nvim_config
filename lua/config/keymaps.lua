-- 保存本地变量
local base_opts = { noremap = true, silent = true }

---@param desc string
---@return vim.keymap.set.Opts
local function opts_with_desc(desc)
    return vim.tbl_extend("force", base_opts, { desc = desc })
end

vim.keymap.set({ "i", "c" }, "<C-S-V>", "<C-R>+", base_opts)
vim.keymap.set({ "n", "v" }, "<C-S-V>", '"*p', base_opts)

-- 基础操作映射
vim.keymap.set({ "n" }, "<leader>s", "<cmd>w<CR>", base_opts)
-- vim.keymap.set({ "n" }, "<leader>q", "<cmd>bd<CR>", base_opts)

-- Save session and files and quit.
vim.keymap.set({ "n" }, "<leader>Q", function()
    -- local ok, _ = pcall(require, "persisted")
    -- if ok then
    --   vim.cmd([[SessionSave]])
    -- end
    vim.cmd([[messages clear]])
    vim.cmd([[wqa]])
end, base_opts)
vim.keymap.set({ "n", "v" }, "L", "$", base_opts)
vim.keymap.set({ "n", "v" }, "H", "^", base_opts)
vim.keymap.set({ "n", "v" }, "Y", '"+y', base_opts)
-- vim.keymap.set({ "n", "v" }, "<leader>p", '"*p', opts)

vim.keymap.set({ "n" }, ">", ">>", base_opts)
vim.keymap.set({ "n" }, "<", "<<", base_opts)
vim.keymap.set({ "n" }, "YY", '"+yy', base_opts)

-- 分屏快捷键映射 <leader>w -> <C-w>
vim.keymap.set({ "n" }, "<leader>w", "<C-w>", base_opts)
-- vim.keymap.set({ "n" }, "<leader>ww", function()
--   local ok, window_picker = pcall(require, "window-picker")
--   -- print("window-picker start!")
--   if not ok then
--     vim.cmd([[wincmd w]])
--     return
--   end
--   local picked_window_id = window_picker.pick_window()
--   if picked_window_id then
--     vim.api.nvim_set_current_win(picked_window_id)
--   else
--     vim.cmd([[wincmd w]])
--   end
-- end, opts_with_desc("Use window-picker to pick a window, or fallback to `wincmd w`"))

-- tab操作
vim.keymap.set({ "n" }, "<C-L>", "<cmd>tabnext<CR>", base_opts)
vim.keymap.set({ "n" }, "<C-H>", "<cmd>tabprevious<CR>", base_opts)
