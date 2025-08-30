return {
    "saghen/blink.cmp",

    dependencies = {
        "rafamadriz/friendly-snippets", -- optional: provides snippets for the snippet source
        {
            "folke/lazydev.nvim",
            ft = "lua",
            config = true
        }
    },

    build='cargo build --release',

    opts = {
        completion = {
            documentation = { auto_show = true },
            menu = {
                draw = {
                    -- Default is { { 'kind_icon' }, { 'label', 'label_description', gap = 1 } }
                    columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name", gap = 1 } }
                }
            }
        },
        keymap = { preset = "super-tab" },
        signature = { enabled = true },
        sources = {
            -- default for default is { 'lsp', 'path', 'snippets', 'buffer' }
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            -- Everything in the below table is copied and pasted from lazydev.nvim's README.md
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                }
            }
        }
    },
}
