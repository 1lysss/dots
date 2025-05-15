-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "catppuccin",

    hl_override = {
        ["@type"] = { fg = "#E5C07B" }, -- Classes and types (e.g., `declare`)
        --["@variable"] = { fg = "#FB4934" }, -- Variables (e.g., `number`, `mystring`)
        --["@function.call"] = { fg = "#61AFEF" }, -- Function calls (e.g., `cout`, `endl`)
        ["@property"] = { fg = "#FB4934" }, -- Object properties (e.g., `object.number`, `object.mystring`) - match variables

        ["@string"] = { fg = "vibrant_green" }, -- Keep only strings green (e.g., `"Ilyass"`)
        ["@comment"] = { fg = "#9e9e9e" }, -- Light gray for comments



        -- Gruvbox-inspired dark background
        --Normal = { bg = "#262A33" },  -- Dark background (Gruvbox dark)
        --StatusLine = { bg = "#262A33" },  -- Status line background
        --VertSplit = { bg = "#262A33" },  -- Vertical split line background
    },
    -- hl_override = {
    -- 	Comment = { italic = true },
    -- 	["@comment"] = { italic = true },
    -- },
}

--vim.opt.guifont = "CascadiaCode Nerd Font Regular:h14"





-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
