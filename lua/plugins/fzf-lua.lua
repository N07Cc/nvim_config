return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    enabled = false,
    dependencies = { "echasnovski/mini.icons" },
    keys = {
        { "<leader>ff", "<Cmd>FzfLua files<CR>", desc = "FzfLua find files." },
        { "<leader>fb", "<Cmd>FzfLua buffers<CR>", desc = "FzfLua buffers." },
        -- { "<leader>fh", ":FzfLua help_tags<CR>", desc = "FzfLua help tags." },
        { "<leader>fh", "<Cmd>FzfLua oldfiles<CR>", desc = "FzfLua file histories." },
        { "<leader>fw", "<Cmd>FzfLua live_grep<CR>", desc = "FzfLua live grep(find words)." },
        { "<leader>fo", "<Cmd>FzfLua aerial<CR>", desc = "FzfLua outlines." },
        { "<leader>fc", "<Cmd>FzfLua command_history<CR>", desc = "FzfLua command histories." },
        { "<leader>fdd", "<Cmd>FzfLua diagnostics_document<CR>", desc = "FzfLua diagnostic in document." },
        { "<leader>fdw", "<Cmd>FzfLua diagnostics_workspace<CR>", desc = "FzfLua diagnostic in workspace." },
        { "<leader>fp", "<Cmd>NeovimProjectDiscover<CR>", desc = "FzfLua discover projects." },
        -- { "<leader>fy", "<cmd>FzfLua yank_history", desc = "FzfLua yank histories." },
    },
    opts = {},
}
