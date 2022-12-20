return function()
  local augroup = vim.api.nvim_create_augroup
  local autocmd = vim.api.nvim_create_autocmd

  local group_osc52 = augroup("OSC52", { clear = true })

  autocmd({ "TextYankPost" }, {
    desc = "Yank to system clipboard via OSC52",
    callback = function(event)
      if not vim.v.event.operator == "y" then return end

      if vim.v.event.regname == "" then require("osc52").copy_register "" end
      if vim.v.event.regname == "+" then require("osc52").copy_register "" end
      if vim.v.event.regname == "*" then require("osc52").copy_register "" end
    end,
    group = group_osc52,
  })
end
