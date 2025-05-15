return {

    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require("configs.lspconfig")
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },

    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lint")
        end,
    },

    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "nvim-lint" },
        config = function()
            require("configs.mason-lint")
        end,
    },

    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require("configs.conform"),
    },

    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = { "conform.nvim" },
        config = function()
            require("configs.mason-conform")
        end,
    },
    -- These are some examples, uncomment them if you want to see them work!
    -- {
    --   "neovim/nvim-lspconfig",
    --   config = function()
    --     require "configs.lspconfig"
    --   end,
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
  -- Add presence.nvim plugin for Discord Rich Presence
-- The setup config table shows all available config options with their default values:
-- 
--    {
  --      "andweeb/presence.nvim",  -- Add this line to install the presence plugin
    --    event = "VeryLazy",        -- Optional: Only load when necessary
      --  config = function()
        --    require("presence").setup({
          --      auto_update = true,
            --    neovim_image_text = "The One True Text Editor",
              --  main_image = "neovim",
                --client_id = "793271441293967371",
                --log_level = nil,
                --debounce_timeout = 10,
                --enable_line_number = false,
                --blacklist = {},
                --buttons = true,
                --file_assets = {},
                --show_time = true,
                --editing_text = "Editing %s",
                --file_explorer_text = "Browsing %s",
                --git_commit_text = "Committing changes",
                --plugin_manager_text = "Managing plugins",
                --reading_text = "Reading %s",
                --workspace_text = "Working on   ",
                --line_number_text = "Line %s out of %s",
            --})
        --end,
    --},
}

