-- TODO: Normal keymaps groups

vim.keymap.set("n", "U", "<cmd>redo<CR>")

vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>")

vim.keymap.set("n", "<leader>d", function()
	local api = require("nvim-tree.api")

	if api.tree.is_tree_buf() then
		vim.cmd("wincmd p")
	end

	api.tree.find_file({ open = true, focus = true })
end, { silent = true, noremap = true })

vim.keymap.set("n", "gd", function()
	require("telescope.builtin").lsp_definitions()
end, { desc = "Go to definition" })

vim.keymap.set("n", "gr", function()
	require("telescope.builtin").lsp_references()
end, { desc = "Find references" })

vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename" })

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files in project" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep in project" })
vim.keymap.set("n", "<leader>fG", "<cmd>Telescope live_grep search_dirs=%:p<CR>", { desc = "Live grep in file" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Show recent buffers" })
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Project Diagnostics" })
vim.keymap.set(
	"n",
	"<leader>ft",
	"<cmd>TodoTelescope keywords=TODO,FIX,HACK,WARN,PERF<CR>",
	{ desc = "TODO Telescope" }
)

vim.keymap.set("n", "<left>", "<nop>")
vim.keymap.set("n", "<right>", "<nop>")
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")

local function copy_line_diagnostics()
	local bufnr = vim.api.nvim_get_current_buf()
	local line = vim.api.nvim_win_get_cursor(0)[1] - 1
	local diagnostics = vim.diagnostic.get(bufnr, { lnum = line })

	if #diagnostics == 0 then
		print("No diagnostics on this line")
		return
	end

	local msg = table.concat(
		vim.tbl_map(function(d)
			return d.message
		end, diagnostics),
		"; "
	)

	vim.fn.setreg("+", msg)
	print("Copied diagnostic: " .. msg)
end

vim.keymap.set("n", "<leader>cd", copy_line_diagnostics, { silent = true })

-- vim.keymap.set("n", "md", function()
--     require("markview").commands.toggle()
-- end, { desc = "Toggle markdown viewer" })

-- Commands

vim.api.nvim_create_user_command("Q", function(opts)
	local force = opts.bang

	if not force then
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			if vim.api.nvim_buf_get_option(buf, "modified") then
				vim.api.nvim_echo({
					{ "No write since last change", "ErrorMsg" },
				}, true, {})
				return
			end
		end
	end

	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) then
			local bt = vim.api.nvim_buf_get_option(buf, "buftype")
			local ft = vim.api.nvim_buf_get_option(buf, "filetype")

			if bt ~= "nofile" and bt ~= "prompt" then
				pcall(vim.api.nvim_buf_delete, buf, { force = true })
			elseif ft == "NvimTree" or ft == "lazy" or ft == "mason" or ft == "terminal" then
				pcall(vim.api.nvim_buf_delete, buf, { force = true })
			end
		end
	end
	vim.cmd("Alpha")
end, {
	desc = "Close all buffers and open Alpha",
	bang = true,
})

vim.api.nvim_create_user_command("Ruff", function()
	local file = vim.fn.expand("%:p")
	vim.cmd("!ruff check --fix --unsafe-fixes " .. vim.fn.shellescape(file))
end, { desc = "Run Ruff check on this file" })

vim.api.nvim_create_user_command("Term", function()
	local cwd = vim.fn.getcwd()
	vim.fn.jobstart({ "kitty", "--working-directory", cwd }, { detach = true })
end, { desc = "Open Alacritty in current directory" })

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.prisma",
	callback = function()
		vim.lsp.buf.format()
	end,
})
