return {
    "OXY2DEV/markview.nvim",
    cmd = { "Markview" },
    ft = { 'markdown' },
    config = function()
        require("markview").setup({
            preview = {
                enable = true,
                filetypes = { "markdown" },
                ignore_buftypes = { "nofile" },
            }
        })
    end
}
