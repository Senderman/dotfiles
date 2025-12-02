require("git"):setup()

require("bookmarks"):setup({
	last_directory = { enable = false, persist = false, mode="dir" },
	persist = "all",
	desc_format = "parent",
	file_pick_mode = "parent",
	custom_desc_input = false,
	show_keys = true,
	notify = {
		enable = true,
		timeout = 1,
		message = {
			new = "New bookmark '<key>' -> '<folder>'",
			delete = "Deleted bookmark in '<key>'",
			delete_all = "Deleted all bookmarks",
		},
	},
})

