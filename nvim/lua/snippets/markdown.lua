local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

    -- H1 Heading
    s("h1", {
        t("# "), i(1, "Heading")
    }),

    -- H2 Heading
    s("h2", {
        t("## "), i(1, "Subheading")
    }),

    -- H3 Heading
    s("h3", {
        t("### "), i(1, "Subheading")
    }),

    -- H4 Heading
    s("h4", {
        t("#### "), i(1, "Subheading")
    }),

    -- Code block
    s("cb", {
        t("```"), i(1, "language"), t({ "", "" }),
        i(2, "code here"),
        t({ "", "```" })
    }),

    -- Inline code
    s("ic", {
        t("`"), i(1, "code"), t("`")
    }),

    -- Inline math
    s("$", {
        t("$"), i(1, "math"), t("$")
    }),

    -- Display math
    s("$$", {
        t("$$"), i(1, "math"), t("$$")
    }),

    -- Image
    s("img", {
        t("!["),
        i(1, "alt text"),
        t("]("),
        i(2, "url"),
        t(")")
    }),

    -- Link
    s("link", {
        t("["),
        i(1, "text"),
        t("]("),
        i(2, "url"),
        t(")")
    }),
}
