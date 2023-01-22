return {
  -- Config for when primary source of truth is mason-null-ls
  -- ensure_installed = {
  --   "eslint_d",
  --   "graphql-language-service-cli",
  --   "prettierd",
  --   "rubocop",
  --   "stylua",
  --   "typescript-language-server",
  -- },
  -- automatic_installation = false,
  -- automatic_setup = true,

  -- Config for when primary source of truth is null-ls
  ensure_installed = nil,
  automatic_installation = true,
  automatic_setup = false,
}
