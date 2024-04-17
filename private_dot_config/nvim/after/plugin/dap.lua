require("dap-go").setup({
	dap_configurations = {
		{
			type = "go",
			name = "Debug main",
			request = "launch",
			program = "${workspaceFolder}/cmd/main.go",
			buildFlags = "-tags 'dev load_envs'",
		},
	},
	delve = {
		build_flags = "-tags 'dev load_envs'",
	},
})

require("dapui").setup()

vim.keymap.set("n", "<leader>dc", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<leader>dB", function()
	require("dap").set_breakpoint()
end)
vim.keymap.set("n", "<leader>dut", function()
	require("dapui").toggle()
end)
