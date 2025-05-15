local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        c_cpp = { "clang-format" }, --alternative (Hack he said)
        javascript = { "prettier" },
        typescript = { "prettier" },
        java = { "clang_format" },
        -- css = { "prettier" },
        -- html = { "prettier" },
    },

    --    formatters = {
    --        ["clang-format"] = {
    --          prepend_args = {
    --            "-style={ \
    --          IndentWidth: 4, \
    --        TabWidth: 4, \
    --      UseTab: Never, \
    --    AccessModifierOffset: 0, \
    --  IndentAccessModifiers: true, \
    --}",
    --},
    --},
    --},

    --format_on_save = {
    -- These options will be passed to conform.format()
    --    timeout_ms = 500,
    --   lsp_fallback = true,
    --},
}

return options
