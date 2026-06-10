require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls", "gopls", "lua_ls", "tailwindcss" },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.work', 'go.mod', '.git' },
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
    },
  },
})

vim.lsp.config('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'tsconfig.json', 'package.json', '.git' },
  capabilities = capabilities,
})

vim.lsp.config('tailwindcss', {
  cmd = { 'tailwindcss-language-server', '--stdio' },
  filetypes = { 'html', 'css', 'javascriptreact', 'typescriptreact' },
  root_markers = { 'tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js' },
  capabilities = capabilities,
})

vim.lsp.config('sqls', {
  capabilities = capabilities,
})

vim.lsp.enable({ 'lua_ls', 'gopls', 'ts_ls', 'tailwindcss', 'sqls' })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  end,
})

vim.diagnostic.config({
    virtual_text = { prefix = "●" },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local name = "DiagnosticSign" .. type
    vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }

    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts)

    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts)
  end,
})
