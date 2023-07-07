local custom = {}

custom["folke/todo-comments.nvim"] = {
	lazy = true,
	event = "BufRead",
	config = require("custom.todo-comments"), -- Require that config
	keys = {
		{
			"<leader>tt",
			"<cmd>TodoTelescope<cr>",
			desc = "Telescope: Todo",
		},
		{
			"<leader>to",
			"<cmd>Telescope<cr>",
			desc = "Telescope: Open",
		},
	},
}

custom["nvim-pack/nvim-spectre"] = {
	lazy = true,
	cmd = { "Spectre" },
	opts = { open_cmd = "noswapfile vnew" },
	keys = {
		{
			"<leader>sr",
			function()
				require("spectre").open()
			end,
			desc = "Search: Replace in Files (Spectre)",
		},
		{
			"<leader>sw",
			function()
				require("spectre").open_visual({ select_word = true })
			end,
			desc = "Search: Current Word",
		},
		{
			"<leader>sp",
			function()
				require("spectre").open_file_search({ select_word = true })
			end,
			desc = "Search: Current Word on Current File",
		},
	},
	config = require("custom.nvim-spectre"),
}

custom["gbprod/substitute.nvim"] = {
	config = function()
		require("substitute").setup({})
	end,
}

custom["sitiom/nvim-numbertoggle"] = {}

custom["kevinhwang91/nvim-hlslens"] = {
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlslens").setup({
			calm_down = true,
		})
	end,
}

custom["monaqa/dial.nvim"] = {
	keys = {
		{
			"<C-a>",
			function()
				return require("dial.map").inc_normal()
			end,
			expr = true,
			desc = "Increment",
		},
		{
			"<C-x>",
			function()
				return require("dial.map").dec_normal()
			end,
			expr = true,
			desc = "Decrement",
		},
	},
	config = function()
		local augend = require("dial.augend")
		require("dial.config").augends:register_group({
			default = {
				augend.integer.alias.decimal_int,
				augend.integer.alias.hex,
				augend.integer.alias.binary,
				augend.date.alias["%Y/%m/%d"],
				augend.semver.alias.semver,
				augend.constant.alias.bool,
				augend.constant.alias.alpha,
				augend.constant.alias.Alpha,
				augend.constant.new({
					elements = { "&&", "||" },
					word = false,
					cyclic = true,
				}),
			},
		})
	end,
}

custom["AckslD/nvim-neoclip.lua"] = {
	lazy = false,
	require = {
		{ { "kkharji/sqlite.lua", module = "sqlite" }, { "nvim-telescope/telescope.nvim" } },
	},
	keys = {
		{
			"<leader>ty",
			function()
				require("telescope").extensions.neoclip.default()
			end,
			desc = "Telescope: Open Yank History",
		},
	},
	config = function()
		require("neoclip").setup({
			enable_persistent_history = true,
			preview = true,
			disable_keycodes_parsing = true,
		})
	end,
}

custom["tversteeg/registers.nvim"] = {
	name = "registers",
	keys = {
		{ '"', mode = { "n", "v" } },
		{ "<C-R>", mode = "i" },
	},
	cmd = "Registers",
	config = function()
		local registers = require("registers")
		require("registers").setup({
			bind_keys = {
				-- Show the window when pressing " in normal mode, applying the selected register as part of a motion, which is the default behavior of Neovim
				normal = registers.show_window({ mode = "motion" }),
				-- Show the window when pressing " in visual mode, applying the selected register as part of a motion, which is the default behavior of Neovim
				visual = registers.show_window({ mode = "motion" }),
				-- Show the window when pressing <C-R> in insert mode, inserting the selected register, which is the default behavior of Neovim
				insert = registers.show_window({ mode = "insert" }),

				-- When pressing the key of a register, apply it with a very small delay, which will also highlight the selected register
				registers = registers.apply_register({ delay = 0.1 }),
				-- Immediately apply the selected register line when pressing the return key
				["<CR>"] = registers.apply_register(),
				-- Close the registers window when pressing the Esc key
				["<Esc>"] = registers.close_window(),

				-- Move the cursor in the registers window down when pressing <C-n>
				["<C-n>"] = registers.move_cursor_down(),
				-- Move the cursor in the registers window up when pressing <C-p>
				["<C-p>"] = registers.move_cursor_up(),
				-- Move the cursor in the registers window down when pressing <C-j>
				["<C-j>"] = registers.move_cursor_down(),
				["<Tab>"] = registers.move_cursor_down(),
				-- Move the cursor in the registers window up when pressing <C-k>
				["<C-k>"] = registers.move_cursor_up(),
				["S-<Tab>"] = registers.move_cursor_up(),
				-- Clear the register of the highlighted line when pressing <DeL>
				["<Del>"] = registers.clear_highlighted_register(),
				-- Clear the register of the highlighted line when pressing <BS>
				["<BS>"] = registers.clear_highlighted_register(),
			},
			window = {
				-- The window can't be wider than 100 characters
				max_width = 100,
				-- Show a small highlight in the sign column for the line the cursor is on
				highlight_cursorline = true,
				-- Don't draw a border around the registers window
				border = "double",
				-- Apply a tiny bit of transparency to the the window, letting some characters behind it bleed through
				transparency = 0,
			},
		})
	end,
}

custom["m4xshen/smartcolumn.nvim"] = {
	config = function()
		require("smartcolumn").setup({
			colorcolumn = "120",
			disabled_filetypes = { "help", "text", "markdown", "Scratch" },
		})
	end,
}

custom["kylechui/nvim-surround"] = {
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({})
	end,
}

custom["tomasky/bookmarks.nvim"] = {
	event = "VimEnter",
	keys = {
		{
			"mm",
			function()
				require("bookmarks").bookmark_toggle()
			end,
			desc = "Bookmark: Toggle Mark",
		},
		{
			"ma",
			function()
				require("bookmarks").bookmark_ann()
			end,
			desc = "Bookmark: Add or Edit Mark Annotation",
		},
		{
			"mc",
			function()
				require("bookmarks").bookmark_clean()
			end,
			desc = "Bookmark: Clean all Marks",
		},
		{
			"[k",
			function()
				require("bookmarks").bookmark_prev()
			end,
			desc = "Bookmark: Jump to Previous Mark",
		},
		{
			"]k",
			function()
				require("bookmarks").bookmark_next()
			end,
			desc = "Bookmark: Jump to Next Mark",
		},
		{
			"<leader>tm",
			function()
				require("telescope").extensions.bookmarks.list({})
			end,
			desc = "Telescope: Bookmarks on Current File",
		},
	},
	config = true,
}

custom["zhuzhzh/verilog_emacsauto.vim"] = {
	ft = { "verilog", "systemverilog" },
	keys = {
		{ "<leader>oa", "<Plug>VerilogEmacsAutoAdd", desc = "Verilog: Add" },
		{ "<leader>od", "<Plug>VerilogEmacsAutoDelete", desc = "Verilog: Delete" },
	},
}

return custom
