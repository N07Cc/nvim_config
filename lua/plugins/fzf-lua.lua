return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  enabled = false,
  dependencies = { "echasnovski/mini.icons" },
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "FzfLua find files." },
    { "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "FzfLua buffers." },
    -- { "<leader>fh", ":FzfLua help_tags<CR>", desc = "FzfLua help tags." },
    { "<leader>fh", "<cmd>FzfLua oldfiles<CR>", desc = "FzfLua file histories." },
    { "<leader>fw", "<cmd>FzfLua live_grep<CR>", desc = "FzfLua live grep(find words)." },
    { "<leader>fo", "<cmd>FzfLua aerial<CR>", desc = "FzfLua outlines." },
    { "<leader>fc", "<cmd>FzfLua command_history<CR>", desc = "FzfLua command histories." },
    { "<leader>fdd", "<cmd>FzfLua diagnostics_document<CR>", desc = "FzfLua diagnostic in document." },
    { "<leader>fdw", "<cmd>FzfLua diagnostics_workspace<CR>", desc = "FzfLua diagnostic in workspace." },
    { "<leader>fp", "<cmd>NeovimProjectDiscover<CR>", desc = "FzfLua discover projects." },
    -- { "<leader>fy", "<cmd>FzfLua yank_history", desc = "FzfLua yank histories." },
  },
  opts = {},
}

