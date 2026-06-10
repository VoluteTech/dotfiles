require('render-markdown').setup({
    -- Heading style adjustments
    heading = {
        sign = true,
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
    },
    -- Bullet point replacements
    bullet = {
        icons = { '•', '○', '◆', '◇' },
    },
    -- Code block aesthetic styling
    code = {
        sign = true,
        width = 'block',
        right_pad = 4,
    },
    -- Pretty checkbox toggles
    checkbox = {
        enabled = true,
    },
})

-- Ensure your conceal settings allow the icons to render beautifully
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
        vim.opt_local.conceallevel = 2
        vim.opt_local.concealcursor = 'nc'
    end,
})
