-- cmp remaps are in plugins/nvim-cmp.lua
-- using default bindings for https://github.com/numToStr/Comment.nvim/

local keymap = vim.keymap

keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

keymap.set("n", "<leader>tt", function() vim.cmd("NvimTreeToggle") end, { desc = "[t]oggle" })
keymap.set("n", "<leader>tf", function() vim.cmd("NvimTreeFocus") end, { desc = "[f]ocus" })
keymap.set("n", "<leader>ts", ":NvimTreeFocus<CR><C-w>o", { desc = "full[s]creen" })

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


keymap.set("n", "<leader>vnr", function() vim.cmd("set relativenumber!") end,
    { desc = "Toggle line number [r]elativity" })
keymap.set("n", "<leader>vnt", function() vim.cmd("set number!") end, { desc = "[T]oggle line numbers" })

keymap.set("n", "<leader>vc", vim.lsp.buf.code_action, { desc = "[c]ode action" })
keymap.set("n", "<leader>vr", vim.lsp.buf.rename, { desc = "[r]ename" })
keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "[d]iagnostics" })
keymap.set("n", "<leader>vh", vim.lsp.buf.hover, { desc = "[h]over" })
keymap.set("n", "<leader>vf", vim.lsp.buf.format, { desc = "[f]ormat" })

keymap.set("n", "[d", vim.diagnostic.open_float, { desc = "Previous diagnostic" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

keymap.set("n", "<leader>o", ":Oil<CR>", { desc = "[o]il" })

keymap.set("n", "<leader>rd", ":Trouble document_diagnostics<CR>", { desc = "[d]ocument diagnostics]" })
keymap.set("n", "<leader>rw", ":Trouble workspace_diagnostics<CR>", { desc = "[w]orkspace diagnostics]" })
keymap.set("n", "<leader>rr", ":Trouble lsp_references<CR>", { desc = "[r]eferences" })
keymap.set("n", "<leader>rf", ":Trouble lsp_definitions<CR>", { desc = "de[f]initions" })
keymap.set("n", "<leader>rt", ":Trouble lsp_type_definitions<CR>", { desc = "[t]ype definitions" })
keymap.set("n", "<leader>rq", ":Trouble quickfix<CR>", { desc = "[q]uickfix" })
keymap.set("n", "<leader>rl", ":Trouble loclist<CR>", { desc = "[l]oclist" })
keymap.set("n", "<leader>rc", ":TroubleClose<CR>", { desc = "[c]lose" })
keymap.set("n", "<leader>re", ":TroubleRefresh<CR>", { desc = "R[e]fresh" })

keymap.set("n", "<leader>n", ":Navbuddy<CR>", { desc = "[n]avbuddy" })

local function open_terminal()
    local opened_terminal = false

    -- iterate through buffers
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        -- if this isn't here, it will error sometimes. why am i given an invalid buffer? idk
        if vim.api.nvim_buf_is_valid(buf) then
            local buffer_name = vim.api.nvim_buf_get_name(buf);
            if string.sub(buffer_name, 1, 5) == "term:" then
                vim.cmd.buffer(buffer_name)
                opened_terminal = true
                break
            end
        end
    end
    if not opened_terminal then
        vim.cmd.terminal()
    end
end

keymap.set("t", "<esc>", "<C-\\><C-N>")


keymap.set("n", "<leader>mv", function()
    vim.cmd.vsplit()
    open_terminal()
end, { desc = "[v]ertical split" }
)
keymap.set("n", "<leader>mh", function()
    vim.cmd.split()
    open_terminal()
end, { desc = "[h]orizontal split" }
)
keymap.set("n", "<leader>mc", function()
    open_terminal()
end, { desc = "[c]urrent buffer" }
)
keymap.set("n", "<leader>mf", function()
    open_terminal()
    vim.cmd.only()
end, { desc = "[f]ullscreen" }
)

require('which-key').register {
    ['<leader>s'] = { name = 'Tele[s]cope', _ = 'which_key_ignore' },
    ['<leader>sl'] = { name = '[l]sp', _ = 'which_key_ignore' },
    ['<leader>v'] = { name = '[v]anilla vim', _ = 'which_key_ignore' },
    ['<leader>vn'] = { name = '[n]umbers', _ = 'which_key_ignore' },
    ['<leader>t'] = { name = 'nvim-[t]ree', _ = 'which_key_ignore' },
    ['<leader>r'] = { name = 't[r]ouble', _ = 'which_key_ignore' },
    ['<leader>m'] = { name = 'ter[m]inal', _ = 'which_key_ignore' },
}
