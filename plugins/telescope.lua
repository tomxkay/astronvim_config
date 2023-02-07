require("telescope").load_extension "file_browser"
require("telescope").load_extension "fzy_native"
require("telescope").load_extension "possession"

return {
  defaults = {
    prompt_prefix = " > ",
    mappings = {
      i = {
        ["<c-l>"] = require("trouble.providers.telescope").smart_open_with_trouble,
      },
      n = {
        ["t"] = require("telescope.actions").toggle_all,
        ["p"] = require("telescope.actions").toggle_selection,
        ["<c-l>"] = require("trouble.providers.telescope").smart_open_with_trouble,
      },
    },
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--no-ignore-vcs",
      "--glob",
      "!**/.git/*",
      "--glob",
      "!**/assets/*",
      "--glob",
      "!**/node_modules/*",
      "--glob",
      "!**/.expo/*",
      "--glob",
      "!**/*.lock",
      "--trim",
    },
  },
  pickers = {
    find_files = {
      find_command = {
        "rg",
        "--files",
        "--hidden",
        "--glob",
        "!**/.git/*",
        "--glob",
        "!**/node_modules/*",
      },
    },
    buffers = {
      mappings = {
        n = {
          ["dd"] = require("telescope.actions").delete_buffer,
        },
      },
    },
  },
}
