vim.ui.select({ "min", "lite", "full"}, {prompt="Choose a config"}, function(choice) vim.g.cfg_complexity=choice end);
if vim.g.cfg_complexity == nil then
    vim.g.cfg_complexity = "min"
end

require("neovide")
require("filetype")

if vim.g.cfg_complexity ~= "min" then
    vim.g.mapleader = ' '
    vim.g.maplocalleader = ' '

    require("lazynvim")
    require("options")
    require("remap")
    require("highlight_yank")
else
    -- seems to preserve the terminal's colorscheme
    vim.cmd("colorscheme vim")
end

