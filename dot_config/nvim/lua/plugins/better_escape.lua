return {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
        require("better_escape").setup {
            timeout = 150,
            mappings = {
                i = {
                    j = {
                        k = "<Esc>",
                    }
                }
            }
        }
    end
}
