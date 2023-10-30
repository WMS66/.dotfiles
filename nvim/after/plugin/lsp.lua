local lsp_zero = require('lsp-zero')
lsp_zero.preset("recommended")

lsp_zero.on_attach(
function(client, bufnr)
--    lsp_zero.default_keymaps({buffer = bufnr})
    local opts = {buffer = bufnr}
    vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
    vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>m', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, opts)
end
)
-- Diagnostic icons
lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '',
})
--
require('mason').setup({})
require('mason-lspconfig').setup({
ensure_installed = {'cssls','html','jsonls','tailwindcss','pyright','lua_ls','dockerls','tsserver','rust_analyzer','eslint','clangd'},
handlers = {
    lsp_zero.default_setup,
    lua_ls = function()

local lua_opts = lsp_zero.nvim_lua_ls()
require('lspconfig').lua_ls.setup(lua_opts)
    end,
  },
})
-- requires
require('lspconfig').tsserver.setup({})
require('lspconfig').eslint.setup({})
require('lspconfig').rust_analyzer.setup({})

