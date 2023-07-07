local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback
require("keymap.helpers")

local plug_map = {
	-- Plugin: vim-fugitive
	["n|<leader>gh"] = map_cr("G push"):with_noremap():with_silent():with_desc("Git: Push"),
	["n|<leader>gl"] = map_cr("G pull"):with_noremap():with_silent():with_desc("Git: Pull"),
	["n|<leader>go"] = map_cu("Git"):with_noremap():with_silent():with_desc("Git: Open Git-fugitive"),

	-- Plugin: nvim-tree
	["n|<leader>of"] = map_cr("NvimTreeToggle"):with_noremap():with_silent():with_desc("Toggle: Filetree"),
	["n|<leader>fo"] = map_cr("NvimTreeFindFile"):with_noremap():with_silent():with_desc("Filetree: Find File"),
	["n|<leader>fh"] = map_cr("NvimTreeRefresh"):with_noremap():with_silent():with_desc("Filetree: Refresh"),

	-- Plugin: sniprun
	["v|<leader>or"] = map_cr("SnipRun"):with_noremap():with_silent():with_desc("Tool: Run Code by Range"),
	["n|<leader>or"] = map_cu([[%SnipRun]]):with_noremap():with_silent():with_desc("Tool: Run Code by File"),

	-- Plugin: toggleterm
	["t|<Esc><Esc>"] = map_cmd([[<C-\><C-n>]]):with_noremap():with_silent(), -- switch to normal mode in terminal.
	["t|jk"] = map_cmd([[<C-\><C-n>]]):with_noremap():with_silent(), -- switch to normal mode in terminal.
	["n|<leader>oh"] = map_cr([[execute v:count . "ToggleTerm direction=horizontal"]])
		:with_noremap()
		:with_silent()
		:with_desc("Terminal: Toggle Horizontal"),
	["i|<leader>oh"] = map_cmd("<Esc><Cmd>ToggleTerm direction=horizontal<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("Terminal: Toggle Horizontal"),
	["t|<leader>oh"] = map_cmd("<Cmd>ToggleTerm<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("Terminal: Toggle Horizontal"),
	["n|<leader>ov"] = map_cr([[execute v:count . "ToggleTerm direction=vertical"]])
		:with_noremap()
		:with_silent()
		:with_desc("Terminal: Toggle Vertical"),
	["i|<leader>ov"] = map_cmd("<Esc><Cmd>ToggleTerm direction=vertical<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("Terminal: Toggle Vertical"),
	["t|<leader>ov"] = map_cmd("<Cmd>ToggleTerm<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("Terminal: Toggle Vertical"),
	["n|<F5>"] = map_cr([[execute v:count . "ToggleTerm direction=float"]])
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle float"),
	["i|<F5>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=float<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle float"),
	["t|<F5>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle float"),
	["n|<leader>ot"] = map_cr([[execute v:count . "ToggleTerm direction=float"]])
		:with_noremap()
		:with_silent()
		:with_desc("Terminal: Toggle Float"),
	["i|<leader>ot"] = map_cmd("<Esc><Cmd>ToggleTerm direction=float<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("Terminal: Toggle Float"),
	["t|<leader>ot"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("Terminal: Toggle Float"),
	["n|<leader>ga"] = map_callback(function()
			_toggle_lazygit()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("Git: Toggle Lazygit"),

	-- Plugin: trouble
	["n|<leader>lt"] = map_cr("TroubleToggle"):with_noremap():with_silent():with_desc("Lsp: Toggle Trouble List"),
	["n|<leader>lr"] = map_cr("TroubleToggle lsp_references")
		:with_noremap()
		:with_silent()
		:with_desc("Lsp: Show Lsp References"),
	["n|<leader>ld"] = map_cr("TroubleToggle document_diagnostics")
		:with_noremap()
		:with_silent()
		:with_desc("Lsp: Show Document Diagnostics"),
	["n|<leader>lw"] = map_cr("TroubleToggle workspace_diagnostics")
		:with_noremap()
		:with_silent()
		:with_desc("Lsp: Show Workspace Diagnostics"),
	["n|<leader>lq"] = map_cr("TroubleToggle quickfix")
		:with_noremap()
		:with_silent()
		:with_desc("Lsp: Show Quickfix List"),
	["n|<leader>ll"] = map_cr("TroubleToggle loclist"):with_noremap():with_silent():with_desc("Lsp: Show Loclist"),

	-- Plugin: telescope
	["n|<C-p>"] = map_callback(function()
			_command_panel()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("Tool: Toggle command panel"),
	["n|<leader>tu"] = map_callback(function()
			require("telescope").extensions.undo.undo()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("Edit: Show Undo History"),
	["n|<leader>fp"] = map_callback(function()
			require("telescope").extensions.projects.projects({})
		end)
		:with_noremap()
		:with_silent()
		:with_desc("Find: Project"),
	["n|<leader>fr"] = map_callback(function()
			require("telescope").extensions.frecency.frecency()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("Find: File by Frecency"),
	["n|<leader>fw"] = map_callback(function()
			require("telescope").extensions.live_grep_args.live_grep_args()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("Find: Word in Project"),
	["n|<leader>fe"] = map_cu("Telescope oldfiles"):with_noremap():with_silent():with_desc("Find: File by History"),
	["n|<leader>ft"] = map_cu("Telescope current_buffer_fuzzy_find")
		:with_noremap()
		:with_silent()
		:with_desc("Find: Search Buffer"),
	["n|<leader>ff"] = map_cu("Telescope find_files"):with_noremap():with_silent():with_desc("Find: File in Project"),
	["n|<leader>oc"] = map_cu("Telescope colorscheme")
		:with_noremap()
		:with_silent()
		:with_desc("Ui: Change Colorscheme for Current Session"),
	["n|<leader>fg"] = map_cu("Telescope git_files")
		:with_noremap()
		:with_silent()
		:with_desc("Find: File in Git Project"),
	["n|<leader>fz"] = map_cu("Telescope zoxide list")
		:with_noremap()
		:with_silent()
		:with_desc("Edit: Change Current Direrctory by Zoxide"),
	["n|<leader>fb"] = map_cu("Telescope buffers"):with_noremap():with_silent():with_desc("Find: Buffer Opened"),
	["n|<leader>fs"] = map_cu("Telescope grep_string"):with_noremap():with_silent():with_desc("Find: Current Word"),
	["n|<leader>fd"] = map_cu("Telescope persisted"):with_noremap():with_silent():with_desc("Find: Session"),

	-- Plugin: dap
	["n|<F6>"] = map_callback(function()
			require("dap").continue()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Run/Continue"),
	["n|<F7>"] = map_callback(function()
			require("dap").terminate()
			require("dapui").close()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Stop"),
	["n|<F8>"] = map_callback(function()
			require("dap").toggle_breakpoint()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Toggle breakpoint"),
	["n|<F9>"] = map_callback(function()
			require("dap").step_into()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step into"),
	["n|<F10>"] = map_callback(function()
			require("dap").step_out()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step out"),
	["n|<F11>"] = map_callback(function()
			require("dap").step_over()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step over"),
	["n|<leader>db"] = map_callback(function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end)
		:with_noremap()
		:with_silent()
		:with_desc("Debug: Set Breakpoint with Condition"),
	["n|<leader>dc"] = map_callback(function()
			require("dap").run_to_cursor()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("Debug: Run to Cursor"),
	["n|<leader>dl"] = map_callback(function()
			require("dap").run_last()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("Debug: Run Last"),
	["n|<leader>do"] = map_callback(function()
			require("dap").repl.open()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("Debug: Open REPL"),
}

bind.nvim_load_mapping(plug_map)
