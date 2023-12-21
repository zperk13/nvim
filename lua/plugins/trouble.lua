return {
    'folke/trouble.nvim',
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = { "BufReadPost", "BufNewFile" },
    cond = vim.g.cfg_complexity == "full"
}
