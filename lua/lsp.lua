-- Extra configs coming from nvim-lspconfig plugin
-- To get neovim to recognize stuff installed by pipx and cargo, I had to replace `export PATH` in /etc/profile with `export PATH="$PATH:/home/<USERNAME>/.cargo/bin:/home/<USERNAME>/.local/bin"` and you need to use the full username path, ~ won't work
local packages = {
    bashls = {}, -- pacman -S bash-language-server
    lua_ls = { -- pacman -S lua-language-server
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
    pylsp = { -- pipx install python-lsp-server
        settings = {
            plugins = {
                pylsp_mypy = {enabled = true} -- pipx inject python-lsp-server pylsp-mypy
            }
        }
    },
    ruff = {}, -- pacman -S ruff
    rust_analyzer = { -- pacman -S rustup
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

    -- cargo install taplo-cli --locked
    -- For TOML
    taplo = {},
}

for package_name, package_config in pairs(packages) do
    if package_config then
        vim.lsp.config(package_name, package_config)
    end
    vim.lsp.enable(package_name)
end
