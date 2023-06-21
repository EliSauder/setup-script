require('material').setup({
    contrast = {
        terminal = true,
        sidebars = true,
        floating_windows = true,
        cursor_line = true,
        non_current_windows = true,
    },
    plugins = {
        "nvim-cmp",
        "telescope",
        "gitsigns",
        "nvim-web-devicons"
    },
    disable = {
        background = false
    },
    high_visibility = {
        darker = true
    },
    custom_highlights = {
        LineNr = { fg = '#007789' },
    },
    custom_colors = function(colors)
        colors.editor.selection = "#22255b"
    end
})

vim.g.material_style = "deep ocean"
vim.cmd 'colorscheme material'
--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
