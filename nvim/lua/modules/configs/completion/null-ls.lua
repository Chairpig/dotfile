return function()
	local null_ls = require("null-ls")
	local mason_null_ls = require("mason-null-ls")
	local btns = null_ls.builtins

	-- Please set additional flags for the supported servers here
	-- Don't specify any config here if you are using the default one.
	local sources = {
		btns.diagnostics.verilator,
		btns.formatting.clang_format.with({
			filetypes = { "c", "cpp" },
			extra_args = require("completion.formatters.clang_format"),
		}),
		btns.formatting.prettier.with({
			filetypes = {
				"vue",
				"typescript",
				"javascript",
				"typescriptreact",
				"javascriptreact",
				"yaml",
				"html",
				"css",
				"scss",
				"sh",
				"markdown",
			},
		}),
		btns.formatting.verible_verilog_format.with({
			extra_args = {
				"--indentation_spaces=4",
				"--line_break_penalty=4",
				"--assignment_statement_alignment=align",
				"--case_items_alignment=align",
				"--class_member_variable_alignment=align",
				"--distribution_items_alignment=align",
				"--enum_assignment_statement_alignment=align",
				"--formal_parameters_alignment=align",
				"--module_net_variable_alignment=align",
				"--named_parameter_alignment=align",
				"--named_port_alignment=align",
				"--port_declarations_alignment=align",
				"--port_declarations_right_align_packed_dimensions=true",
				"--port_declarations_right_align_unpacked_dimensions=true",
				"--struct_union_members_alignment=align",
				"--try_wrap_long_lines=true",
			},
		}),
	}
	null_ls.setup({
		border = "rounded",
		debug = false,
		log_level = "warn",
		update_in_insert = false,
		sources = sources,
	})

	mason_null_ls.setup({
		ensure_installed = require("core.settings").null_ls_deps,
		automatic_installation = false,
		automatic_setup = true,
		handlers = {},
	})

	require("completion.formatting").configure_format_on_save()
end
