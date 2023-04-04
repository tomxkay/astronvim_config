return {
  -- Theme
  { "ellisonleao/gruvbox.nvim", lazy = false }, -- Colorscheme
  { "sainnhe/everforest", lazy = false },
  { "ishan9299/nvim-solarized-lua", lazy = false },

  -- Git
  { "kdheepak/lazygit.nvim", cmd = "LazyGit" }, -- Git UI
  { "tpope/vim-fugitive", lazy = false }, -- Git commands in nvim

  -- Test
  { "preservim/vimux", lazy = false }, -- Vim test in tmux pane
  { "vim-test/vim-test", lazy = false }, -- Vim test util

  -- Utils
  { "dhruvasagar/vim-zoom", lazy = false }, -- tmux-like zoom
  { "junegunn/vim-easy-align" }, -- Text align util
  { "ojroques/nvim-oscyank", event = "BufEnter" }, -- Copy to system clipboard via OSC52
  { "MunifTanjim/prettier.nvim", event = "BufEnter" }, -- Prettier plugin for nvim lsp
  { "rmagatti/auto-session", event = "BufEnter" }, -- Auto session attach
  { "sindrets/winshift.nvim", event = "BufEnter" }, -- Windows shifting
  { "tomxkay/bdelete.vim", cmd = "BDelete" }, -- Buffer delete util
  { "tpope/vim-repeat", event = "BufEnter" }, -- Extend vim repeat functionality
  { "tpope/vim-surround", event = "BufEnter" }, -- Manipulate surrounding text
  { "tpope/vim-unimpaired", event = "BufEnter" }, -- Handy bracket mappings
  { "wesQ3/vim-windowswap", event = "BufEnter" }, -- Easy window swapping
  { "zirrostig/vim-schlepp", event = "BufEnter" }, -- Move lines up and down and around

  -- Extensions
  { "nvim-telescope/telescope-file-browser.nvim" }, -- File browser
  { "nvim-telescope/telescope-fzy-native.nvim" }, -- Better fuzzy search
  { "nvim-telescope/telescope-media-files.nvim" }, -- Better fuzzy search

  { -- Vim marks util
    "chentoast/marks.nvim",
    lazy = false,
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
    lazy = false,
    config = function()
      require("git").setup {
        default_mappings = false,
      }
    end,
  },

  { -- LSP diagnostics
    "folke/trouble.nvim",
    lazy = false,
    config = function()
      require("trouble").setup {
        position = "left",
      }
    end,
  },

  {
    "folke/zen-mode.nvim",
    lazy = false,
    config = function()
      require("zen-mode").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },

  {
    "jackMort/ChatGPT.nvim",
    lazy = false,
    commit = "8820b99c",
    config = function()
      require("chatgpt").setup {
        -- optional configuration
        welcome_message = "Hey Thomas. How can I help you?",
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "jedrzejboczar/possession.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("possession").setup {
        commands = {
          save = "SSave",
          load = "SLoad",
          delete = "SDelete",
          list = "SList",
        },
      }
    end,
  },

  { -- Typescript LSP commands wrapper
    "jose-elias-alvarez/typescript.nvim",
    lazy = false,
    dependencies = "mason-lspconfig.nvim",
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
}
