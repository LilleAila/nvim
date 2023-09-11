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

local get_visual = function(_, parent)
	if (#parent.snippet.env.LS_SELECT_RAW > 0) then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else
		return sn(nil, i(1))
	end
end

return {
	s({ trig = "docm", descr = "LaTeX math Boilerplate" },
		fmta(
			[[
				\documentclass[<>pt, oneside]{article}
				\usepackage{mathtools, amssymb, amsthm}
				\mathtoolsset{showonlyrefs}

				\pagestyle{empty}
				\begin{document}
				<>
				\end{document}
			]],
			{ i(1, "12"), i(2) }
		)
	),
	s({ trig = "eqm", descr = "LaTeX equation with multiple lines" },
		fmta(
			[[
				\begin{equation}
				\begin{matrix}
					<>
				\end{matrix}
				\end{equation}
			]],
			{ i(1) }
		)
	),
	s("fr",
		fmta(
			"\\frac{<>}{<>}",
			{ i(1), i(2) }
		)
	),
	s("env",
		fmta(
			[[
				\begin{<>}
					<>
				\end{<>}
			]],
			{ i(1), i(2), rep(1) }
		)
	),
	s("pa",
		fmta(
			"{(<>)}",
			{ i(1) }
		)
	),
	s("dot", t("\\cdot")),
	s("ul",
		fmta(
			"\\underline{<>}",
			{ i(1) }
		)
	),
	s("nl", t("\\\\")),
	s("ti",
		fmta(
			"\\textit{<>}",
			{ d(1, get_visual) }
		)
	),
	s("tb",
		fmta(
			"\\texbf{<>}",
			{ d(1, get_visual) }
		)
	),
	s("ans",
		fmta(
			"\\underline{\\underline{<>}}",
			{ d(1, get_visual) }
		)
	),
	s("und",
		fmta(
			"\\underset{<>}{<>}",
			{ i(1, "Under"), d(2, get_visual) }
		)
	),
}
