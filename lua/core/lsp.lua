vim.lsp.enable({
    "lua_ls",
    "basedpyright",
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- stylua: ignore start
        map("K", function() vim.lsp.buf.hover({ border = "rounded" }) end, "Hover")
        map("gh", function() vim.lsp.buf.hover({ border = "rounded" }) end, "Hover")
        map("<leader>rn", vim.lsp.buf.rename, "Rename")
        map("grn", vim.lsp.buf.rename, "Rename")
        map("gd", function() Snacks.picker.lsp_definitions() end, "Goto Definition")
        map("gD", function() Snacks.picker.lsp_declarations() end, "Goto Declaration")
        map("gr", function() Snacks.picker.lsp_references() end, "References")
        map("gi", function() Snacks.picker.lsp_implementations() end, "Goto Implementation")
        map("gy", function() Snacks.picker.lsp_type_definitions() end, "Goto T[y]pe Definition")
        map("gai", function() Snacks.picker.lsp_incoming_calls() end, "C[a]lls Incoming")
        map("gao", function() Snacks.picker.lsp_outgoing_calls() end, "C[a]lls Outgoing")
        map("<leader>ss", function() Snacks.picker.lsp_symbols() end, "LSP Symbols")
        map("<leader>sw", function() Snacks.picker.lsp_workspace_symbols() end, "LSP Workspace Symbols")
        local ok, conform = pcall(require, "conform")
        if ok then
            map("<leader>=", function ()
                conform.format({
                    lsp_fallback = true,
                    -- async = false,
                    timeout_ms = 500,
                })
            end, "Format with conform")
        else
            map("<leader>=", function ()
                vim.lsp.buf.format({
                    -- async = false,
                    timeout_ms = 500,
                })
            end, "Format with LSP")
        end
        -- stylua: ignore end

        local function client_supports_method(client, method, bufnr)
            return client:supports_method(method, bufnr)
        end

        -- 自动高亮你光标下内容的引用，并在光标移动时清除
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if
            client
            and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
        then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({
                        group = "lsp-highlight",
                        buffer = event2.buf,
                    })
                end,
            })
        end

        -- 创建一个快捷键，以便切换是否启用 Inlay Hints（如果可用）
        -- if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
        --   vim.lsp.inlay_hint.enable(true) -- 默认启用，你可以把它改为false
        --   vim.keymap.set("n", "<leader>uh", function()
        --     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
        --     if vim.lsp.inlay_hint.is_enabled { bufnr = event.buf } then
        --       vim.notify("Inlay hints: " .. "ON")
        --     else
        --       vim.notify("Inlay hints: " .. "OFF")
        --     end
        --   end, { desc = "Toggle Inlay Hints" })
        -- end
    end,
})

-- 诊断信息设置
-- 查看 :help vim.diagnostic.Opts
vim.diagnostic.config({
    severity_sort = true,
    float = { border = "rounded", source = "if_many" },
    underline = { severity = vim.diagnostic.severity.ERROR },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ", -- 这里配置“错误”的图标，需要nerd font字体
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = " ",
        },
    },
    virtual_text = {
        source = "if_many",
        spacing = 2,
        format = function(diagnostic)
            local diagnostic_message = {
                [vim.diagnostic.severity.ERROR] = diagnostic.message,
                [vim.diagnostic.severity.WARN] = diagnostic.message,
                [vim.diagnostic.severity.INFO] = diagnostic.message,
                [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
        end,
    },
})
