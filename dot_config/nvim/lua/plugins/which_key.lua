return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")
        wk.add({
            -- TODO: groups
            { "<leader>f", group = "file" },
        })
    end
}
