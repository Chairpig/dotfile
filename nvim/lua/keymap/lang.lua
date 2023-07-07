local bind = require("keymap.bind")
local map_cr = bind.map_cr
-- local map_cu = bind.map_cu
-- local map_cmd = bind.map_cmd
-- local map_callback = bind.map_callback

local plug_map = {
	-- Plugin MarkdownPreview
	["n|<leader>om"] = map_cr("MarkdownPreviewToggle"):with_noremap():with_silent():with_desc("Tool: Preview Markdown"),
}

bind.nvim_load_mapping(plug_map)
