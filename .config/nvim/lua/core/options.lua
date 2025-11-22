local opt = vim.opt -- for conciseness
-- line numbers
-- opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
-- line wrapping
opt.wrap = false -- disable line wrapping
-- search settings
opt.ignorecase = false -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
-- turn off swapfile
opt.swapfile = false

opt.mouse = 'a'
opt.wrap = false
opt.showtabline = 2

local set = vim.opt -- set options
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

vim.diagnostic.config({
	
	underline = false,
	signs = { 
		active = true,
		text = {
		  [vim.diagnostic.severity.ERROR] = "",
		  [vim.diagnostic.severity.WARN]  = "",
		  [vim.diagnostic.severity.HINT]  = "",
		  [vim.diagnostic.severity.INFO]  = "",
		},
	},
    virtual_text = false,
	float = {
		border = "single",
		format = function(diagnostic)
			return string.format(
				"%s (%s) [%s]",
				diagnostic.message,
				diagnostic.source,
				diagnostic.code or diagnostic.user_data.lsp.code
			)
		end,
	},
})
