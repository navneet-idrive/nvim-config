return {
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
      "nvim-treesitter/nvim-treesitter",
      build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
      end,
    },


    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      },
      config = function()
        require("neo-tree").setup({
        filesystem = {
          follow_current_file = {
            enabled = true,   -- highlight & focus current file
            leave_dirs_open = true,
          },
        },
      })
      end,
      
    },
    {
      "neovim/nvim-lspconfig",
    },
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
    },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    }
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
      vim.keymap.set("n", "<leader>rn", function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end, { expr = true, desc = "LSP Rename" })
    end,
  },
  -- Auto-pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end
  },

  -- LSP signature help
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require("lsp_signature").setup({
        bind = true,
        floating_window = true,
        hint_enable = true,
        handler_opts = {
          border = "rounded"
        }
      })
    end
  },

  -- Auto-pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end
  },

  -- LSP signature help
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require("lsp_signature").setup({
        bind = true,
        floating_window = true,
        hint_enable = true,
        handler_opts = {
          border = "rounded"
        }
      })
    end
  },

  -- Lightbulb for code actions
  {
    "kosayoda/nvim-lightbulb",
    event = {"BufReadPost", "BufWritePost", "BufEnter"},
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = { enabled = true },
        sign = { enabled = true, priority = 10 },
        virtual_text = { enabled = false },
        status_text = { enabled = false },
      })
    end
  },

  -- Keybinding cheatsheet
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          section_separators = "",
          component_separators = "|",
        }
      })
    end
  },

  -- Fancy UI (like inputs/select)
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },
    -- Git integration in Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
      vim.keymap.set("n", "<leader>gfc", builtin.git_bcommits, {})
      vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
      vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
      vim.keymap.set("n", "<leader>gst", builtin.git_stash, {})
    end,
  },

  -- Optional: FZF native for faster searching
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = vim.fn.executable("make") == 1,
  },
  -- Dashboard (startup screen)
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("dashboard").setup({
        theme = "hyper",
        config = {
          shortcut = {
            { desc = " Files", group = "Label", action = "Telescope find_files", key = "f" },
            { desc = " Grep", group = "Label", action = "Telescope live_grep", key = "g" },
          },
        },
      })
    end
  },

  -- Toggle terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-\>]],
        direction = "float",
        float_opts = {
          border = "curved"
        }
      })
    end
  },

  -- Indent lines
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  -- Search & replace
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("spectre").setup()
    end
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup {
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 500,
          virt_text_pos = 'eol'
        }
      }
    end
  },

  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end,
  }



}

