return {
    "nvim-treesitter/nvim-treesitter", 
		build = ":TSUpdate",
    config = 
		function()
				local configs = require("nvim-treesitter.configs")

				--configs.setup({
				    --ensure_installed = {},
                    --sync_install = true,
				    --highlight = { enable = false},
				    --indent = { enable = false },  
				--})
    end
}
