return { setup = function()
    require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "cpp", "hlsl", "glsl", "lua", "javascript", "cmake" },
        sync_install = true,
        auto_install = true,
        ignore_install = {},

        highlight = {
            -- `false` will disable the whole extension
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    }

    require'treesitter-context'.setup{
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        patterns = { 
            default = {
                'class',
                'function',
                'method',
                'for',
                'while',
                'if',
                'switch',
                'case',
                'interface',
                'struct',
                'enum',
            }
        }
    }
end }
