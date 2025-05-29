return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    event = 'InsertEnter',

    -- use a release tag to download pre-built binaries
    version = '1.*',

    opts = {
        completion = { documentation = { auto_show = true } },
        keymap = { preset = 'enter' },
        signature = { enabled = true },
    }
}
