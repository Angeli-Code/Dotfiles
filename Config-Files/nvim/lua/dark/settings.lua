-- General Settings
vim.opt.guicursor = ""
-- vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.scrolloff = 8

-- Coloring of Numbers
vim.cmd('highlight Normal ctermbg=none guibg=none')
vim.cmd('highlight LineNr ctermfg=white ctermbg=none guifg=white guibg=none')
vim.cmd('highlight CursorLineNr ctermfg=white ctermbg=none guifg=white guibg=none')
vim.cmd('highlight MatchParen ctermfg=black ctermbg=black guifg=black guibg=black')

-- CopyPasta
if vim.fn.executable('xsel') == 1 then
  vim.opt.clipboard:append { 'unnamedplus' }
  vim.g.clipboard = {
    name = 'xsel',
    copy = {
      ['+'] = 'xsel --clipboard --input',
      ['*'] = 'xsel --primary --input',
    },
    paste = {
      ['+'] = 'xsel --clipboard --output',
      ['*'] = 'xsel --primary --output',
    },
    cache_enabled = 0,
  }
end
