-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

return {
  n = {
    -- Writing files
    [",w"] = { ":w<cr>", desc = "Save File" },
    [",,w"] = { function() astronvim.ui.toggle_wrap() end, desc = "Toggle wrap" },

    -- Spliting buffers
    ["ss"] = { "<cmd>split<cr>", desc = "Split window" },
    ["sv"] = { "<cmd>vsplit<cr>", desc = "Split window vertical" },
    ["st"] = { "<cmd>tab split<cr>", desc = "Split tab" },
    ["ts"] = { "<cmd>tab split<cr>", desc = "Split tab" },

    -- Moving buffers
    ["sH"] = { "<c-w>H", desc = "Move window left" },
    ["sK"] = { "<c-w>K", desc = "Move window up" },
    ["sJ"] = { "<c-w>J", desc = "Move window down" },
    ["sL"] = { "<c-w>L", desc = "Move window right" },

    -- Closing windows and buffers
    ["sx"] = { "<cmd>q<cr>", desc = "Close window" },
    ["X"] = { "<cmd>bn | :bd#<cr>", desc = "Close buffer" },
    ["so"] = { "<C-w>o", desc = "Close all other windows" },
    [",bo"] = { "<cmd>%bd | e# | bd# | '\"<cr>'", desc = "Close all other buffers" },
    [",to"] = { "<cmd>tabonly<cr>", desc = "Close all other tabs" },
    [",tc"] = { "<cmd>tabclose<cr>", desc = "Close tab" },
    ["tc"] = { "<cmd>tabclose<cr>", desc = "Close tab" },

    -- Layout buffers
    [",sba"] = { "<cmd>ball<cr>", desc = "Buffers split all" },
    [",vba"] = { "<cmd>vert ba<cr>", desc = "Buffers vertical all" },
    [",tba"] = { "<cmd>tab ba<cr>", desc = "Buffers tab all" },

    -- Delete marks
    [",,DM"] = {
      '<cmd>delm! | delm A-Z0-9"<><CR> | :echo "Cleared all marks!"<CR>',
      desc = "Delete all marks",
    },

    -- Resize windows
    ["<right>"] = { "<cmd>vertical resize +5<cr>", desc = "Resize window right" },
    ["<left>"] = { "<cmd>vertical resize -5<cr>", desc = "Resize window left" },
    ["<up>"] = { "<cmd>resize +5<cr>", desc = "Resize window up" },
    ["<down>"] = { "<cmd>resize -5<cr>", desc = "Resize window down" },

    -- Clear highlights
    [",<c-l>"] = { "<cmd>noh<cr>", desc = "Clear highlight" },

    -- Misc
    ["<F5>"] = { "<cmd>! mysql -u $SQL_USER -p $SQL_PASSWORD $SQL_DB -t 2>/dev/null<CR>" },
    [",QR"] = {
      ":.!qrencode -m 2 -t utf8<CR>",
      desc = "QR codify current line",
    },
    ["Q"] = { "!!$SHELL<cr>", desc = "Yield output of current line of $SHELL command" },
    [",,,"] = {
      ":.!",
      desc = "Yield output of current line through specified $SHELL command",
    },

    -- No-Op
    ["dj"] = { "<Nop>" },
    ["dk"] = { "<Nop>" },

    -- Plugins Mappings
    -- Git
    ["<c-g>"] = { "<cmd>LazyGit<cr>", desc = "Open lazygit" },
    [",bb"] = { "<cmd>G blame<cr>", desc = "Git blame" },
    [",bB"] = { "<cmd>GitBlame<cr>", desc = "Git blame" },

    -- Zoom Toggle
    ["<cr>"] = { "<cmd>TZAtaraxis<cr>", desc = "Zen mode" },
    [",z"] = { "<cmd>TZFocus<cr>", desc = "Tmux-like zoom" },
    [",,z"] = { "<C-w>=", desc = "Normalize windows" },

    ["za"] = { "<cmd>TZAtaraxis<cr>", desc = "Zen mode" },
    ["zf"] = { "<cmd>TZFocus<cr>", desc = "Tmux-like zoom" },
    ["zm"] = { "<cmd>TZMinimalist<cr>", desc = "Minimist mode" },
    ["zn"] = { "<cmd>TZNarrow<cr>", desc = "Narrow mode" },

    -- Comment
    [",/"] = { function() require("Comment.api").toggle.linewise.current() end, desc = "Comment line" },

    -- Neo Tree
    [",;"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
    [",v"] = { "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },

    -- Session Manager
    [",fs"] = { "<cmd>SessionManager! load_session<cr>", desc = "Search sessions" },
    [",s"] = { "<cmd>SessionManager! load_session<cr>", desc = "Search sessions" },

    [",f"] = {
      function() vim.lsp.buf.format(astronvim.lsp.format_opts) end,
      desc = "Format code",
    },

    -- WinShift
    ["sM"] = { "<cmd>WinShift<cr>", desc = "Move windows" },
    ["sX"] = { "<cmd>WinShift swap<cr>", desc = "Swap two windows" },

    -- Vim Test
    [",l"] = { "<cmd>TestLast<cr>" },
    [",tn"] = { "<cmd>TestNearest<cr>" },
    [",tf"] = { "<cmd>TestFile<cr>" },
    [",ta"] = { "<cmd>TestSuite<cr>" },
    [",tl"] = { "<cmd>TestLast<cr>" },
    [",tv"] = { "<cmd>TestVisit<cr>" },

    -- Notify
    [",,<c-l>"] = {
      function() require("notify").dismiss { pending = true, silent = true } end,
      desc = "Clear notifications",
    },

    -- Trouble
    ["tj"] = { function() require("trouble").next { skip_groups = true, jump = true } end },
    ["tk"] = { function() require("trouble").previous { skip_groups = true, jump = true } end },
    ["tf"] = { function() require("trouble").first { skip_groups = true, jump = true } end },
    ["tl"] = { function() require("trouble").last { skip_groups = true, jump = true } end },

    ["tt"] = { "<cmd>TroubleToggle<cr>" },
    ["tw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>" },
    ["td"] = { "<cmd>TroubleToggle document_diagnostics<cr>" },
    ["tq"] = { "<cmd>TroubleToggle quickfix<cr>" },
    ["tL"] = { "<cmd>TroubleToggle loclist<cr>" },
    ["tr"] = { "<cmd>TroubleToggle lsp_references<cr>" },

    -- Telescope
    [",T"] = { "<cmd>Telescope<cr>" },

    ["<space>;"] = { function() require("telescope").extensions.file_browser.file_browser() end },
    [",m"] = {
      function()
        require("telescope.builtin").git_files {
          prompt_title = 'Git "modified" files',
          git_command = {
            "git",
            "ls-files",
            "--modified",
            "--exclude-standard",
          },
        }
      end,
      desc = "Find modified git files",
    },
    [",H"] = {
      function() require("telescope.builtin").git_bcommits() end,
      desc = "Browse buffer git history",
    },
    ["gh"] = {
      function() require("telescope.builtin").git_bcommits() end,
      desc = "Browse buffer git history",
    },
    [",fg"] = {
      function() require("telescope.builtin").live_grep() end,
      desc = "Grep codebase",
    },
    [",g"] = {
      function() require("telescope.builtin").live_grep() end,
      desc = "Grep codebase",
    },
    [",*"] = {
      function() require("telescope.builtin").grep_string { word_match = "-w" } end,
      desc = "Grep string under cursor",
    },
    [",L"] = {
      function() require("telescope.builtin").resume() end,
      desc = "Resume last picker",
    },
    [";"] = { function() require("telescope.builtin").buffers() end },
    ["f"] = {
      function()
        require("telescope.builtin").find_files {
          prompt_title = 'Find "filtered" files',
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--no-ignore-vcs",
            "--glob",
            "!**/.git/*",
            "--glob",
            "!**/node_modules/*",
            "--glob",
            "!**/assets/*",
            "--glob",
            "!**/.expo/*",
            "--glob",
            "!**/tmp/*",
            "--glob",
            "!**/log/*",
          },
        }
      end,
      desc = "Find filtered files",
    },
    [",F"] = {
      function()
        require("telescope.builtin").find_files {
          prompt_title = 'Find "all" files',
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--no-ignore-vcs",
          },
        }
      end,
      desc = "Find * files",
    },
    [",fl"] = {
      function() require("telescope.builtin").current_buffer_fuzzy_find() end,
      desc = "Buffer fuzzy find",
    },
    [",fD"] = {
      function()
        require("telescope.builtin").find_files {
          prompt_title = 'Find "dot" files',
          cwd = "~/dotfiles",
        }
      end,
      desc = "Search dotfiles",
    },
    [",fq"] = {
      function()
        require("telescope.builtin").quickfix {
          shorten_path = false,
        }
      end,
      desc = "Search quickfix",
    },
    [",fr"] = {
      function() require("telescope.builtin").registers() end,
      desc = "Search registers",
    },
    [",fc"] = {
      function() require("telescope.builtin").colorscheme { enable_preview = true } end,
      desc = "Search help",
    },
    [",fh"] = {
      function() require("telescope.builtin").help_tags() end,
      desc = "Search help",
    },
  },
  v = {
    [",/"] = {
      "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
      desc = "Toggle comment line",
    },

    ["<LeftRelease>"] = { '"*ygv', desc = "Copy to clipboard on mouse release" },

    ["<up>"] = { "<Plug>SchleppUp", desc = "Move line up" },
    ["<down>"] = { "<Plug>SchleppDown", desc = "Move line down" },
    ["<left>"] = { "<Plug>SchleppLeft", desc = "Move line left" },
    ["<right>"] = { "<Plug>SchleppRight", desc = "Move line right" },

    ["zn"] = { "<cmd>'<,'>TZNarrow<cr>", desc = "Narrow mode" },
  },
  x = {
    ["<BS>"] = { "x", desc = "Delete highlighted text with backspace in visual mode" },
  },
  c = {
    ["w!!"] = { "%!sudo tee > /dev/null %", desc = "Write file as sudo" },
  },
}
