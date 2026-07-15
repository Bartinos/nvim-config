return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
    ft = "rust",
    config = function()
      require "configs.rustaceanvim"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {
        symbol_in_winbar = {
          enable = true, -- Explicitly force the breadcrumbs on
          show_file = true,
          color_mode = true,
        },
        -- Custom configurations go here (optional)
        ui = {
          border = "rounded",
        },
        lightbulb = {
          enable = false, -- NvChad already has UI indicators, true if you want it
        },
      }
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- Already handled by NvChad, but good to declare
      "nvim-tree/nvim-web-devicons", -- For cool icons
    },
  },
  {
    "olimorris/codecompanion.nvim",
    event = { "User FilePost", "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codecompanion").setup {
        strategies = {
          chat = { adapter = "llama_cpp" },
          inline = { adapter = "llama_cpp" },
        },
        adapters = {
          http = {
            llama_cpp = function()
              return require("codecompanion.adapters").extend("openai_compatible", {
                name = "llama_cpp",
                env = {
                  url = "http://127.0.0.1:8090",
                  chat_url = "/v1/chat/completions",
                },
                schema = {
                  model = {
                    default = "local-model",
                  },
                  num_ctx = {
                    default = 16384, -- Let CodeCompanion know you have a large context window
                  },
                },
              })
            end,
          },
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "python",
      },
    },
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    -- 1. Force the plugin to load as soon as you open a file
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("git-conflict").setup {
        default_mappings = true,
      }

      -- 2. Force an immediate refresh in case NvChad already cached the buffer
      vim.cmd [[GitConflictRefresh]]
    end,
  },
  {
    "AckslD/swenv.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        venvs_path = vim.fn.expand "~/.local/share/mamba/envs",
        post_set_venv = function()
          vim.cmd "LspRestart pyright"
        end,
      }
    end,
    config = function(_, opts)
      -- Hotpatch: Fixes the Plenary.nvim flatten() crash on Neovim 0.10+
      local ok, compat = pcall(require, "plenary.compat")
      if ok then
        compat.flatten = function(t)
          local flat = {}
          local function recurse(item)
            if type(item) == "table" then
              for _, v in ipairs(item) do
                recurse(v)
              end
            else
              table.insert(flat, item)
            end
          end
          recurse(t)
          return flat
        end
      end

      -- Pass the opts to setup now that Plenary is patched
      require("swenv").setup(opts)
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" }, -- Loads for normal MD files AND codecompanion
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
      file_types = { "markdown", "codecompanion" },
    },
  },
}
