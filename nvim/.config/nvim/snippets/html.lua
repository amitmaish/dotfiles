local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
	s({
		trig = "<html>",
		snippetType = "autosnippet",
	}, fmt("<html>{}</html>", { i(1) })),
	s({
		trig = "<a>",
		snippetType = "autosnippet",
	}, fmt("<a>{}</a>", { i(1) })),
	s({
		trig = "<b>",
		snippetType = "autosnippet",
	}, fmt("<b>{}</b>", { i(1) })),
	s({
		trig = "<i>",
		snippetType = "autosnippet",
	}, fmt("<i>{}</i>", { i(1) })),
	s({
		trig = "<em>",
		snippetType = "autosnippet",
	}, fmt("<em>{}</em>", { i(1) })),
	s({
		trig = "<q>",
		snippetType = "autosnippet",
	}, fmt("<q>{}</q>", { i(1) })),
	s({
		trig = "<s>",
		snippetType = "autosnippet",
	}, fmt("<s>{}</s>", { i(1) })),
	s({
		trig = "<u>",
		snippetType = "autosnippet",
	}, fmt("<u>{}</u>", { i(1) })),
	s({
		trig = "<p>",
		snippetType = "autosnippet",
	}, fmt("<p>{}</p>", { i(1) })),
	s({
		trig = "<div>",
		snippetType = "autosnippet",
	}, fmt("<div>{}</div>", { i(1) })),
	s({
		trig = "<span>",
		snippetType = "autosnippet",
	}, fmt("<pan>{}</span>", { i(1) })),
	s({
		trig = "<script>",
		snippetType = "autosnippet",
	}, fmt("<script>{}</script>", { i(1) })),
	s({
		trig = "<button>",
		snippetType = "autosnippet",
	}, fmt("<button>{}</button>", { i(1) })),
	s({
		trig = "<link>",
		snippetType = "autosnippet",
	}, fmt("<link>{}</link>", { i(1) })),
	s({
		trig = "<h1>",
		snippetType = "autosnippet",
	}, fmt("<h1>{}</h1>", { i(1) })),
	s({
		trig = "<h2>",
		snippetType = "autosnippet",
	}, fmt("<h2>{}</h2>", { i(1) })),
	s({
		trig = "<32>",
		snippetType = "autosnippet",
	}, fmt("<h3>{}</h3>", { i(1) })),
	s({
		trig = "<h4>",
		snippetType = "autosnippet",
	}, fmt("<h4>{}</h4>", { i(1) })),
	s({
		trig = "<h5>",
		snippetType = "autosnippet",
	}, fmt("<h5>{}</h5>", { i(1) })),
	s({
		trig = "<h6>",
		snippetType = "autosnippet",
	}, fmt("<h6>{}</h6>", { i(1) })),
	s({
		trig = "<ul>",
		snippetType = "autosnippet",
	}, fmt("<ul>{}</ul>", { i(1) })),
	s({
		trig = "<ol>",
		snippetType = "autosnippet",
	}, fmt("<ol>{}</ol>", { i(1) })),
	s({
		trig = "<li>",
		snippetType = "autosnippet",
	}, fmt("<li>{}</li>", { i(1) })),
}
