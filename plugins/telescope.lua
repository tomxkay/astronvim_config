return {
  "nvim-telescope/telescope.nvim",
  dependencies = { -- add a new dependency to telescope that is our new plugin
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-fzy-native.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "jedrzejboczar/possession.nvim",
  },
  -- the first parameter is the plugin specification
  -- the second is the table of options as set up in Lazy with the `opts` key
  config = function(plugin, opts)
    -- run the core AstroNvim configuration function with the options table
    require "plugins.configs.telescope"(plugin, opts)

    -- require telescope and load extensions as necessary
    local telescope = require "telescope"
    telescope.load_extension "file_browser"
    telescope.load_extension "fzy_native"
    telescope.load_extension "media_files"
    telescope.load_extension "possession"
  end,
  opts = {
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
        "!**/deps/*",
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
          "--glob",
          "!**/deps/*",
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
  },
}
