return {
    'saghen/blink.cmp',
    dependencies = {
        'saghen/blink.lib',
    },
    build = function()
        require('blink.cmp').build():pwait()
    end,
    opts = {
        keymap = {
            preset = 'none',

            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation', 'fallback' },
            ['<Tab>'] = { 'select_and_accept', 'fallback' },
            ['<C-e>'] = { 'cancel', 'fallback' },

            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },

            ['<C-Left>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-Right>'] = { 'scroll_documentation_down', 'fallback' },

            ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },
        },
        appearance = {
            nerd_font_variant = 'mono'
        },
        completion = {
            menu = {
                border = "single",
                scrolloff = 2,
                scrollbar = false,
            },
            documentation = {
                window = {
                    border = "single",
                },
                auto_show = true,
            },
            ghost_text = {
                enabled = false,
            }
        },
        signature = {
            enabled = true,
            window = {
                border = "single",
                show_documentation = false,
            },
        },
        snippets = {
            preset = 'luasnip',
        },
        sources = {
            default = { 'lsp', 'snippets', 'buffer' },
        },
        cmdline = {
            completion = { menu = { auto_show = true } },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    event = { 'VeryLazy' }
}
