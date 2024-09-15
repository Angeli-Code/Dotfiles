--return {
--  "rose-pine/neovim",
--  name = "rose-pine",
--  config = function()
--    require("rose-pine").setup({
--      enable = {
--        terminal = true,
--        legacy_highlights = true,
--        migrations = true,
--      },
--
--      styles = {
--        bold = false,
--        italic = false,
--        transparency = true,
--      },
--    })
--    vim.cmd("colorscheme rose-pine")
--  end
--}

return {
  "ellisonleao/gruvbox.nvim",
  name = "gruvbox",
  config = function()
    require("gruvbox").setup({
      terminal_colors = false, -- add neovim terminal colors
      undercurl = false,
      underline = false,
      bold = false,
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
      strikethrough = false,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = true,
    })
    vim.cmd("colorscheme gruvbox")
  end
}
