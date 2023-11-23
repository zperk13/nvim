return {
    'stevearc/oil.nvim',
    opts = {
        default_file_explorer = false,
        columns = {
            "icon",
            "size",
        },
        -- delete_to_trash = true, not supported on windows yet :(
    },
    dependencies = { "nvim-tree/nvim-web-devicons" }
}
