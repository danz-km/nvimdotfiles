return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		local transparent = true -- enable transparency if needed

		local bg = "#011628"
		local bg_dark = "#011423"
		local bg_highlight = "#143652"
		local bg_search = "#0A64AC"
		local bg_visual = "#275378"
		local fg = "#CBE0F0"
		local fg_dark = "#B4D0E9"
		local fg_gutter = "#627E97"
		local border = "#547998"

		-- Set up tokyonight colors
		require("tokyonight").setup({
			style = "night",
			transparent = transparent,
			styles = {
				sidebars = transparent and "transparent" or "dark",
				floats = transparent and "transparent" or "dark",
			},
			on_colors = function(colors)
				colors.bg = bg
				colors.bg_dark = transparent and colors.none or bg_dark
				colors.bg_float = transparent and colors.none or bg_dark
				colors.bg_highlight = bg_highlight
				colors.bg_popup = bg_dark
				colors.bg_search = bg_search
				colors.bg_sidebar = transparent and colors.none or bg_dark
				colors.bg_statusline = transparent and colors.none or bg_dark
				colors.bg_visual = bg_visual
				colors.border = border
				colors.fg = fg
				colors.fg_dark = fg_dark
				colors.fg_float = fg
				colors.fg_gutter = fg_gutter
				colors.fg_sidebar = fg_dark
			end,
		})

		-- Apply the tokyonight colorscheme
		vim.cmd("colorscheme tokyonight")

		-- Set up nvim-highlight-colors plugin for color highlightingwww
		require("nvim-highlight-colors").setup({
			render = "background", -- Highlight style
			enable_hex = true, -- Enable hex color highlighting
			enable_rgb = true, -- Enable rgb color highlighting
			enable_hsl = true, -- Enable hsl color highlighting
			enable_named_colors = true, -- Enable named colors (like 'red', 'blue')
		})

		-- Keybindings to toggle color highlights on and off
		local keymap = vim.keymap.set
		keymap("n", "<leader>hc", require("nvim-highlight-colors").toggle, { desc = "Toggle color highlights" }) -- Toggle highlight colors
	end,
	dependencies = {
		-- Add nvim-highlight-colors plugin
		"brenoprata10/nvim-highlight-colors",
	},
}
