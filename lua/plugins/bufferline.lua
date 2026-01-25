return {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<C-l>", "<cmd>BufferLineCycleNext<CR>", mode = { "n", "i" }, desc = "Move to next buffer" },
        { "<C-h>", "<cmd>BufferLineCyclePrev<CR>", mode = { "n", "i" }, desc = "Move to previous buffer" },
    },
    opts = {
        options = {
            mode = "buffers", -- 可以是 "buffers" 或 "tabs"
            separator_style = "thick", -- 可以是 "thin", "thick", 或 "slant"
            -- numbers = "buffer_id",
            always_show_bufferline = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            color_icons = true,
            diagnostics = "nvim_lsp",
            diagnostics_update_on_event = true, -- use nvim's diagnostic handler
            -- indicator = {
            --     style = "underline"
            -- },
            offsets = {
                {
                    filetype = "snacks_layout_box",
                    text = "File Explorer",
                    highlight = "Directory",
                    -- text_align = "left",
                    separator = true,
                },
                {
                    filetype = "aerial",
                    text = "Outline",
                    text_align = "left",
                },
            },
        },
    },
    -- config = function(_, opts)
    --     if (vim.g.colors_name or ""):find("catppuccin") then
    --         opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
    --     end
    -- end,
}
