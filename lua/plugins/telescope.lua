return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            'nvim-telescope/telescope-fzf-native.nvim',
             build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
         },
         "nvim-tree/nvim-web-devicons"
     },
     config = function()
        local telescope = require('telescope')
        telescope.setup()
        telescope.load_extension("fzf")
     end
 }
