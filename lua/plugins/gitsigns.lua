return {
    'lewis6991/gitsigns.nvim',
    opts = {
        numhl = true
    },
    event = { "BufReadPost", "BufNewFile" },
    cond = vim.g.cfg_complexity == "full"
}
