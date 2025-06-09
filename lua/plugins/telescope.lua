return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            'nvim-telescope/telescope-fzf-native.nvim'
            -- The build command doesn't want to work for me, so just go to ~/.local/share/nvim/lazy/telescope-fzf-native.nvim and run make.
        },
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local telescope = require('telescope')
        telescope.setup({})
        telescope.load_extension("fzf")
    end
}
