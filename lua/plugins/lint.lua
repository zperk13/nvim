return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            sh = { "shellcheck" } -- pacman -S shellcheck
        }

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                -- try_lint without arguments runs the linters defined in `linters_by_ft`
                -- for the current filetype
                lint.try_lint()
            end,
        })
    end
}
