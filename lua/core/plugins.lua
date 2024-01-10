local overrides = require("core.config.ai.copilot")

local plugins = {
	-- file-tree
	'nvim-tree/nvim-tree.lua',
	-- {
 --    "nvim-neo-tree/neo-tree.nvim",
 --    branch = "v3.x",
 --    dependencies = {
 --      "nvim-lua/plenary.nvim",
 --      "nvim-tree/nvim-web-devicons",
 --      "MunifTanjim/nui.nvim",
 --    }
	-- },
	{
		'nvim-tree/nvim-web-devicons',
		config = function()
			require("core.config.ui.nvim-web-devicons").setup()
		end,
	},
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
    dependencies = { "nvim-lua/plenary.nvim" },
  },

	-- autopairs () {} [] '' "" ``
	{
		"windwp/nvim-autopairs",
    config = function()
			require("nvim-autopairs").setup()
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

	-- better code actions
	{
		"aznhe21/actions-preview.nvim",
		config = function()
			vim.keymap.set({ "v", "n" }, "<leader>cs", require("actions-preview").code_actions)
		end,
	},

	-- templ
	{
		"vrischmann/tree-sitter-templ",
		event = "BufRead",
		config = function()
			require("core.config.essentials.treesitter")
		end,
	},


	-- new cmdline and a new messages (error, warning, info)
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
			require("core.config.ui.noice").setup()
		end,
	},

	-- rust
	{
		'mrcjkb/rustaceanvim',
		version = '^3',
		ft = { 'rust' },
	},

	-- Dap
	{
		"mfussenegger/nvim-dap",
	},

	{
		"rcarriga/nvim-dap-ui",
		deps = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("dapui").setup()
			local dap = require("dap")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				require("dapui").open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				require("dapui").close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				require("dapui").close()
			end

		end,
	},

	{
		'theHamsta/nvim-dap-virtual-text',
		config = function()
			require('nvim-dap-virtual-text').setup()
		end,
	},

	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = {
			"mfussenegger/nvim-dap",
		},

		config = function()
			require("dap-go").setup({
				dap_configurations = {
					{
						type = "go",
						name = "Attach remote",
						mode = "remote",
						request = "attach",
					},
				},

				delve = {
					path = "dlv",
					initialize_timeout_sec = 20,
					port = 6009,
					args = {},
					build_flags = "",
				},
			})
		end,
	},

	-- markdown
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow"
	},

	-- icons
	{
		"ziontee113/icon-picker.nvim",
		config = function()
			require("icon-picker").setup({ disable_legacy_commands = true })

			local opts = { noremap = true, silent = true }

			vim.keymap.set("n", "<leader>ic", "<cmd>IconPickerNormal<cr>", opts)
			vim.keymap.set("n", "<Leader>yc", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
			vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
		end,
	},
}

local custom = require("custom.override")
if custom.plugins then
	for _, plugin in ipairs(custom.plugins) do
		table.insert(plugins, plugin)
	end
end

local opts = {}

return plugins, opts
