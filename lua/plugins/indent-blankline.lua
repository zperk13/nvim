return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    event = { "BufReadPost", "BufNewFile" },
    cond = vim.g.cfg_complexity == "full"
}
