return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup({
            update_focused_file = {
                enable = true,
                update_root = true,
            },
            renderer = {
                highlight_git = true,
                indent_markers = {
                    enable = true,
                },
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },
                    -- glyphs = {
                    --     folder = {
                    --         arrow_closed = "⏵",
                    --         arrow_open = "⏷",
                    --     },
                    -- },
                },
            },
            filters = {
                dotfiles = false,
                git_ignored = true,
            },
            view = {
                number = true,
                relativenumber = true
            },
            on_attach = function(bufnr)
                local api = require("nvim-tree.api")

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                api.config.mappings.default_on_attach(bufnr)

                vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
                vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
                vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
            end,
        })
    end,
}
