local overrides = require("core.config.ai.copilot")

local plugins = {
	-- file-tree
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

	-- "nvim-tree/nvim-tree.lua",
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		config = function()
			require("core.config.ui.nvim-web-devicons").setup()
		end,
	},
	-- statusline
	"nvim-lualine/lualine.nvim",

	-- highlight the same word
	"RRethy/vim-illuminate",

	"nvim-lua/plenary.nvim",

	-- syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
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
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- blankline when indenting
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		main = "ibl",
		opts = {},
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
		event = "VeryLazy",
		config = function()
			require("core.config.essentials.which-key").setup()
		end,
	},

	-- dashboard
	-- {
	-- 	"goolord/alpha-nvim",
	-- 	config = function()
	-- 		require("core.config.ui.alpha").setup()
	-- 	end,
	-- },

	-- comments gcc gc...
	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		config = function()
			require("Comment").setup()
		end,
	},

	-- telescope
	"nvim-telescope/telescope-ui-select.nvim",
	event = "VeryLazy",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- autopairs () {} [] '' "" ``
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	-- terminal
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		tag = "*",
		config = "*",
		keys = {
			{
				"<C-\\>",
				"<cmd>ToggleTerm size=40 direction=float<cr>",
				desc = "Open a floating terminal at the Desktop directory",
			},
		},
	},

	-- harpoon
	{
		"ThePrimeagen/harpoon",
		event = "BufRead",
	},

    -- dart
    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        config = true,
    },

    -- golang
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
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()',
	},

	-- change how things look
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- git
	{
		"kdheepak/lazygit.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- lsp
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	"onsails/lspkind.nvim",
	"L3MON4D3/LuaSnip",

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"tsserver",
				"gopls",
				"rust_analyzer",
				"html",
				"pyright",
				"codelldb",
				"delve",
				"goimports",
				"gofumpt",
				"golines",
				"prettierd",
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},

	-- colors
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufRead",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- formatter
	{
		"nvimtools/none-ls.nvim",
		event = "BufRead",
		ft = "go",
		opts = function()
			return require("core.config.essentials.none-ls")
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
		"mrcjkb/rustaceanvim",
		version = "^3",
		ft = { "rust" },
	},

	-- Dap
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("core.config.dap.js")
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
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
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
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
		event = "VeryLazy",
		config = true,
		cmd = "Glow",
	},

	-- undo tree
	"mbbill/undotree",

    -- tmux
    "christoomey/vim-tmux-navigator"
}

local custom = require("custom.override")
if custom.plugins then
	for _, plugin in ipairs(custom.plugins) do
		table.insert(plugins, plugin)
	end
end

local opts = {}

return plugins, opts

