return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = {
        ensure_installed = { "c", "html", "json", "lua", "rust", "toml", "vim", "vimdoc" }
    },
    event = { "BufReadPost", "BufNewFile" },
    cond = vim.g.cfg_complexity == "full"
}
