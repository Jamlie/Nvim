local plugins = {
	{
		'navarasu/onedark.nvim',
		config = function()
			require('onedark').setup({
				transparent = true,
			})
		end
	},
}

return plugins
