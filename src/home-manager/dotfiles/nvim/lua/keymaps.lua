-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}


-- Remap leader to <space>
vim.g.mapleader = " "

-----------------
-- Normal mode --
-----------------
-- Hint: see `:h vim.map.set()`
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Silence Q because it's a bitch
vim.keymap.set("n", "Q", "<nop>")

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)
-- LSP format buffer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)


vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)

-- telescope config for find
vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<cr>", {})
vim.keymap.set('n', '<leader>fm', "<cmd>Telescope media_files<cr>", {})
vim.keymap.set('n', '<leader>fw', "<cmd>Telescope live_grep<cr>", {})
vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<cr>", {})
vim.keymap.set('n', '<leader>fh', "<cmd>Telescope help_tags<cr>", {})
vim.keymap.set('n', '<leader>fo', "<cmd>Telescope oldfiles<cr>", {})
vim.keymap.set('n', '<leader>fz', "<cmd>Telescope current_buffer_fuzzy_find<cr>", {})

-- telescope for git
vim.keymap.set('n', '<leader>cm', "<cmd>Telescope git_commits<cr>", {})
vim.keymap.set('n', '<leader>gt', "<cmd>Telescope git_status<cr>", {})

-- Undotree config
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

