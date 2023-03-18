return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    local null_ls = require "null-ls"

    config.sources = {
      -- TypeScript
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.code_actions.eslint_d,

      -- Lua
      null_ls.builtins.formatting.stylua,

      -- Ruby
      null_ls.builtins.formatting.rubocop,
      null_ls.builtins.diagnostics.rubocop,

      -- ERB
      null_ls.builtins.formatting.erb_format,
    }

    return config
  end,
}
