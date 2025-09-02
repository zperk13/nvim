-- Extra configs coming from nvim-lspconfig plugin
-- To get nvim to recognize stuff installed by pipx and cargo, I had to replace `export PATH` in /etc/profile with `export PATH="$PATH:/home/<USERNAME>/.cargo/bin:/home/<USERNAME>/.local/bin:/home/<USERNAME>/.ghcup/bin"` and you need to use the full username path, ~ won't work
local packages = {
    basedpyright = {},-- pipx install basedpyright
    bashls = {}, -- pacman -S bash-language-server

    -- Installation instructions for hls on Arch Linux:
    -- 1. Install https://aur.archlinux.org/packages/ghcup-hs-bin
    -- 2. ghcup install hls
    -- 3. ghcup install ghc
    -- 4. cd ~/.ghcup/bin
    -- 5. ln -s 9.6.7 ghc
    --     5a. Replace 9.6.7 with whatever the version you have it
    -- 6. Ensure ~/.ghcup/bin is in $PATH. Refer to top of file for that.
    hls = {}, -- https://aur.archlinux.org/packages/ghcup-hs-bin ; ghcup install hls ; ghcup install ghc ; 
    lua_ls = {   -- pacman -S lua-language-server
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
    ruff = {},        -- pacman -S ruff
    rust_analyzer = { -- pacman -S rustup
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
