return {
    cond = vim.g.cfg_complexity == "full",
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
        {
            'folke/neodev.nvim',
            config = true
        },

        {
            'lvimuser/lsp-inlayhints.nvim',
            config = true
        }

    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local capabilities = cmp_nvim_lsp.default_capabilities()

        local function on_attach(client, bufnr)
            if client.server_capabilities.documentSymbolProvider then
                require("nvim-navic").attach(client, bufnr)
            end
            require('lsp-inlayhints').on_attach(client, bufnr)
        end

        lspconfig['clangd'].setup({
            capabilities = capabilities,
            on_attach = on_attach
        })

        lspconfig['html'].setup({
            capabilities = capabilities,
            on_attach = on_attach
        })

        lspconfig['jsonls'].setup({
            capabilities = capabilities,
            on_attach = on_attach
        })

        lspconfig['lua_ls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
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
            on_attach = on_attach
        })

        lspconfig['rust_analyzer'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                ["rust-analyzer"] = {
                    checkOnSave = {
                        command = "clippy",
                    },
                    cargo = {
                        allFeatures = true,
                    },
                    inlayHints = {
                        enabled = true,
                        typeHints = {
                            enable = true
                        }
                    }
                }
            }
        })

        lspconfig['taplo'].setup({
            capabilities = capabilities,
            on_attach = on_attach
        })

        lspconfig['vimls'].setup({
            capabilities = capabilities,
            on_attach = on_attach
        })
    end
}
