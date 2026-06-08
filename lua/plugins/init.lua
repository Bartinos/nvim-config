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
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   build = "make BUILD_FROM_SOURCE=true",
  --   opts = {
  --     provider = "ollamalocal",
  --     auto_suggestions_provider = "ollamalocal",
  --     providers = {
  --       ollamalocal = {
  --         __inherited_from = "openai",
  --         api_key_name = "",
  --         endpoint = "http://127.0.0.1:11434/v1",
  --         model = "qwen2.5-coder:7b",
  --         disable_tools = true, -- <--- ADD THIS LINE
  --         max_tokens = 4096,
  --         temperature = 0,
  --         timeout = 30000,
  --       },
  --     }, -- Some local models get confused by tool instructions.
  --     -- If it still just talks, uncomment the line below to see the error:
  --     -- debug = true,
  --   },
  --   dependencies = {
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     "MeanderingProgrammer/render-markdown.nvim",
  --   },
  -- },
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
