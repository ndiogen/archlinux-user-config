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
end }
