-- Hi future me! If mason is having trouble installing stuff, make sure you have npm installed
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
                        -- 'spyglassmc-language-server', Even though I can install it in the :Mason gui, it doesn't like it being an option in here for some reason
                        'taplo',    -- TOML
                        -- 'typst_lsp',
                        'tinymist', -- Typst
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
    },
    opts = {},
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local capabilities = cmp_nvim_lsp.default_capabilities()

        local function on_attach(client, bufnr)
            if client.server_capabilities.documentSymbolProvider then
                -- require("nvim-navic").attach(client, bufnr)
            end
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

        lspconfig['spyglassmc_language_server'].setup({
            capabilities = capabilities,
            on_attach = on_attach
        })

        lspconfig['taplo'].setup({
            capabilities = capabilities,
            on_attach = on_attach
        })

        lspconfig['tinymist'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            single_file_support = true,
            root_dir = function()
                return vim.fn.getcwd()
            end
        })

        lspconfig['vimls'].setup({
            capabilities = capabilities,
            on_attach = on_attach
        })
    end
}
