return {
  -- Favor null-ls for LSP formatting
  filter = function(client) return client.name == "null-ls" end,
  timeout_ms = 3200,
}
