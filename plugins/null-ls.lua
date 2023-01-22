return function(config)
  local null_ls = require "null-ls"

  config.sources = {
    -- Set a formatter
    -- TypeScript
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.prettierd,
    -- Lua
    null_ls.builtins.formatting.stylua,

    -- Set a diagnostic
    -- TypeScript
    null_ls.builtins.diagnostics.eslint_d,
    -- Ruby
    null_ls.builtins.diagnostics.rubocop,
    -- Lua
    null_ls.builtins.diagnostics.selene,

    -- Set a code action
    -- TypeScript
    null_ls.builtins.code_actions.eslint_d,
  }

  return config
end
