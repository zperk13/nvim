return {
    'karb94/neoscroll.nvim',
    event = { "BufReadPost", "BufNewFile" },
    config = true,
    cond = vim.g.cfg_complexity == "full"
}
