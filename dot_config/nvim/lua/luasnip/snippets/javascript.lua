local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("javascript", {
  s("fori", fmt([[
    for (let {} = 0; {} < {}; {}++) {{
        {}
    }}
  ]], {
    i(1, "i"),
    rep(1),
    i(2, "n"),
    rep(1),
    i(0),
  })),
});
