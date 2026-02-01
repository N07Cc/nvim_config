return {
    "coffebar/neovim-project",
    -- enabled = false,
    cmd = { "NeovimProjectDiscover", "NeovimProjectLoadRecent" },
    opts = {
        projects = { -- define project roots
            "~/projects/*",
            "~/WorkSpace/*",
            "~/.config/*",
        },
        picker = {
            type = "snacks", -- one of "telescope", "fzf-lua", or "snacks"
        },
    },
    keys = {
        { "<leader>fP", "<Cmd>NeovimProjectDiscover<CR>", desc = "Projects" },
    },
    init = function()
        -- enable saving the state of plugins in the session
        vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "folke/snacks.nvim" },
        { "Shatur/neovim-session-manager" },
    },
    -- lazy = false,
    priority = 100,
    config = function(_, opts)
        local uname = (vim.uv or vim.loop).os_uname()
        if uname.sysname == "Windows_NT" then
            -- 添加 Windows 下的配置文件路径
            table.insert(opts.projects, "~\\AppData\\Local\\nvim")
        end
        require("neovim-project").setup(opts)
    end,
}
