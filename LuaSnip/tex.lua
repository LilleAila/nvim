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

local helpers = require('core.luasnip-helper-funcs')
local get_visual = helpers.get_visual
local nl_whitespace = helpers.nl_whitespace
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local tex_utils = {} -- Has to be loaded after lervag/vimtex
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function()  -- comment detection
  return vim.fn["vimtex#syntax#in_comment"]() == 1
end
tex_utils.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn["vimtex#env#is_inside"](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end
-------------------------
tex_utils.in_equation = function()  -- equation environment detection
    return tex_utils.in_env("equation")
end
tex_utils.in_itemize = function()  -- itemize environment detection
    return tex_utils.in_env("itemize")
end
tex_utils.in_tikz = function()  -- TikZ picture environment detection
    return tex_utils.in_env("tikzpicture")
end
tex_utils.in_list = function()
	return tex_utils.in_end("enumerate")
end
-------------------------
tex_utils.in_text_wsnl = function(a, b, c) -- wsnl stands for whitespace / newline
	return tex_utils.in_text() and nl_whitespace(a, b, c)
end
tex_utils.in_text_lnstart = function(a, b, c)
	return tex_utils.in_text() and line_begin(a, b, c)
end
tex_utils.in_list_lnstart = function(a, b, c)
	return tex_utils.in_list() and line_begin(a, b, c)
end
-- local nl_whitespace = function(line_to_cursor, matched_trigger, captures)
-- 	local whitespaceEnding = not not string.match(line_to_cursor, "%s" .. matched_trigger .. "$")
-- 	local lineStart = line_begin(line_to_cursor, matched_trigger, captures)
-- 	return whitespaceEnding or lineStart
-- end

-- TODO: bold text, underset text, section, italic text, environment, image, centered, newline, a) b) list, list item, vertical space, control sequence with args, control sequence with two args, control sequence with no args <- and ones with optional args ([])

--------------
-- Snippets --
--------------
return {
	------------------
	-- New document --
	------------------
	s({ trig = "doc", descr = "LaTeX document boilerplate" },
		fmta(
			[[
				\documentclass[11pt, oneside]{article}
				\usepackage{mathtools, amssymb, amsthm, graphicx, enumitem, titlesec, lipsum}
				\usepackage[a4paper, margin=1in]{geometry}
				\mathtoolsset{showonlyrefs}
				\graphicspath{ {./images/} }
				\usepackage[parfill]{parskip}

				\title{\vspace{-2cm}<>}
				\date{<>.<>.<>}
				\author{<>}

				\titleformat*{\section}{\fontsize{12}{15}\selectfont}
				\titleformat*{\subsection}{\fontsize{10}{12}\selectfont}
				\pagestyle{empty}
				\pagenumbering{gobble}
				\begin{document}
				\maketitle

				<>

				\end{document}
			]],
			{ i(1, "Title"), i(2, "Year"), i(3, "Month"), i(4, "Day"), i(5, "Author"), i(6) }
		), { condition = line_begin }),
	-------------------
	-- Math Snippets --
	-------------------
	s({ trig = "mm", descr = "Inline Math", snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[<>$ <> $]],
			{ f( function(_, snip) return snip.captures[1] end ), i(1) }
		), { condition = tex_utils.in_text_wsnl }),
	s({ trig = "ml", descr = "Multiline Math", snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[
				\begin{gather*}
					<>
				\end{gather*}
			]],
			{ i(1) }
		), { condition = tex_utils.in_text_lnstart }),
	s({ trig = "me", descr = "Unnumbered equation" },
		fmta(
			[[
				\begin{equation*}
					<>
				\end{equation*}
			]],
			{ i(1) }
		), { condition = tex_utils.in_text_lnstart }),
	---------------------
	s({ trig = "pp", descr = "Parenthesis", snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[\left(<>\right)]],
			{ i(1) }
		), { condition = tex_utils.in_mathzone }),
	s({ trig = "ff", descr = "Fraction", snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[\frac{<>}{<>}]],
			{ i(1), i(2) }
		), { condition = tex_utils.in_mathzone }),
	s({ trig = "([%s])*", descr = "Multiplication sign", snippetType = "autosnippet", regTrig = true, wordTrig = false },
		fmta(
			[[<>\cdot ]],
			{ f( function(_, snip) return snip.captures[1] end ) }
		),
		-- { t([[\cdot]]) },
		{ condition = tex_utils.in_mathzone }),
	s({ trig = "([%s])aa", descr = "Answer (Double underline)", snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[
				<>\underline{\underline{<>}}
			]],
			{ f( function(_, snip) return snip.captures[1] end ), d(1, get_visual) }
		), { condition = tex_utils.in_mathzone }),
	s({ trig = "und", descr = "Underset text (below other text)", wordTrig = false },
		fmta(
			[[\underset{<>}{<>}]],
			{ i(1, "Under"), d(2, get_visual) }
		), { condition = tex_utils.in_mathzone }),
	----------
	-- Text --
	----------
	s({ trig = "([%s])nl", deescr = "Newline", snippetType = "autosnippet", regTrig = true, wordTrig = false },
		fmta(
			[[<>\\]],
			{ f( function(_, snip) return snip.captures[1] end ) }
		)),
	s({ trig = "pr", descr = "New paragraph", snippetType = "autosnippet", wordTrig = false },
		{ t([[\par]]) },
		{ condition = line_begin }),
	s({ trig = "bold", descr = "Bold text", wordTrig = false },
		fmta(
			[[\texbf{<>}]], -- Get visual does not work here
			{ d(1, get_visual) }
		), { condition = tex_utils.in_text }),
	s({ trig = "ital", descr = "Italic text", wordTrig = false },
		fmta(
			[[\textit{<>}]],
			{ d(1, get_visual) }
		), { condition = tex_utils.in_text }),
	-- These sections use *, and will NOT be shown in the \tableofcontents
	s({ trig = "sec", descr = "Section", wordTrig = false },
		fmta(
			[[\section*{<>}]],
			{ i("Section") }
		), { condition = line_begin }),
	s({ trig = "subs", descr = "Subsection", wordTrig = false },
		fmta(
			[[\subsection*{<>}]],
			{ i("Subsection") }
		), { condition = line_begin }),
	------------
	-- Images --
	------------
	s({ trig = "([%s%{])img", descr = "Image", regTrig = true, wordTrig = false },
		fmta( -- Can replace \textwidth with \linewidth -- All images are stored in ./images
			[[<>\includegraphics[width=<>\textwidth]{<>}]],
			{ f( function(_, snip) return snip.captures[1] end ), i(1, "1.0"), i(2) }
		), { condition = tex_utils.in_text }),
	s({ trig = "([^%a])cc", descr = "Inline centered", regTrig = true, wordTrig = false },
		fmta(
			[[<>\centerline{<>}]],
			{ f( function(_, snip) return snip.captures[1] end ), d(1, get_visual) }
		), { condition = tex_utils.in_text_lnstart }),
	----------
	-- List --
	----------
	s({ trig = "ls", descr = "List a) b) c)" },
		fmta(
			[[
				\renewcommand{\labelenumi}{\alph{enumi})}
				\begin{enumerate}
					<>
				\end{enumerate}
			]],
			{ i(1) }
		), { condition = line_begin }),
	s({ trig = "lr", descr = "Resume list" },
		fmta(
			[[
				\begin{enumerate}[resume]
					<>
				\end{enumerate}
			]],
			{ i(1) }
		), { condition = line_begin }),
	s({ trig = "li", descr = "List item", regTrig = true, wordTrig = false },
		fmta(
			[[<>\item <>]],
			{ f( function(_, snip) return snip.captures[1] end ), i(1) }
		), { condition = tex_utils.in_list_lnstart }),
	-----------
	-- Other --
	-----------
	s({ trig = "new", descr = "Generic environment", wordTrig = false },
		fmta(
			[[
				\begin{<>}
					<>
				\end{<>}
			]],
			{ i(1), i(2), rep(1) }
		), { condition = tex_utils.in_text_lnstart }),
}
