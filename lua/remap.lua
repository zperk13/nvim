-- cmp remaps are in plugins/nvim-cmp.lua

local keymap = vim.keymap

keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

keymap.set("n", "<leader>tt", function() vim.cmd("NvimTreeToggle") end, { desc = "[t]oggle" })
keymap.set("n", "<leader>tf", function() vim.cmd("NvimTreeFocus") end, { desc = "[f]ocus" })
keymap.set("i", "<C-v>", '<Esc>"+pa')

keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "Find [f]iles" })
keymap.set("n", "<leader>sa", require("telescope.builtin").live_grep, { desc = "Live grep in [a]ll files" })
keymap.set("n", "<leader>sb", require("telescope.builtin").buffers, { desc = "Open [b]uffers" })
keymap.set("n", "<leader>sr", require("telescope.builtin").oldfiles, { desc = "[r]ecent files" })
keymap.set("n", "<leader>sq", require("telescope.builtin").quickfix, { desc = "[q]uickfix" })
keymap.set("n", "<leader>sc", require("telescope.builtin").current_buffer_fuzzy_find, { desc = "[c]urrent buffer" })
keymap.set("n", "<leader>slr", require("telescope.builtin").lsp_references, { desc = "[r]eferences" })
keymap.set("n", "<leader>sli", require("telescope.builtin").lsp_incoming_calls, { desc = "[i]ncoming calls" })
keymap.set("n", "<leader>slo", require("telescope.builtin").lsp_outgoing_calls, { desc = "[o]utgoing calls" })
keymap.set("n", "<leader>slc", require("telescope.builtin").lsp_document_symbols, { desc = "do[c]ument symbols" })
keymap.set("n", "<leader>slw", require("telescope.builtin").lsp_workspace_symbols, { desc = "[w]orkspace symbols" })
keymap.set("n", "<leader>sly", require("telescope.builtin").lsp_dynamic_workspace_symbols,
    { desc = "D[y]namic workspace symbols" })
keymap.set("n", "<leader>slg", require("telescope.builtin").diagnostics, { desc = "Dia[g]nostics" })
keymap.set("n", "<leader>slm", require("telescope.builtin").lsp_implementations, { desc = "I[m]plementations" })
keymap.set("n", "<leader>sld", require("telescope.builtin").lsp_definitions, { desc = "[d]efinitions" })
keymap.set("n", "<leader>slt", require("telescope.builtin").lsp_type_definitions, { desc = "[t]ype definitions" })
keymap.set("n", "<leader>st", require("telescope.builtin").treesitter, { desc = "[t]reesitter" })


keymap.set("n", "<leader>vnr", function() vim.cmd("set relativenumber!") end, { desc = "Toggle line number [r]elativity" })
keymap.set("n", "<leader>vnt", function() vim.cmd("set number!") end, { desc = "[T]oggle line numbers" })

keymap.set("n", "<leader>vc", vim.lsp.buf.code_action, { desc = "[c]ode action" })
keymap.set("n", "<leader>vr", vim.lsp.buf.rename, { desc = "[r]ename" })
keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "[d]iagnostics" })
keymap.set("n", "<leader>vh", vim.lsp.buf.hover, { desc = "[h]over" })
keymap.set("n", "<leader>vf", vim.lsp.buf.format, { desc = "[f]ormat" })


require('which-key').register {
    ['<leader>s'] = { name = 'Tele[s]cope', _ = 'which_key_ignore' },
    ['<leader>sl'] = { name = '[l]sp', _ = 'which_key_ignore' },
    ['<leader>v'] = { name = '[v]anilla vim', _ = 'which_key_ignore' },
    ['<leader>vn'] = { name = '[n]umbers', _ = 'which_key_ignore' },
    ['<leader>t'] = { name = 'nvim-[t]ree', _ = 'which_key_ignore' },
}
