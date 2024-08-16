return {
    'nvim-telescope/telescope-project.nvim',
    requires = { {'nvim-telescope/telescope.nvim'} },

    config = function()
        require('telescope').setup{
        defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
        },
        pickers = {
         -- Default configuration for builtin pickers goes here:
            -- picker_name = {
        --   picker_config_key = value,
           --   ...
        -- }
        },
        extensions = {
        project = {
            base_dirs = {
                '~/projects',
                {'~/work', max_depth = 2},
            },
            hidden_files = true, -- default: false
            theme = "dropdown",
            order_by = "asc",
            sync_with_nvim_tree = true, -- default false
            }
        }
        }
    end
}
