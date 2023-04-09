return {
  "Shatur/neovim-session-manager",
  event = { "BufWritePost", "VimEnter" },
  cmd = "SessionManager",
  opts = {
    autoload_mode = require("session_manager.config").AutoloadMode.CurrentDir,
  },
}
