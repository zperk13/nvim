-- :TSInstall <language> to improve syntax highlighting for language
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require "nvim-treesitter.configs".setup
        {
            highlight = { enable = true }
        }
    end
}
