return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  -- This ensures the keys work globally, even if you aren't in a markdown file
  keys = {
    { "<leader>nn", "<cmd>vsplit | ObsidianSearch<CR>",      desc = "Search Obsidian (vsplit)" },
    {
      "<leader>no",
      function()
        require("oil").open(vim.fn.expand("~/personal/vault"))
      end,
      desc = "Open Oil in Vault"
    },
    { "<leader>nt", "<cmd>ObsidianTemplate<CR>",             desc = "Insert Template" },
    { "<leader>nd", "<cmd>ObsidianToday<CR>",                desc = "Today's Daily Note" },
    { "<leader>nb", "<cmd>ObsidianBacklinks<CR>",            desc = "Show Backlinks" },
    { "<leader>nf", "<cmd>ObsidianFollowLink<CR>",           desc = "Follow Link" },
    { "<leader>ns", "<cmd>vsplit | ObsidianQuickSearch<CR>", desc = "Search Content (Grep)" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = vim.fn.expand("~") .. "/personal/vault",
      },
    },
    -- Use a clean ID format: timestamp-title
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,
    -- Daily notes configuration
    daily_notes = {
      folder = "dailies",
      date_format = "%Y-%m-%d",
      template = "daily-template.md",
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    -- UI settings for checkboxes and link concealing
    ui = {
      enable = true,
      update_debounce = 200,
      checkboxes = {
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
      },
    },
  },
  config = function(_, opts)
    require("obsidian").setup(opts)

    -- Force conceallevel for markdown files so the UI looks nice
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.opt_local.conceallevel = 2
      end,
    })
  end,
}
