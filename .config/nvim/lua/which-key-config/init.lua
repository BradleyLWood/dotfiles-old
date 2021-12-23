local wk = require('which-key')

wk.setup({
	window = {
		border = "single",
	},
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		["<space>"] = "SPC",
		["<cr>"] = "ENTER",
		["<tab>"] = "TAB",
	},
})

wk.register({
	-- Telescope
	f = {
		name = "Telescope",
		f = { "Find File" },
		d = { "File Browser"},
		r = { "Open Recent File" },
		g = { "Grep" },
		b = { "Buffers" },
		h = { "Help Tags" },
	},
	-- NvimTree
	n = {
		name = "NvimTree",
		t = { "File Tree" },
		f = { "File Tree - Select" },
		r = { "File Tree - Refresh" },
	},
	-- Harpoon
	a = { "Mark Harpoon" },
	h = { 
		name = "Harpoon",
		l = { "Harpoon file menu" },
		c = { "Harpoon command menu" },
	},
}, { prefix = "<leader>" })
