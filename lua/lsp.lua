-- Extra configs coming from nvim-lspconfig plugin
-- To get nvim to recognize stuff installed by pipx, cargo, ghcup, and pnpm, I had to replace `export PATH` in /etc/profile with `export PATH="$PATH:/home/<USERNAME>/.cargo/bin:/home/<USERNAME>/.local/bin:/home/<USERNAME>/.ghcup/bin:/home/<USERNAME>/.local/share/pnpm"` and you need to use the full username path, ~ won't work
local packages = {
    -- Python LSP
    -- pipx install basedpyright
    basedpyright = {
        settings = {
            basedpyright = {
                analysis = {
                    diagnosticSeverityOverrides = {
                        reportAny = false,                   -- Sometimes any can't be avoided in python, especially when using libraries
                        reportImplicitRelativeImport = false -- This thing just seems to be wrong when working with scripts
                    }
                },
            },
        },
    },

    -- Bash LSP
    -- pacman -S bash-language-server
    bashls = {},

    -- Installation instructions for hls on Arch Linux:
    -- 1. Install https://aur.archlinux.org/packages/ghcup-hs-bin
    -- 2. ghcup install hls
    -- 3. ghcup install ghc
    -- 4. cd ~/.ghcup/bin
    -- 5. ln -s 9.6.7 ghc
    --     5a. Replace 9.6.7 with whatever the version you have it
    -- 6. Ensure ~/.ghcup/bin is in $PATH. Refer to top of file for that.
    hls = {}, -- https://aur.archlinux.org/packages/ghcup-hs-bin ; ghcup install hls ; ghcup install ghc ;

    -- Lua LSP
    -- pacman -S lua-language-server
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

    -- Python linter + formatter
    -- pacman -S ruff
    ruff = {},

    -- Rust LSP
    -- pacman -S rustup ; rustup update
    rust_analyzer = {
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

    -- Minecraft Datapack LSP
    -- pnpm i -g @spyglassmc/language-server
    spyglassmc_language_server = {},

    -- cargo install taplo-cli --locked
    -- For TOML
    taplo = {},

    -- Typst LSP
    -- pacman -S tinymist
    tinymist = {
        settings = {
            formatterMode = "typstyle",
            lint = {
                enabled = true
            }
        }
    }
}

for package_name, package_config in pairs(packages) do
    if package_config then
        vim.lsp.config(package_name, package_config)
    end
    vim.lsp.enable(package_name)
end
