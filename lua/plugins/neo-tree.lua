return
{
		"nvim-neo-tree/neo-tree.nvim", 
		branch = "v3.x",
		dependencies = {
		    "nvim-lua/plenary.nvim",
		    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
				-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },

		config = 
		function()   
            require('neo-tree').setup{

                filesystem = {
                    filtered_items = 
                    {
                        visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
                        hide_dotfiles = false,
                        hide_gitignored = true,
                    }

                },
                mappings = 
                {
                ["h"] = function(state)
  local node = state.tree:get_node()
    if node.type == 'directory' and node:is_expanded() then
      require'neo-tree.sources.filesystem'.toggle_directory(state, node)
    else
      require'neo-tree.ui.renderer'.focus_node(state, node:get_parent_id())
    end
  end,
["l"] = function(state)
  local node = state.tree:get_node()
    if node.type == 'directory' then
      if not node:is_expanded() then
        require'neo-tree.sources.filesystem'.toggle_directory(state, node)
      elseif node:has_children() then
        require'neo-tree.ui.renderer'.focus_node(state, node:get_child_ids()[1])
      end
    end
  end,
                }
                
            }

          end,
}


