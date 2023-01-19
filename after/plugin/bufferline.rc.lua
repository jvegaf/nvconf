local present, bufferline = pcall(require, "bufferline")
if not present then return end

print('in bufferline')

bufferline.setup({
  options = {
    mode = 'buffers',
    separator_style = 'slant',
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    color_icons = true
  },
})

-- vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
-- vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
