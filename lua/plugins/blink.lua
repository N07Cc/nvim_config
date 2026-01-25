return {
    "saghen/blink.cmp",
    dependencies = {
        "folke/lazydev.nvim",
        "rafamadriz/friendly-snippets",
        "xzbdmw/colorful-menu.nvim",
    },
    event = {"InsertEnter", "CmdlineEnter"},
    version = "*",
    -- build = "cargo build --release",
    opts = {
        enabled = function()
            return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
        end,
        keymap = {
            preset = "super-tab",
            ["<C-u>"] = { "scroll_documentation_up", "fallback" },
            ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        },

        completion = {
            list = {
                selection = {
                    preselect = function(ctx)
                        return not require("blink.cmp").snippet_active({ direction = 1 })
                    end,
                },
            },
            accept = {
                auto_brackets = {
                    enabled = true,
                },
            },
            menu = {
                border = "rounded",
                draw = {
                    columns = { { "kind_icon" }, { "label", gap = 1 } },
                    components = {
                        label = {
                            text = function(ctx)
                                return require("colorful-menu").blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(ctx)
                            end,
                        },
                    },
                },
            },
            keyword = { range = "full" },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
            },
        },
        signature = {
            enabled = true,
        },
        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        },
        appearance = {
            nerd_font_variant = "mono",
        },
        cmdline = {
            enabled = true,
            keymap = {
                -- recommended, as the default keymap will only show and select the next item
                ["<Tab>"] = { "show", "accept" },
            },
            completion = {
                menu = {
                    auto_show = function(ctx)
                        return vim.fn.getcmdtype() == ":"
                        -- enable for inputs as well, with:
                        -- or vim.fn.getcmdtype() == '@'
                    end,
                },
            },
        },

        -- Blink.cmp uses a Rust fuzzy matcher by default for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    -- config = function(_, opts)
        --   -- setup compat sources
        --   local enabled = opts.sources.default
        --   for _, source in ipairs(opts.sources.compat or {}) do
        --     opts.sources.providers[source] = vim.tbl_deep_extend(
            --       "force",
            --       { name = source, module = "blink.compat.source" },
            --       opts.sources.providers[source] or {}
            --     )
            --     if type(enabled) == "table" and not vim.tbl_contains(enabled, source) then
            --       table.insert(enabled, source)
            --     end
            --   end
            --
            --   -- Unset custom prop to pass blink.cmp validation
            --   opts.sources.compat = nil
            --
            --   require("blink.cmp").setup(opts)
            -- end,
        }
