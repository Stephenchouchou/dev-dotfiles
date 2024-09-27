return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "buffers",
      --mode = "tabs",
      separator_style = "slant",
       -- 左侧让出 nvim-tree 的位置
       offsets = {{
           filetype = "NvimTree",
           text = " File Explorer",
           highlight = "Directory",
           text_align = "left"
       }},
    },
  },
}
