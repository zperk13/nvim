vim.ui.select({"full", "lite", "min"}, {prompt="Choose a config"}, function(choice) vim.g.cfg_complexity=choice end);

require("neovide")

if vim.g.cfg_complexity ~= "min" then
    vim.g.mapleader = ' '
    vim.g.maplocalleader = ' '

    require("lazynvim")
    require("options")
    require("remap")
    require("highlight_yank")
end

