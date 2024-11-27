return {
    'folke/flash.nvim',
    event = { "BufReadPost", "BufNewFile" },
    cond = vim.g.cfg_complexity == "full"
}
