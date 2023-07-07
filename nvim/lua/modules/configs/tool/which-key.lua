return function()
	local icons = {
		ui = require("modules.utils.icons").get("ui"),
		misc = require("modules.utils.icons").get("misc"),
	}

	require("which-key").setup({
		plugins = {
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = false,
				nav = false,
				z = true,
				g = true,
			},
		},

		icons = {
			breadcrumb = icons.ui.Separator,
			separator = icons.misc.Vbar,
			group = icons.misc.Add,
		},

		window = {
			border = "none",
			position = "bottom",
			margin = { 1, 0, 1, 0 },
			padding = { 1, 1, 1, 1 },
			winblend = 0,
		},
	})

	require("which-key").register({
		["gs"] = "which_key_ignore",
		["g'"] = "which_key_ignore",
		["g`"] = "which_key_ignore",
		["z%"] = "which_key_ignore",
		["<leader>a"] = "which_key_ignore",
		["<leader>p"] = { name = "Package" },
		["<leader>b"] = { name = "Buffer" },
		["<leader>f"] = { name = "Find" },
		["<leader>g"] = { name = "Git" },
		["<leader>o"] = { name = "Toggle" },
		["<leader>d"] = { name = "Debug" },
		["<leader>l"] = { name = "Lsp" },
		["<leader>s"] = { name = "Session/Search" },
		["<leader>t"] = { name = "Telescope" },
	})
end
