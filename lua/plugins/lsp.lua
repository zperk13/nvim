-- Hi future me! If mason is having trouble installing stuff, make sure you have npm installed

local packages = {
    clangd = {},
    -- javascript/typescript
    eslint = {},
    -- haskell
    html = {},
    jsonls = {},
    lua_ls = {
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
    },

    -- markdown
    marksman = {},

    rust_analyzer = {
        masonignore = true, -- better to use rustup
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = true,
                check = {
                    command = "clippy"
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
    },

    -- 'spyglassmc-language-server', Even though I can install it in the :Mason gui, it doesn't like it being an option in here for some reason

    -- TOML
    taplo = {},

    -- 'typst_lsp',

    -- Typst
    tinymist = {
        single_file_support = true,
        root_dir = function()
            return vim.fn.getcwd()
        end
    },

    ts_ls = {},

    vimls = {},
}

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

                local ensured_installed = {}
                for k, v in pairs(packages) do
                    if not v.masonignore then
                        table.insert(ensured_installed, k)
                    end
                end

                mason_lspconfig.setup({
                    ensure_installed = ensured_installed,
                    automatic_installation = true
                })
            end
        },

        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

        -- Additional lua configuration, makes nvim stuff amazing!
        {
            'folke/lazydev.nvim',
            ft = 'lua',
            config = true
        },
        },
    opts = {},
    config = function()
        local lspconfig = require("lspconfig")


        local function on_attach(client, bufnr)
            if client:supports_method('textDocument/completion') then
                vim.lsp.completion.enable(true, client.id, bufnr, {autotrigger=true})
            end
            -- if client.server_capabilities.documentSymbolProvider then
                -- require("nvim-navic").attach(client, bufnr)
            -- end
        end

        for k, v in pairs(packages) do
            local setup = {
                capabilities = capabilities,
                on_attach = on_attach
            }
            for vk, vv in pairs(v) do
                if vk ~= "masonignore" then
                    setup[vk] = vv
                end
            end
            lspconfig[k].setup(setup)
        end
    end
}
