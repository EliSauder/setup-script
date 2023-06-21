local lsp = require('lsp-zero').preset({})

local on_attach_func = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws",
        function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd",
        function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
        opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
        opts)
    vim.keymap
        .set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
        opts)
    vim.keymap.set("n", "<leader>qf", function()
        vim.lsp.buf.code_action({
            filter = function(a) return a.isPreferred end,
            apply = true
        })
    end, opts)
end

lsp.on_attach(on_attach_func(client, bufnr));

lsp.set_server_config({
    on_init = function(client)
        client.server_capabilities.semanticTokensProvider = nil
    end
})

lsp.ensure_installed {
    'tsserver', 'eslint', 'rust_analyzer', 'lua_ls', 'bashls', 'clangd',
    'csharp_ls', 'bashls'
}

-- lsp specific configs
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.ghdl_ls.setup {}
lspconfig.yamlls.setup {
    settings = {
        yaml = {
            keyOrdering = false,
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
            }
        }
    }
}
lspconfig.csharp_ls.setup {
    handlers = {
        ["textDocument/definition"] = require('csharpls_extended').handler
    },
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            client.server_capabilities.documentFormattingProvider = false
        end
        if client.server_capabilities.documentRangeFormattingProvider then
            client.server_capabilities.documentRangeFormattingProvider = false
        end

        on_attach_func(client, bufnr)
    end
}

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete()
})

lsp.setup_nvim_cmp({ mapping = cmp_mappings })

lsp.setup()

local null_ls = require("null-ls")
require('mason-null-ls').setup({
    ensure_installed = { "clang_format", "rustfmt", "lua_format", "commitlint" },
    automatic_installation = true,
    handlers = {
        clang_format = function()
            null_ls.register(null_ls.builtins.formatting.clang_format.with({
                extra_args = { "-style=file" }
            }))
        end
    }
})

null_ls.setup({ sources = {} })
