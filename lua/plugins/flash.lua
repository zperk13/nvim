return {
    'folke/flash.nvim',
    event = { "BufReadPost", "BufNewFile" },
    config = {
        modes = {search = {enabled=true}}
    },
    cond = vim.g.cfg_complexity == "full"
}
