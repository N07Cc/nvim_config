return {
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        -- -@type Flash.Config
        opts = {
            labels = "asdfghjklqwertyuiopzxcvbnm",
            label = {
                -- allow uppercase labels
                uppercase = true,
                -- add a label for the first match in the current window.
                -- you can always jump to the first match with `<CR>`
                current = true,
                -- for the current window, label targets closer to the cursor first
                distance = true,
            },
            modes = {
                search = {
                    enabled = true,
                    -- highlight = { backdrop = false },
                    -- jump = { history = true, register = true, nohlsearch = true },
                },
                char = {
                    enabled = true,
                    -- hide after jump when not using jump labels
                    autohide = false,
                    -- show jump labels
                    jump_labels = true,
                    -- set to `false` to use the current line only
                    multi_line = true,
                    -- When using jump labels, don't use these keys
                    -- This allows using those keys directly after the motion
                    label = { exclude = "hjkliardcs" },
                },
            },
        },
        -- stylua: ignore
        keys = {
            { "?", mode = { "n", "x", "o" }, function() require("flash").jump({ pattern = vim.fn.expand("<cword>") }) end, desc = "Flash"
        },
        -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "o" },      function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
        -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "n", "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
    },
}
