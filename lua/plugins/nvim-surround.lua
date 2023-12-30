return {
    'kylechui/nvim-surround',
    event = { "BufReadPost", "BufNewFile" },
    config = true,
    cond = vim.g.cfg_complexity == "full"
}
