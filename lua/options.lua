local opt = vim.opt
local o = vim.o
local g = vim.g

-- Shows line numbers on the left
opt.number = true
-- Makes the line numbers relative
opt.relativenumber = true

-- make tabs look like they're 4 spaces wide (default: 8)
opt.tabstop = 4
-- make the tab button insert 4 spaces in editing operations (default: 0, an actual tab character)
opt.softtabstop = 4
-- The number of spaces to use when indenting. 0 makes it use tabstop. (default: 8)
opt.shiftwidth = 0
-- Makes tab use spaces instead when in insert mode
opt.expandtab = true

-- Automatically indent when making a new line if it makes sense to, such as after a {
opt.smartindent = true

-- Makes / searching update live instead of having to type the whole search query first
opt.incsearch = true

-- 24-bit RGB
opt.termguicolors = true

-- Makes it so there will always be at least 8 lines visible aboce and below your cursor (unless you're at the start/end of a file) (default: 0)
opt.scrolloff = 8

-- Disables the mouse
opt.mouse = ""

opt.updatetime = 1000
opt.timeoutlen = 1000
opt.timeout = true

opt.hlsearch = false

-- Spell checking
opt.spell = true
opt.spelllang = "en_us"

-- Makes the terminal use nushell
opt.shell = "nu"

-- Disables the default mode indicator since lualine has it
opt.showmode = false
