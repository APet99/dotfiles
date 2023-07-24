local copilot = {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",
	opts = {
		suggestion = { enabled = false },
		panel = { enabled = false },
		ft_disable = {},
	},
}

return copilot
