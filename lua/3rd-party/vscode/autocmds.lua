-- 关闭新行注释
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "*",
    callback = function()
        vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
    end,
})

-- 自动切换输入法
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    pattern = "*",
    callback = function()
        local input_status = tonumber(vim.fn.system("D:\\Programs\\im-select\\im-select.exe"))
        if input_status == 2052 then
            vim.fn.system("D:\\Programs\\im-select\\im-select.exe 1033")
            input_status = tonumber(vim.fn.system("D:\\Programs\\im-select\\im-select.exe"))
        end
    end,
})
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    pattern = "*",
    callback = function()
        local input_status = tonumber(vim.fn.system("D:\\Programs\\im-select\\im-select.exe"))
        if input_status == 1033 then
            vim.fn.system("D:\\Programs\\im-select\\im-select.exe 2052")
        end
    end,
})
