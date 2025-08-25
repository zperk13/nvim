return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    keys = {
        { "<leader>lv", "<cmd>VenvSelect<cr>" },
    },
    opts = {
        search = {
            uv_scripts = {
                command = "fd python$ ~/.cache/uv/environments-v2"
            }
        }
    },
}
