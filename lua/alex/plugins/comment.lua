local comment = {
	"numToStr/Comment.nvim",
	keys = {
		{
			"<C-_>",
			mode = "n",
			"<Plug>(comment_toggle_linewise_current)",
		},
		{
			"<C-_>",
			mode = "x",
			"<Plug>(comment_toggle_linewise_visual)",
		},
		{
			"<C-M-_>",
			mode = "n",
			"<Plug>(comment_toggle_blockwise_current)",
		},
		{
			"<C-M-_>",
			mode = "x",
			"<Plug>(comment_toggle_blockwise_visual)",
		},
		{
			"<C-/>",
			mode = "n",
			"<Plug>(comment_toggle_linewise_current)",
		},
		{
			"<C-/>",
			mode = "x",
			"<Plug>(comment_toggle_linewise_visual)",
		},
		{
			"<C-M-/>",
			mode = "n",
			"<Plug>(comment_toggle_blockwise_current)",
		},
		{
			"<C-M-/>",
			mode = "x",
			"<Plug>(comment_toggle_blockwise_visual)",
		},
	},
	opts = {

		pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		toggler = {
			---Line-comment toggle keymap
			line = "gcc",
			---Block-comment toggle keymap
			block = "gbc",
		},

		mappings = {
			basic = true,
			extra = true,
		},
	},
}

return comment
