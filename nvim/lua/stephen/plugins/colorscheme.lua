return {
 "dracula/vim",
 -- "beikome/cosme.vim",
  priority = 1000, -- make sure to load this before all the other plugins
  config = function()
    -- load the colorscheme here
    vim.cmd([[colorscheme dracula]])
 --  vim.cmd([[colorscheme cosme]])
    end,
}
