local ui = {}

ui["goolord/alpha-nvim"] = {
	lazy = true,
	event = "VimEnter",
	dependencies = { { "nvim-tree/nvim-web-devicons", "ColaMint/pokemon.nvim" } },
	config = require("ui.alpha"),
}
ui["akinsho/bufferline.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.bufferline"),
}
ui["Jint-lzxy/nvim"] = {
	lazy = false,
	branch = "refactor/syntax-highlighting",
	name = "catppuccin",
	config = require("ui.catppuccin"),
}
ui["sainnhe/edge"] = {
	lazy = true,
	config = require("ui.edge"),
}
ui["j-hui/fidget.nvim"] = {
	lazy = true,
	branch = "legacy",
	event = "LspAttach",
	config = require("ui.fidget"),
}
ui["lewis6991/gitsigns.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.gitsigns"),
}
ui["lukas-reineke/indent-blankline.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("ui.indent-blankline"),
}
ui["nvim-lualine/lualine.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.lualine"),
}
ui["zbirenbaum/neodim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("ui.neodim"),
}
ui["karb94/neoscroll.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("ui.neoscroll"),
}
ui["shaunsingh/nord.nvim"] = {
	lazy = true,
	config = require("ui.nord"),
}
ui["rcarriga/nvim-notify"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("ui.notify"),
}
ui["folke/paint.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.paint"),
}
ui["gorbit99/codewindow.nvim"] = {
	lazy = false,
	keys = {
		{
			"<leader>on",
			function()
				require("codewindow").toggle_minimap()
			end,
			desc = "Toggle: Minimap",
		},
	},
	config = function()
		local codewindow = require("codewindow")
		codewindow.setup({ auto_enable = true, window_border = "none" })
	end,
}
ui["edluffy/specs.nvim"] = {
	lazy = true,
	event = "CursorMoved",
	config = require("ui.specs"),
}

return ui
