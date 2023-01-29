-- set vim options here (vim.<first_key>.<second_key> = value)

-- If you need more control, you can use the function()...end notation
-- options = function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end,

return {
  opt = {
    -- set to true or false etc.
    relativenumber = false, -- sets vim.opt.relativenumber
    number = true, -- sets vim.opt.number
    spell = false, -- sets vim.opt.spell
    signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    wrap = false, -- sets vim.opt.wrap
    showbreak = "↪", -- show line break
    list = true, -- list hidden characters
    listchars = { -- configure listchars (see :h listchars)
      tab = "»»",
      trail = "·",
      nbsp = "~",
      eol = "↲",
      precedes = "←",
      extends = "→",
    },
    showmatch = true, -- show matching braces
    confirm = true, -- ask to save file rather than failing command
    autowrite = true, -- automatically :write before running commands
    autoread = true, -- reload files changes outside vim
    swapfile = false, -- disable swapfile
  },
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_enabled = true, -- enable diagnostics at start
    status_diagnostics_enabled = true, -- enable diagnostics in statusline
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    ["test#strategy"] = "vimux", -- sets vim-test strategy to use tmux pane
  },
}
