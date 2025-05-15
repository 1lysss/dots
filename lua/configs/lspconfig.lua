local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- list of all servers configured.
lspconfig.servers = {
    "lua_ls",
    "clangd",
    "ts_ls",
}

-- list of servers configured with default config.
local default_servers = {}

for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end

lspconfig.clangd.setup({
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client)
    end,
    on_init = on_init,
    capabilities = capabilities,
})

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = {
                enable = false, -- Disable all diagnostics from lua_ls
                -- globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/love2d/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})

-- Java :

lspconfig.jdtls.setup({
  cmd = { "jdtls" },
  root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
})


require('lspconfig').ts_ls.setup({
  on_attach = function(client, bufnr)
    -- Print message when the language server attaches
    print("TypeScript Language Server attached")

    -- Ensure we properly handle LSP capabilities, especially with newer LSP versions
    if client.server_capabilities.documentFormattingProvider then
      -- Enable formatting if supported by the server
      -- Example: You can add a keybinding or command to format the file
    end
  end,
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = capabilities,
})

