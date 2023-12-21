vim.g.cfg_complexity = os.getenv("VIM_CFG_COMPLEXITY")
if vim.g.cfg_complexity == nil then
    vim.g.cfg_complexity = "full"
elseif vim.g.cfg_complexity ~= "full" and vim.g.cfg_complexity ~= "lite" and vim.g.cfg_complexity ~= "min" then
    error(
        "Got VIM_CFG_COMPLEXITY environment variable that wasn't \"full\", \"lite\" or \"min\". It must be one of those, or don't set it to default to \"full\"")
end

require("neovide")

if vim.g.cfg_complexity ~= "min" then
    vim.g.mapleader = ' '
    vim.g.maplocalleader = ' '

    require("lazynvim")
    require("options")
    require("remap")
    require("highlight_yank")
end

if vim.g.cfg_complexity == "full" then
    require("mcfunction")
end
