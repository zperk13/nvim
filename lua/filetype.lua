local add = vim.filetype.add
add({
    extension = {
        mcfunction = "mcfunction"
    },
    pattern = {
        -- fallback
        ['.*'] = {
            function (path, bufnr)
                local l01 = vim.api.nvim_buf_get_lines(bufnr, 0, 2, false)
                if vim.regex("^#!.{-}nix-shell"):match_str(l01[0]) and vim.regex("^#! ?nix-shell -i bash"):match_str(l01[1]) then
                    return "bash"
                end
            end,
            { priority = -math.huge }
        }
    }
})
