return function(config)
  local null_ls = require "null-ls"

  config.sources = {
    -- TypeScript
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,

    -- Lua
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.sumneko_lua,

    -- Ruby
    null_ls.builtins.formatting.rubocop,
    null_ls.builtins.diagnostics.rubocop,
  }

  return config
end
