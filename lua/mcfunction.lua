-- This is automatically done with your mcfunction plugin. Uncomment it if you remove it
--[[ vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
          pattern = {"*.mcfunction"},
          command = "set filetype=mcfunction"
}) ]]

-- This is using https://www.npmjs.com/package/@spyglassmc/language-server
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
          pattern = {"*.mcfunction"},
          callback = function(ev)
              print("Hello there!")
              vim.lsp.start({
                  name = "datapack-language-server",
                  cmd = {"datapack-language-server", "--stdio"},
              })
          end
})


