-- 1. bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- 2. setup lazy.nvim
require("lazy").setup({
	{ "phaazon/hop.nvim" },
	{ "nvim-tree/nvim-tree.lua" },
	{ "nvim-tree/nvim-web-devicons" },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "neovim/nvim-lspconfig",
        dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path', 'hrsh7th/nvim-cmp', 'hrsh7th/cmp-cmdline' },
	},
    {'hrsh7th/cmp-nvim-lsp-signature-help'},
	{
        'linrongbin16/lsp-progress.nvim',
        event = {'VimEnter'},
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function()
			require('lsp-progress').setup()
		end
    },
    {"williamboman/mason.nvim"},
	{'nvim-telescope/telescope.nvim', branch = '0.1.x',
    	dependencies = { 'nvim-lua/plenary.nvim' }
    },
	{'lewis6991/gitsigns.nvim'},
    {'windwp/nvim-autopairs'},
    {'terrortylor/nvim-comment'},
    {
		'nvim-lualine/lualine.nvim',
        dependencies = {
			'nvim-tree/nvim-web-devicons',
			'dokwork/lualine-ex',
			'linrongbin16/lsp-progress.nvim'
		},
	},
	{ 'akinsho/toggleterm.nvim',
		version = "*", config = true, },
	{
	  "folke/which-key.nvim",
	  event = "VeryLazy",
	  opts = {},
	  keys = {
		{
		  "<leader>?",
		  function()
			require("which-key").show({ global = false })
		  end,
		  desc = "Buffer Local Keymaps (which-key)",
		},
	  },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
			'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			animation = true,
			insert_at_start = true,
			icons = {
				separator_at_end = false,
			},
		},
		version = '^1.0.0', -- optional: only update when a new 1.x version is released
	},
    {'jose-elias-alvarez/null-ls.nvim'},
	{ 'fedepujol/move.nvim',
		opts = {}
	},
	{
		"saifulapm/commasemi.nvim",
		lazy = false,
		opts = {
			leader = "<localleader>",
			keymaps = true,
			commands = true
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = {
			"MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"
		},
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	{ "f3fora/cmp-spell" },
	{
		'Wansmer/langmapper.nvim',
		lazy = false,
		priority = 1, -- High priority is needed if you will use `autoremap()`
		config = function()
			require('langmapper').setup({--[[ your config ]]})
		end,
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {
			smear_between_buffers = true,
			smear_between_neighbor_lines = true,
			min_horizontal_distance_smear = 30, 
			min_vertical_distance_smear = 5,
			scroll_buffer_space = true,
			legacy_computing_symbols_support = false,
			smear_insert_mode = false,
		}
	},
	{ 'echasnovski/mini.nvim', version = false }, -- default config doesn't need `setup()`
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		---@module 'noice'
		dependencies = {
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
		  library = {
			-- See the configuration section for more details
			-- Load luvit types when the `vim.uv` word is found
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		  },
		},
	},
	{ -- optional cmp completion source for require statements and module annotations
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
		  opts.sources = opts.sources or {}
		  table.insert(opts.sources, {
			name = "lazydev",
			group_index = 0, -- set group index to 0 to skip loading LuaLS completions
		  })
		end,
	},
	{ -- optional blink completion source for require statements and module annotations
		"saghen/blink.cmp",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			fuzzy = { implementation = "lua" },
			sources = {
				-- add lazydev to your completion providers
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},
	{ "sindrets/diffview.nvim"},
	{
		"nvzone/typr",
		dependencies = "nvzone/volt",
		opts = {},
		cmd = { "Typr", "TyprStats" },
	},
	{
	  "princejoogie/chafa.nvim",
	  dependencies = {
		"nvim-lua/plenary.nvim",
		"m00qek/baleia.nvim"
	  },
	},
	{ "typicode/bg.nvim", lazy = false },
})

