return {
    "nvim-lualine/lualine.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local catppuccin = require('catppuccin.utils.lualine')

        require('lualine').setup {
            options = {
                theme = catppuccin,
                component_separators = '',
                section_separators = { left = '', right = '' },
                icons_enabled = true,
                globalstatus = true,
                disabled_filetypes = {
                    statusline = { "alpha", "lazy" },
                }
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = {
                    {
                        'filetype',
                        icon_only = true,
                        colored = true,
                        padding = { left = 1, right = 0 }
                    },
                    {
                        'filename',
                        path = 1,
                        shorting_target = 40,
                    },
                },
                lualine_x = { 'lsp_status' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
        }
    end
}
