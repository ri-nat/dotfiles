require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            'node_modules',
            'target',
            'dist',
            'build',
            'vendor',
            'Cargo.lock',
            'yarn.lock',
            'package-lock.json',
            'go/.sum',
            '.git',
            '.idea',
            '.DS_Store',
        },
    },

    extensions = {
        ['ui-select'] = {
            require('telescope.themes').get_dropdown {
                -- even more opts
            }
        }
    },

    pickers = {
        live_grep = {
            additional_args = function(_opts)
                return { '--hidden' }
            end
        },
    },
}

require('telescope').load_extension('ui-select')
