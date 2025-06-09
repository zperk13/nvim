-- Hi future me! If mason is having trouble installing stuff, make sure you have npm installed

local packages = {
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
    rust_analyzer = {
        masonignore = true, -- better to use rustup
        settings = {
            ['rust-analyzer'] = {
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
    taplo = {}, -- TOML
}

local mason_ensure_installed = {}
for package_name, package_config in pairs(packages) do
    if package_config.masonignore then
        -- mason-lspconfig does this automatically for stuff it installs, but if we're doing masonignore, we need to enable it ourself
        vim.lsp.enable(package_name)
    else
        table.insert(mason_ensure_installed, package_name)
    end
    local config_without_masonignore = {}
    for k, v in pairs(package_config) do
        if k ~= "masonignore" then
            config_without_masonignore[k]=v
        end
    end
    vim.lsp.config(package_name, config_without_masonignore)
end

return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensured_installed = mason_ensure_installed,
    },
    dependencies = {
        { 'williamboman/mason.nvim', config = true },
        { "j-hui/fidget.nvim",       config = true },
        {
            'folke/lazydev.nvim',
            ft = 'lua',
            config = true
        },
        "neovim/nvim-lspconfig",
    }
}
