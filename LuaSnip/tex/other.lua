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
local ms = ls.multi_snippet

local helpers = require('luasnip_helpers.global')
local get_visual = helpers.get_visual
local nl_whitespace = helpers.nl_whitespace
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local tex_utils = require("luasnip_helpers.tex")

return {
	s({ trig = "nc", descr = "New document command", snippetType = "autosnippet", wordTrig = false, regTrig = false },
		fmta(
			[[
				\NewDocumentCommand{\<>}{ <> }{
					<>
				}
			]],
			{ i(1, "name"), i(2, "m 0{0}  (m for mandatory var and 0{default_val} for optional)"), i(3, "Variables with #1 and #2 etc.") }
		), {condition = tex_utils.in_text_lnstart }),
	s({ trig = "bb", descr = "Code block", snippetType = "autosnippet", wordTrig = false, regTrig = false },
		fmta(
			[[
				\begin{mintedbox}
				\begin{minted}{<>}
				<>
				\end{minted}
				\end{mintedbox}
			]],
			{ i(1, "python"), i(2) }
		), { condition = tex_utils.in_text_lnstart }),
	s({ trig = "bi", descr = "Code block import", snippetType = "autosnippet", wordTrig = false, regTrig = false },
		fmta(
			[[
				\begin{mintedbox}
					\inputminted{<>}{<>}
				\end{mintedbox}
			]],
			{ i(1, "python"), i(2, "main.py") }
		), { condition = tex_utils.in_text_lnstart }),


	s({ trig = "env", descr = "Generic environment", snippetTYpe = "autosnippet", wordTrig = false },
		fmta(
			[[
				\begin{<>}
					<>
				\end{<>}
			]],
			{ i(1), i(2), rep(1) }
		), { condition = tex_utils.in_text_lnstart }),
	s({ trig = "cc", descr = "Command with one argument", snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[\<>{<>}]],
			{ i(1), i(2) }
		)),

	s({ trig = "(%d+)c", descr = "Command with n arguments", snippetType = "autosnippet", wordTrig = false, regTrig = true },
		{
			t([[\]]),
			i(1),
			f(
				function(_, snip)
					local args_count = tonumber(snip.captures[1])
					local args_string = ""
					local args_inputs = {}
					for index = 1, args_count do
						vim.print(index)
						args_string = args_string .. "{<>}"
						table.insert(args_inputs, i(index+1))
					end
					return fmta(args_string, args_inputs)
				end
			)
		}),

		s("example4", fmt([[
  repeat {a} with the same key {a}
  ]], {
    a = i(1, "this will be repeat")
  }, {
    repeat_duplicates = true
  }))
}
