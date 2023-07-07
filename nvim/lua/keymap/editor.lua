local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback
local et = bind.escape_termcode

local plug_map = {
	-- Plugin: accelerate-jk
	["n|j"] = map_callback(function()
		return et("<Plug>(accelerated_jk_gj)")
	end):with_expr(),
	["n|k"] = map_callback(function()
		return et("<Plug>(accelerated_jk_gk)")
	end):with_expr(),

	-- Plugin persisted.nvim
	["n|<leader>ss"] = map_cu("SessionSave"):with_noremap():with_silent():with_desc("Session: Save"),
	["n|<leader>sl"] = map_cu("SessionLoad"):with_noremap():with_silent():with_desc("Session: Load current"),
	["n|<leader>sd"] = map_cu("SessionDelete"):with_noremap():with_silent():with_desc("Session: Delete"),

	-- Plugin: nvim-bufdel
	["n|<A-q>"] = map_cr("BufDel"):with_noremap():with_silent():with_desc("Buffer: Close current"),

	-- Plugin: clever-f
	["n|;"] = map_callback(function()
		return et("<Plug>(clever-f-repeat-forward)")
	end):with_expr(),
	["n|,"] = map_callback(function()
		return et("<Plug>(clever-f-repeat-back)")
	end):with_expr(),

	-- Plugin: comment.nvim
	["n|gcc"] = map_callback(function()
			return vim.v.count == 0 and et("<Plug>(comment_toggle_linewise_current)")
				or et("<Plug>(comment_toggle_linewise_count)")
		end)
		:with_silent()
		:with_noremap()
		:with_expr()
		:with_desc("Edit: Toggle Comment for Line"),
	["n|gbc"] = map_callback(function()
			return vim.v.count == 0 and et("<Plug>(comment_toggle_blockwise_current)")
				or et("<Plug>(comment_toggle_blockwise_count)")
		end)
		:with_silent()
		:with_noremap()
		:with_expr()
		:with_desc("Edit: Toggle Comment for Block"),
	["n|gc"] = map_cmd("<Plug>(comment_toggle_linewise)")
		:with_silent()
		:with_noremap()
		:with_desc("Edit: Toggle Comment for Line with Op"),
	["n|gb"] = map_cmd("<Plug>(comment_toggle_blockwise)")
		:with_silent()
		:with_noremap()
		:with_desc("Edit: Toggle Comment for Block with Op"),
	["x|gc"] = map_cmd("<Plug>(comment_toggle_linewise_visual)")
		:with_silent()
		:with_noremap()
		:with_desc("Edit: Toggle Comment for Line with Select"),
	["x|gb"] = map_cmd("<Plug>(comment_toggle_blockwise_visual)")
		:with_silent()
		:with_noremap()
		:with_desc("Edit: Toggle Comment for Block with Select"),

	-- Plugin: diffview
	["n|<leader>gd"] = map_cr("DiffviewOpen"):with_silent():with_noremap():with_desc("Git: Show Diff"),
	["n|<leader>gc"] = map_cr("DiffviewClose"):with_silent():with_noremap():with_desc("Git: Close Diff"),

	-- Plugin: vim-easy-align
	["nx|ga"] = map_cr("EasyAlign"):with_desc("Edit: Align with Delimiter"),

	-- Plugin: treehopper
	["o|m"] = map_cu("lua require('tsht').nodes()"):with_silent():with_desc("Jump: Operate across Syntax Tree"),

	-- Plugin: tabout
	["i|<A-l>"] = map_cmd("<Plug>(TaboutMulti)"):with_silent():with_noremap():with_desc("edit: Goto end of pair"),
	["i|<A-h>"] = map_cmd("<Plug>(TaboutBackMulti)"):with_silent():with_noremap():with_desc("edit: Goto begin of pair"),

	-- Plugin suda.vim
	["n|<A-s>"] = map_cu("SudaWrite"):with_silent():with_noremap():with_desc("editn: Save file using sudo"),
}

bind.nvim_load_mapping(plug_map)
