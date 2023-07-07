local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback

local plug_map = {
	["n|<A-f>"] = map_cmd("<Cmd>FormatToggle<CR>"):with_noremap():with_desc("Formater: Toggle format on save"),
}
bind.nvim_load_mapping(plug_map)

local mapping = {}

function mapping.lsp(buf)
	local map = {
		-- LSP-related keymaps, work only when event = { "InsertEnter", "LspStart" }
		["n|<leader>ln"] = map_cr("LspInfo"):with_buffer(buf):with_desc("Lsp: Info"),
		["n|<leader>lr"] = map_cr("LspRestart"):with_buffer(buf):with_nowait():with_desc("Lsp: Restart"),
		["n|<leader>oo"] = map_cr("Lspsaga outline"):with_buffer(buf):with_desc("Lsp: Toggle outline"),
		["n|[d"] = map_cr("Lspsaga diagnostic_jump_prev"):with_buffer(buf):with_desc("Lsp: Prev Diagnostic"),
		["n|]d"] = map_cr("Lspsaga diagnostic_jump_next"):with_buffer(buf):with_desc("Lsp: Next Diagnostic"),
		["n|md"] = map_cr("Lspsaga show_line_diagnostics"):with_buffer(buf):with_desc("Lsp: Line Diagnostic"),
		["n|ms"] = map_callback(function()
			vim.lsp.buf.signature_help()
		end):with_desc("Lsp: Signature Help"),
		["n|gr"] = map_cr("Lspsaga rename"):with_buffer(buf):with_desc("Lsp: Rename in File Range"),
		["n|gR"] = map_cr("Lspsaga rename ++project"):with_buffer(buf):with_desc("Lsp: Rename in Project Range"),
		["n|mh"] = map_cr("Lspsaga hover_doc"):with_buffer(buf):with_desc("Lsp: Show Doc"),
		["nv|ga"] = map_cr("Lspsaga code_action"):with_buffer(buf):with_desc("Lsp: Code Action for Cursor"),
		["n|mp"] = map_cr("Lspsaga peek_definition"):with_buffer(buf):with_desc("Lsp: Preview Definition"),
		["n|gd"] = map_cr("Lspsaga goto_definition"):with_buffer(buf):with_desc("Lsp: Goto Definition"),
		["n|mr"] = map_cr("Lspsaga lsp_finder"):with_buffer(buf):with_desc("Lsp: Show Reference"),
		["n|mi"] = map_cr("Lspsaga incoming_calls"):with_buffer(buf):with_desc("Lsp: Show Incoming Calls"),
		["n|mo"] = map_cr("Lspsaga outgoing_calls"):with_buffer(buf):with_desc("Lsp: Show Outgoing Calls"),
	}
	bind.nvim_load_mapping(map)
end

return mapping
