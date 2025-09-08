-- Netrw
vim.g.netrw_liststyle = 3

local opt = vim.opt

-- Leader key
vim.g.mapleader = " "

-- Line numbers
opt.number = true -- Show absolute number for current line
opt.relativenumber = true -- Relative numbers for other lines

-- Tabs & Indentation
opt.tabstop = 2 -- Number of spaces a tab counts for
opt.shiftwidth = 2 -- Size of an indent
opt.softtabstop = 2 -- Delete spaces as if they were tabs
opt.expandtab = true -- Use spaces instead of tabs
opt.autoindent = true -- Copy indent from current line

-- Wrapping
opt.wrap = false -- Disable line wrapping

-- Search
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- Respect case if uppercase letters used

-- Enable spellcheck globally
vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- Cursor & Highlighting
opt.cursorline = true -- Highlight the current line
opt.cursorcolumn = true -- Highlight the current column
opt.colorcolumn = "80" -- Highlight column 80 as a guide
opt.guicursor = table.concat({
	"n-v-c:block", -- Normal, Visual, Command modes: block
	"i-ci-ve:hor20-blinkwait0-blinkon125-blinkoff125", -- Insert/Replace/Virtual Insert: fast blinking underline
	"r-cr:hor20", -- Replace/Command Replace: thin horizontal bar
	"o:hor50", -- Operator-pending: half-height horizontal
	"a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor", -- All modes cursor timing
	"sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch cursor timing
}, ",")

-- Colors & UI
opt.termguicolors = true -- True color support
opt.background = "dark" -- Dark background
opt.signcolumn = "yes" -- Always show the sign column
-- opt.scrolloff = 12 -- Keep 12 lines visible above/below the cursor

-- Backspace behavior
opt.backspace = "indent,eol,start" -- Make backspace more powerful

-- Clipboard
opt.clipboard:append("unnamedplus") -- Use system clipboard by default

-- Window Splitting
opt.splitright = true -- Vertical splits go to the right
opt.splitbelow = true -- Horizontal splits go below

-- Mouse
opt.mouse = "a" -- Enable mouse in all modes

-- Disable annoying bells
opt.errorbells = false
opt.belloff = "all"

-- Swapfile
opt.swapfile = false -- Disable swapfiles

-- Middle-click paste prevention
local keymap_opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<MiddleMouse>", "<NOP>", keymap_opts)
vim.api.nvim_set_keymap("v", "<MiddleMouse>", "<NOP>", keymap_opts)
vim.api.nvim_set_keymap("i", "<MiddleMouse>", "<NOP>", keymap_opts)
