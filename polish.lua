function configure_custom_auto_hlsearch()
  local namespace = vim.api.nvim_create_namespace
  vim.g.auto_hlsearch = false

  -- Default to disable auto highlight search
  vim.on_key(nil, namespace "auto_hlsearch")

  -- Set keybinding to toggle auto hlsearch
  vim.keymap.set("n", ",,h", function()
    vim.g.auto_hlsearch = not vim.g.auto_hlsearch

    if vim.g.auto_hlsearch == true then
      vim.on_key(auto_hlsearch_cb, namespace "auto_hlsearch")
    else
      vim.opt.hlsearch = true
      vim.on_key(nil, namespace "auto_hlsearch")
    end
  end, { silent = true })

  auto_hlsearch_cb = function(char)
    if vim.fn.mode() == "n" then
      local new_hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/" }, vim.fn.keytrans(char))
      if vim.opt.hlsearch:get() ~= new_hlsearch then vim.opt.hlsearch = new_hlsearch end
    end
  end
end

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

  configure_custom_auto_hlsearch()
end
