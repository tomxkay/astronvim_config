local function ui_notify(str)
  if vim.g.ui_notifications_enabled then astronvim.notify(str) end
end

local function configure_auto_hlsearch_toggle()
  local namespace = vim.api.nvim_create_namespace
  -- Initialize default auto_hlsearch state
  vim.g.auto_hlsearch = false

  -- Default to disable auto highlight search
  vim.on_key(nil, namespace "auto_hlsearch")

  local function toggle_auto_hlsearch()
    vim.g.auto_hlsearch = not vim.g.auto_hlsearch

    local mode = ""

    if vim.g.auto_hlsearch == true then
      vim.on_key(function(char)
        if vim.fn.mode() == "n" then
          local new_hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/" }, vim.fn.keytrans(char))
          if vim.opt.hlsearch:get() ~= new_hlsearch then vim.opt.hlsearch = new_hlsearch end
        end
      end, namespace "auto_hlsearch")

      mode = "ephemeral mode"
    else
      vim.opt.hlsearch = true
      vim.on_key(nil, namespace "auto_hlsearch")

      mode = "persist mode"
    end

    ui_notify(string.format("Highlight search %s", mode))
  end

  -- Set keybinding to toggle auto hlsearch
  vim.keymap.set("n", ",,h", toggle_auto_hlsearch, { silent = true, desc = "Toggle auto highlight search" })
  vim.keymap.set("n", "<leader>uh", toggle_auto_hlsearch, { silent = true, desc = "Toggle auto highlight search" })
end

return function()
  local augroup = vim.api.nvim_create_augroup
  local autocmd = vim.api.nvim_create_autocmd

  local group_osc52 = augroup("OSC52", { clear = true })

  autocmd({ "TextYankPost" }, {
    desc = "Yank to system clipboard via OSC52",
    callback = function()
      local ok, osc52 = pcall(require, "osc52")
      if not ok then return end

      if not vim.v.event.operator == "y" then return end

      if vim.v.event.regname == "" then osc52.copy_register "" end
      if vim.v.event.regname == "+" then osc52.copy_register "" end
      if vim.v.event.regname == "*" then osc52.copy_register "" end
    end,
    group = group_osc52,
  })

  configure_auto_hlsearch_toggle()
end
