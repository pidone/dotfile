local present, catppuccin = pcall(require, "catppuccin")
if not present then return end

vim.opt.termguicolors = true

catppuccin.setup {
	flavour = "mocha",
	term_colors = true,
	transparent_background = false,
	no_italic = false,
	no_bold = false,
	styles = {
		comments = { "italic" },
		conditionals = {},
		loops = {},
		functions = { "italic" },
		keywords = {},
		variables = {},
		strings = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = { "bold" },
	},
}

vim.cmd.colorscheme "catppuccin"
