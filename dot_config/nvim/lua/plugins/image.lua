return {
    "3rd/image.nvim",
    build = false,
    event = { "BufReadPost" },
    config = function()
        require("image").setup({
            backend = 'kitty',
            integrations = {
                markdown = {
                    enabled = false
                }
            }
        })
    end
}
