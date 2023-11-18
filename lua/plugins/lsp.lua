return {
    'neovim/nvim-lspconfig',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        {
            'williamboman/mason.nvim',
            dependencies = { 'williamboman/mason-lspconfig.nvim' },
            config = function()
                local mason = require("mason")
                local mason_lspconfig = require("mason-lspconfig")

                mason.setup()

                mason_lspconfig.setup({
                    ensure_installed = {
                        'clangd',
                        'html',
                        'jsonls',
                        'lua_ls',
                        'marksman', -- markdown
                        'rust_analyzer',
                        'taplo',    -- TOML
                        'vimls',
                    },
                    automatic_installation = true
                })
            end
        },

        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

        -- Additional lua configuration, makes nvim stuff amazing!
        'folke/neodev.nvim',
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local capabilities = cmp_nvim_lsp.default_capabilities()

        lspconfig['clangd'].setup({
            capabilities = capabilities,
        })

        lspconfig['html'].setup({
            capabilities = capabilities,
        })

        lspconfig['jsonls'].setup({
            capabilities = capabilities,
        })

        lspconfig['lua_ls'].setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true
                        }
                    }
                }
            }
        })

        lspconfig['marksman'].setup({
            capabilities = capabilities,
        })

        lspconfig['rust_analyzer'].setup({
            capabilities = capabilities,
            settings = {
                ["rust-analyzer"] = {
                    checkOnSave = {
                        command = "clippy",
                    }
                }
            }
        })

        lspconfig['taplo'].setup({
            capabilities = capabilities,
        })

        lspconfig['vimls'].setup({
            capabilities = capabilities,
        })
    end
}
