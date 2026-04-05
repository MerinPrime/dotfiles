return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    event = "InsertEnter",
    config = function()
        require("luasnip.loaders.from_lua").load({
            paths = "~/.config/nvim/lua/luasnip/snippets"
        })
    end
}

