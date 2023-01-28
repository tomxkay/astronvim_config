-- Configure plugins

-- You can disable default plugins as follows:
-- ["goolord/alpha-nvim"] = { disable = true },

-- You can also add new plugins here as well:
-- Add plugins, the packer syntax without the "use"
-- { "andweeb/presence.nvim" },
-- {
--   "ray-x/lsp_signature.nvim",
--   event = "BufRead",
--   config = function()
--     require("lsp_signature").setup()
--   end,
-- },

-- We also support a key value style plugin definition similar to NvChad:
-- ["ray-x/lsp_signature.nvim"] = {
--   event = "BufRead",
--   config = function()
--     require("lsp_signature").setup()
--   end,
-- },

return {
  init = {
    -- Theme
    { "ellisonleao/gruvbox.nvim" }, -- Colorscheme

    -- Git
    { "kdheepak/lazygit.nvim" }, -- Git UI
    { "tpope/vim-fugitive" }, -- Git commands in nvim

    -- Test
    { "preservim/vimux" }, -- Vim test in tmux pane
    { "vim-test/vim-test" }, -- Vim test util

    -- Utils
    { "junegunn/vim-easy-align" }, -- Text align util
    { "ojroques/nvim-oscyank" }, -- Copy to system clipboard via OSC52
    { "MunifTanjim/prettier.nvim" }, -- Prettier plugin for nvim lsp
    { "rmagatti/auto-session" }, -- Auto session attach
    { "sindrets/winshift.nvim" }, -- Windows shifting
    { "tpope/vim-repeat" }, -- Extend vim repeat functionality
    { "tpope/vim-surround" }, -- Manipulate surrounding text
    { "tpope/vim-unimpaired" }, -- Handy bracket mappings
    { "wesQ3/vim-windowswap" }, -- Easy window swapping
    { "zirrostig/vim-schlepp" }, -- Move lines up and down and around

    -- Extensions
    { "nvim-telescope/telescope-file-browser.nvim" }, -- File browser
    { "nvim-telescope/telescope-fzy-native.nvim" }, -- Better fuzzy search

    { -- Windows expansion
      "anuvyklack/windows.nvim",
      requires = {
        "anuvyklack/middleclass",
      },
      config = function() require("windows").setup() end,
    },

    { -- Vim marks util
      "chentoast/marks.nvim",
      config = function()
        require("marks").setup {
          excluded_filetypes = {
            "lazygit",
            "",
          },
          refresh_interval = 5000,
        }
      end,
    },

    {
      "dinhhuy258/git.nvim",
      config = function()
        require("git").setup {
          default_mappings = false,
        }
      end,
    },

    { -- LSP diagnostics
      "folke/trouble.nvim",
      config = function()
        require("trouble").setup {
          position = "left",
        }
      end,
    },

    { -- Zoom toggle zen mode
      "Pocco81/true-zen.nvim",
      config = function()
        require("true-zen").setup {
          -- your config goes here
          -- or just leave it empty :)
        }
      end,
    },

    { -- Github copilot
      "zbirenbaum/copilot.lua",
      event = "InsertEnter",
      config = function()
        require("copilot").setup {
          panel = {
            enabled = true,
            auto_refresh = false,
            keymap = {
              jump_prev = "[[",
              jump_next = "]]",
              accept = "<CR>",
              refresh = "gr",
              open = "<M-CR>",
            },
          },
          suggestion = {
            enabled = true,
            auto_trigger = true,
            debounce = 75,
            keymap = {
              accept = "<C-l>",
              accept_word = false,
              accept_line = false,
              next = "<M-]>",
              prev = "<M-[>",
              dismiss = "<C-]>",
            },
          },
          filetypes = {
            yaml = false,
            markdown = false,
            help = false,
            gitcommit = false,
            gitrebase = false,
            hgcommit = false,
            svn = false,
            cvs = false,
            ["."] = false,
          },
          copilot_node_command = "node",
          server_opts_overrides = {},
        }
      end,
    },
  },
}
