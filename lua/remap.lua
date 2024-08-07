-- cmp remaps are in plugins/nvim-cmp.lua
-- using default bindings for https://github.com/numToStr/Comment.nvim/
-- use default bindings for https://github.com/kylechui/nvim-surround/

local keymap = vim.keymap

keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("i", "<C-v>", '<Esc>"+pa')

keymap.set("t", "<esc>", "<C-\\><C-N>")

keymap.set({ 'n', 'i', 'v', 't' }, "<f11>", function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end)

if vim.g.cfg_complexity ~= "min" then
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
    keymap.set("n", "<leader>vi", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, { desc = "Toggle [i]nlay hints" })

    -- "Smart dd" from Reddit. Only yanks the line if not empty
    keymap.set("n", "dd", function() if vim.fn.getline(".") == "" then return '"_dd' end return "dd" end, {expr=true})

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

    keymap.set("n", "<leader>tv", function()
        vim.cmd.vsplit()
        open_terminal()
    end, { desc = "[v]ertical split" }
    )
    keymap.set("n", "<leader>th", function()
        vim.cmd.split()
        open_terminal()
    end, { desc = "[h]orizontal split" }
    )
    keymap.set("n", "<leader>tc", function()
        open_terminal()
    end, { desc = "[c]urrent buffer" }
    )
    keymap.set("n", "<leader>tf", function()
        open_terminal()
        vim.cmd.only()
    end, { desc = "[f]ullscreen" }
    )

    keymap.set('n', '<leader>u', "<CMD>UndotreeToggle<CR>", { desc = "[u]ndotree" })
end

if vim.g.cfg_complexity == "full" then
    keymap.set("n", "<leader>nt", function() vim.cmd("NvimTreeToggle") end, { desc = "[t]oggle" })
    keymap.set("n", "<leader>nf", function() vim.cmd("NvimTreeFocus") end, { desc = "[f]ocus" })
    keymap.set("n", "<leader>ns", ":NvimTreeFocus<CR><C-w>o", { desc = "full[s]creen" })

    keymap.set("n", "<leader>vc", vim.lsp.buf.code_action, { desc = "[c]ode action" })
    keymap.set("n", "<leader>vr", vim.lsp.buf.rename, { desc = "[r]ename" })
    keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "[d]iagnostics" })
    keymap.set("n", "<leader>vh", vim.lsp.buf.hover, { desc = "[h]over" })
    keymap.set("n", "<leader>vf", vim.lsp.buf.format, { desc = "[f]ormat" })

    keymap.set("n", "[d", vim.diagnostic.open_float, { desc = "Previous diagnostic" })
    keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

    keymap.set("n", "<leader>o", ":Oil<CR>", { desc = "[o]il" })

    keymap.set("n", "<leader>ed", ":Trouble document_diagnostics<CR>", { desc = "[d]ocument diagnostics]" })
    keymap.set("n", "<leader>ew", ":Trouble workspace_diagnostics<CR>", { desc = "[w]orkspace diagnostics]" })
    keymap.set("n", "<leader>er", ":Trouble lsp_references<CR>", { desc = "[r]eferences" })
    keymap.set("n", "<leader>ef", ":Trouble lsp_definitions<CR>", { desc = "de[f]initions" })
    keymap.set("n", "<leader>et", ":Trouble lsp_type_definitions<CR>", { desc = "[t]ype definitions" })
    keymap.set("n", "<leader>eq", ":Trouble quickfix<CR>", { desc = "[q]uickfix" })
    keymap.set("n", "<leader>el", ":Trouble loclist<CR>", { desc = "[l]oclist" })
    keymap.set("n", "<leader>ec", ":TroubleClose<CR>", { desc = "[c]lose" })
    keymap.set("n", "<leader>ee", ":TroubleRefresh<CR>", { desc = "R[e]fresh" })

    keymap.set('n', '<leader>gl', "<CMD>Gitsigns toggle_linehl<CR>", { desc = "Toggle [l]ine highlight" })
    keymap.set('n', '<leader>gw', "<CMD>Gitsigns toggle_word_diff<CR>", { desc = "Toggle [w]ord diff" })
end


if vim.g.cfg_complexity == "full" then
    require('which-key').register {
        ['<leader>s'] = { name = 'Tele[s]cope', _ = 'which_key_ignore' },
        ['<leader>sl'] = { name = '[l]sp', _ = 'which_key_ignore' },
        ['<leader>v'] = { name = '[v]anilla vim', _ = 'which_key_ignore' },
        ['<leader>vn'] = { name = '[n]umbers', _ = 'which_key_ignore' },
        ['<leader>n'] = { name = '[n]vim-tree', _ = 'which_key_ignore' },
        ['<leader>e'] = { name = 'troubl[e]', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[t]erminal', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[g]itsigns', _ = 'which_key_ignore' },
    }
elseif vim.g.cfg_complexity == "lite" then
    require('which-key').register {
        ['<leader>s'] = { name = 'Tele[s]cope', _ = 'which_key_ignore' },
        ['<leader>v'] = { name = '[v]anilla vim', _ = 'which_key_ignore' },
        ['<leader>vn'] = { name = '[n]umbers', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[t]erminal', _ = 'which_key_ignore' },
    }
end

