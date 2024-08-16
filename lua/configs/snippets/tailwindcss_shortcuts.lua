local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
  s("tm33", t("md:max-w-[33%] mx-auto"))
})
