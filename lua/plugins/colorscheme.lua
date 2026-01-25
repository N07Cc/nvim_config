return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    opts = {
      extra_groups = {
        "NormalFloat",
        "FloatBorder",
        "TabLineFill",
        "LspInlayHint",
        "NoiceFormatProgressDone",
        "NoiceFormatProgressTodo",
        "NeoTreeWinSeparator",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "NeoTreeVertSplit",
        "NeoTreeCursor",
        "NeoTreeCursorLine",
        "AerialLine",
        "AerialLineNC",
      },
      exclude_groups = { "CursorLine", "CursorLineNr" },
    },
    config = function(_, opts)
      local transparent = require("transparent")
      transparent.clear_prefix("BufferLine")
      transparent.clear_prefix("BlinkCmpMenu")
      -- transparent.clear_prefix("NeoTree")
      transparent.clear_prefix("lualine_c")
      transparent.clear_prefix("lualine_x")
      transparent.clear_prefix("Trouble")
      transparent.setup(opts)
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    -- priority = 1000,
    opts = {
      transparent = vim.g.transparent_enabled,
      styles = vim.g.transparent_enabled and {
        sidebars = "transparent",
        floats = "transparent",
      } or {},
    },
  },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = true,
    -- priority = 1000,
    opts = {
      filter = "classic",
      transparent_background = vim.g.transparent_enabled,
      background_clear = {
        "float_win",
        "toggleterm",
        "telescope",
        "which-key",
        "renamer",
        "notify",
        -- "nvim-tree",
        "neo-tree",
        "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
      },
      override = function(c)
        return {
          TabLineSel = { link = "Normal" },
          FloatBorder = { fg = "#8CAAEE" },
          WinSeparator = { fg = "#51576D" },
          NeoTreeWinSeparator = { fg = "#51576D" },
          NeoTreeFloatBorder = { link = "FloatBorder" },
          NeoTreeFloatTitle = { link = "FloatTitle" },
          LspInlayHint = {
            -- fg of `Comment`
            fg = c.base.dimmed3,
            -- bg of `CursorLine`
            -- bg = c.editor.lineHighlightBackground,
            bg = "none",
          },
          FlashLabel = { fg = "#C8D3F5", bg = "#FF007C" },
        }
      end,
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "auto", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = vim.g.transparent_enabled,
      highlight_overrides = {
        all = function(colors)
          return {
            -- ["@property"] = { fg = "#65bcff" },
            ["@property"] = { fg = "#B4F9F8" },
            ["@module"] = { fg = "#66d9ef" },
            ["@variable"] = { fg = "#fdfff1" },
            -- Function = { fg = "#A6E22E" },
            FlashLabel = { fg = "#c8d3f5", bg = "#ff007c" },
            BlinkCmpMenu = { fg = "none", bg = "#2a2b3c" },
            BlinkCmpMenuBorder = { fg = "#89b4fa", bg = "#2a2b3c" },
          }
        end,
      },
      color_overrides = {
        all = {
          lavender = "#7287FD",
          -- text = "#fdfff1",
        },
      },
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        -- grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        -- leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        render_markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        -- snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
        blink_cmp = true,
      },
      specs = {
        {
          "akinsho/bufferline.nvim",
          -- optional = true,
          opts = function(_, opts)
            if (vim.g.colors_name or ""):find("catppuccin") then
              opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
            end
          end,
        },
      },
    },
    config = function(_, opts)
      -- -- 切换 colorscheme 为 catppuccin 后自动更新 bufferline
      -- vim.api.nvim_create_autocmd("ColorScheme", {
      --   pattern = "*",
      --   callback = function(args)
      --     if (args.match or ""):find("catppuccin") then
      --       require("bufferline").setup({
      --         highlights = require("catppuccin.groups.integrations.bufferline").get(),
      --       })
      --     end
      --   end,
      -- })

      require("catppuccin").setup(opts)
    end,
  },
}

