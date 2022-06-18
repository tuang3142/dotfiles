--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
-- vim.cmd("let g:gruvbox_material_background = 'hard'")
-- vim.cmd("let g:gruvbox_material_enable_bold=1")
-- vim.cmd("let g:gruvbox_material_enable_italic=1")
-- vim.cmd("let g:gruvbox_material_foreground='original'")
-- lvim.colorscheme = "gruvbox-material"
lvim.colorscheme = "gruvbox"

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.normal_mode["<leader>w"] = false
lvim.keys.normal_mode["<leader>a"] = ":wa<cr>"
lvim.keys.normal_mode["<leader>x"] = ":x<cr>"
lvim.keys.normal_mode["<leader>ga"] = ":Git add %<cr>"
lvim.keys.normal_mode["<leader>gm"] = ':Git commit -m "'
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.nvimtree.show_icons.git = 0
-- lvim.builtin.lualine.options = { theme = 'gruvbox-material' }
-- lvim.builtin.nvimtree.setup.view = {
--   width = 100,
--   number = true,
--   relativenumber = true,
--   preserve_window_proportions = true,
-- }
lvim.builtin.nvimtree.setup.view.width = 100
lvim.builtin.nvimtree.setup.view.number = true
lvim.builtin.nvimtree.setup.view.relativenumber = true
lvim.builtin.nvimtree.setup.view.preserve_window_proportions = true
lvim.builtin.nvimtree.setup.filters = {}
-- lvim.builtin.bufferline.active = false





-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = true

---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })
-- local opts = {
--   compilerOptions = {
--     experimentalDecorators = true
--   }
-- } -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("tsserver", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  { "sainnhe/gruvbox-material" },
  { "christoomey/vim-tmux-navigator" },
  { "tpope/vim-fugitive" },
  { "sevko/vim-nand2tetris-syntax" },
  { "tpope/vim-repeat" },
  {
    "tpope/vim-surround",
    -- keys = { "c", "d", "y" }
    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  },
  { "tpope/vim-abolish" },
  { "preservim/vimux" },
  { "vim-test/vim-test" },
  { "junegunn/fzf" },
  { "junegunn/fzf.vim" },
  { "folke/trouble.nvim" },
  { 'lukas-reineke/indent-blankline.nvim' },
  { 'gruvbox-community/gruvbox' },
  { 'marko-cerovac/material.nvim' },
  { 'sunjon/shade.nvim' },
  { 'folke/twilight.nvim' }
}

require 'shade'.setup({
  overlay_opacity = 50,
  opacity_step = 1,
  keys = {
    brightness_up   = '<C-Up>',
    brightness_down = '<C-Down>',
    toggle          = '<Leader>s',
  }
})

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
vim.cmd("let g:tmux_navigator_save_on_switch=2")
vim.cmd("let g:tmux_navigator_disable_when_zoomed=1")
vim.cmd("set relativenumber")
vim.cmd("nnoremap <silent><cr> :NvimTreeFindFile<cr>")
vim.cmd("nnoremap <silent>sl :e src/config/local.json<cr>")
vim.cmd("nnoremap <silent>sp :e package.json<cr>")
vim.cmd("runtime ./plug.vim")
-- vim.cmd("nnoremap <leader>R :%s/\<<C-r><C-w>\>//g<Left><Left>")
-- vim.cmd("nnoremap <leader>w :wa <cr>")
vim.cmd("set wrap linebreak")
vim.cmd("nmap tn :wa<cr>:TestNearest<CR>")
vim.cmd("nmap tf :wa<cr>:TestFile<CR>")
vim.cmd("nmap tl :wa<cr>:TestLast<CR>")
vim.cmd("let gruvbox_contrast_dark='hard'")
vim.cmd("let gruvbox_sign_column='none'")
vim.cmd("let gruvbox_invert_selection='false'")
vim.cmd("let test#strategy = 'vimux'")

-- jk when wrapper on
vim.cmd("nmap k gk")
vim.cmd("nmap j gj")

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = false,
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  -- disable virtual text
  virtual_text = false,

  -- show signs
  signs = false,
  -- delay update diagnostics
  update_in_insert = false,
  -- display_diagnostic_autocmds = { "InsertLeave" },
 }
)

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    args = { "--print-width", "100" },
    filetypes = { "typescript", "typescriptreact", "javascript" },
  },
}

local dropdown_theme = { theme = "dropdown" }

require'telescope'.setup {
  pickers = {
    find_files = dropdown_theme,
    git_files = dropdown_theme,
    oldfiles = dropdown_theme,
    live_grep = dropdown_theme,
    buffers = dropdown_theme,
  },
}
