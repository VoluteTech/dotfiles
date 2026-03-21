vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Lines number
vim.opt.relativenumber = true
vim.opt.number = true

-- Tabs and indents
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- termcolors
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

-- backspace$
vim.opt.backspace = "indent,eol,start"

-- clipboard
vim.opt.clipboard:append("unnamedplus")

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.updatetime = 50
vim.opt.colorcolumn = "120"
vim.opt.scrolloff = 10

-- cursor options
vim.opt.guicursor = "n-v-c:block,i:block-blinkwait500-blinkon200-blinkoff150"

-- lsp config
vim.opt.winborder = "rounded"

-- Create an autocommand group for yanking
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch', -- The color group (IncSearch is usually a nice yellow/orange)
      timeout = 50,         -- How long the highlight lasts in milliseconds
    })
  end,
  group = highlight_group,
  pattern = '*',
})
