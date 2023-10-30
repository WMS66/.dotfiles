-- Plugin: nvim-treesitter
local status_ok, configs = pcall(require, 'nvim-treesitter.configs.setup')
if not status_ok then
    return
end

configs {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
 ensure_installed = {"c", "lua", "vim", "python3", "cpp", "javascript", "typescript", "java", "query", "sql", "php", "css", "html", "markdown", "markdown_inline", "composer",
 },

sync_install = false,

ignore_install = { "" },
auto_install = true,
highlight = {
    enable = true,
    disble = {""},
    additional_vim_regex_highlighting = false,
},

autopairs = {
    enable = true,
},
rainbow = {
    enable = true,
    disable = { "jsx", "cpp", "html" }, --/list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
--  colors = {}, -- table of hex strings
-- termcolors = {} -- table of colour name strings
},
autotag = { enable = true },
incremental_selection = {
    enable = true,

    keymaps = {
        init_selection = '<CR>',
        scope_incremental = '<CR>',
        node_incremental = '<TAB>',
        node_decremental = '<S-TAB>',
    },
},

indent = { enable = true, disable = { "yaml"}},

tree_docs = {
        enable = true,
    }
}
