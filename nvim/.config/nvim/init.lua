vim.g.mapleader = " "
require("vim._core.ui2").enable({})

require("volute.core.remap")
require("volute.core.set")

vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/rose-pine/neovim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
  { src = "https://github.com/supermaven-inc/supermaven-nvim" },
  { src = "https://github.com/tpope/vim-fugitive" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/williamboman/mason.nvim" },
  { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
  { src = "https://github.com/hrsh7th/nvim-cmp" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
  { src = "https://github.com/hrsh7th/cmp-buffer" },
  { src = "https://github.com/hrsh7th/cmp-path" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/vieitesss/miniharp.nvim" },
  { src = "https://github.com/VoluteTech/manuscript.nvim" },
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  -- { src = "https://github.com/MunifTanjim/nui.nvim" },
  -- { src = "https://github.com/nvim-neorg/lua-utils.nvim" },
  -- { src = "https://github.com/nvim-neotest/nvim-nio" },
  -- { src = "https://github.com/pysan3/pathlib.nvim" },
  -- { src = "https://github.com/nvim-neorg/neorg" },
})

-- Native plugins
vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")

-- Plugins configs
require("volute.plugins.colorscheme")
require("volute.plugins.oil")
require("volute.plugins.telescope")
require("volute.plugins.treesitter")
require("volute.plugins.supermaven")
require("volute.plugins.fugitive")
require("volute.plugins.lsp")
require("volute.plugins.cmp")
require("volute.plugins.miniharp")
require("volute.plugins.manuscript")
require("volute.plugins.markdown")
-- require("volute.plugins.neorg")
