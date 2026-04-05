return {
  "ej-shafran/compile-mode.nvim",
  version = "^5.0.0",
  -- you can just use the latest version:
  -- branch = "latest",
  -- or the most up-to-date updates:
  -- branch = "nightly",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- if you want to enable coloring of ANSI escape codes in
    -- compilation output, add:
    { "m00qek/baleia.nvim", tag = "v1.3.0" },
  },
  config = function()
    ---@type CompileModeOpts
    vim.g.compile_mode = {
      default_command = {
        python = "python %",
        lua = "lua %",
        javascript = "node %",
        typescript = "node %",
        c = "cc -o %:r % && ./%:r",
        cpp = "cc -std=c++23 -o %:r % && ./%:r",
        java = "javac % && java %:r",
        go = "go run %",
        rust = "cargo run %",
      },
      recompile_no_fail = true,
      baleia_setup = true,
      -- if you use something like `nvim-cmp` or `blink.cmp` for completion,
      -- set this to fix tab completion in command mode:
      input_word_completion = true,

      -- to make `:Compile` replace special characters (e.g. `%`) in
      -- the command (and behave more like `:!`), add:
      bang_expansion = true,
    }
    vim.keymap.set("n", "<leader>r", ":below Compile<CR>")
    vim.keymap.set("n", "<leader>R", ":below Recompile<CR>")
    vim.keymap.set("n", "[e", "<cmd>CompileModeNextError<CR>")
    vim.keymap.set("n", "]e", "<cmd>CompileModePrevError<CR>")
  end
}
