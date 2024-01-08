local overrides = require("core.config.ai.copilot")

local plugins = {
	-- file-tree
	'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
	-- statusline
	'nvim-lualine/lualine.nvim',

	-- highlight the same word
	'RRethy/vim-illuminate',

	'nvim-lua/plenary.nvim',

	-- syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	-- bufferline
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require("core.config.ui.bufferline").setup()
		end
	},

	-- colorscheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},

	-- diagnostics
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- blankline when indenting
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {}
	},

	-- copilot
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		opts = overrides.copilot,
	},

	-- which-key
  {
    "folke/which-key.nvim",
    config = function()
			require("core.config.essentials.which-key").setup()
    end
  },

	-- dashboard
	{
		'goolord/alpha-nvim',
    config = function ()
			require("core.config.ui.alpha").setup()
    end
	},

	-- comments gcc gc...
  {
		'numToStr/Comment.nvim',
		config = function()
      require('Comment').setup()
    end
  },

	-- telescope
	'nvim-telescope/telescope-ui-select.nvim',
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { {"nvim-lua/plenary.nvim"} }
  },

	-- autopairs () {} [] '' "" ``
	{
		"windwp/nvim-autopairs",
    config = function()
			require("nvim-autopairs").setup {}
		end
	},

	-- terminal
	{
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = "*",
		keys = {
			{
				"<C-\\>", "<cmd>ToggleTerm size=40 direction=float<cr>", desc = "Open a floating terminal at the Desktop directory",
			},
		},
	},

	-- check https://github.com/kylechui/nvim-surround for keybindings
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	-- harpoon
	{
		"ThePrimeagen/harpoon",
	},
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = {"CmdlineEnter"},
		ft = {"go", 'gomod'},
		build = ':lua require("go.install").update_all_sync()',
	},

	-- change how things look
	{
		'stevearc/dressing.nvim',
		opts = {},
	},

	-- git
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	},

	-- lsp
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',
	'onsails/lspkind.nvim',
  'L3MON4D3/LuaSnip',

  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },

	-- colors
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- formatter
	{
		"nvimtools/none-ls.nvim",
		ft = "go",
		event = "VeryLazy",
		opts = function()
			return require("core.config.essentials.none-ls")
		end,
	},

	{
		"aznhe21/actions-preview.nvim",
		config = function()
			vim.keymap.set({ "v", "n" }, "<leader>cs", require("actions-preview").code_actions)
		end,
	},

	{
		"vrischmann/tree-sitter-templ",
		event = "BufRead",
		config = function()
			require("core.config.essentials.treesitter")
		end,
	},


	{
		"folke/noice.nvim",
		event = "VeryLazy",

		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				config = function()
					require("core.config.ui.notify").setup()
				end,
			},
		},

		config = function()
			require("noice").setup({
				views = {
					cmdline_popup = {
						position = {
							row = 5,
							col = "50%",
						},
						size = {
							width = 60,
							height = "auto",
						},
					},
					popupmenu = {
						relative = "editor",
						position = {
							row = 8,
							col = "50%",
						},
						size = {
							width = 60,
							height = 10,
						},
						border = {
							style = "rounded",
							padding = { 0, 1 },
						},
						win_options = {
							winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
						},
					},
				},
			})
			-- require("noice").setup({
			-- 	cmdline = {
			-- 		view = "cmdline",
			-- 		format = {
			-- 			search_down = {
			-- 				view = "cmdline",
			-- 			},
			-- 			search_up = {
			-- 				view = "cmdline",
			-- 			},
			-- 		},
			-- 	},
			-- 	lsp = {
			-- 		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			-- 		override = {
			-- 			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			-- 			["vim.lsp.util.stylize_markdown"] = true,
			-- 			["cmp.entry.get_documentation"] = true,
			-- 		},
			-- 	},
			-- 	-- you can enable a preset for easier configuration
			-- 	presets = {
			-- 		bottom_search = true, -- use a classic bottom cmdline for search
			-- 		command_palette = true, -- position the cmdline and popupmenu together
			-- 		long_message_to_split = true, -- long messages will be sent to a split
			-- 		inc_rename = false, -- enables an input dialog for inc-rename.nvim
			-- 		lsp_doc_border = false, -- add a border to hover docs and signature help
			-- 	},
			-- })
		end,
	},
}

local opts = {}

return plugins, opts
