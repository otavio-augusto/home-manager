return {
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		lazy = false,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			path = "append",
		},
	},
	{ "VonHeikemen/lsp-zero.nvim", branch = "v4.x" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				nix = { "alejandra" },
				sh = { "shfmt" },
				lua = { "stylua" },
			},
		},
	},
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		ft = { "org" },
		config = function()
			-- Setup orgmode
			require("orgmode").setup({
				org_agenda_files = "~/orgfiles/**/*",
				org_default_notes_file = "~/orgfiles/refile.org",
			})

			-- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
			-- add ~org~ to ignore_install
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				ignore_install = { "org" },
			})
		end,
	},
	{
		"chipsenkbeil/org-roam.nvim",
		tag = "0.1.0",
		dependencies = {
			{
				"nvim-orgmode/orgmode",
				tag = "0.3.4",
			},
		},
		config = function()
			require("org-roam").setup({
				directory = "~/org_roam_files",
				-- optional
				org_files = {
					"~/another_org_dir",
					"~/some/folder/*.org",
					"~/a/single/org_file.org",
				},
			})
		end,
	},
	{ "nvim-tree/nvim-web-devicons" },
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "quarto" },
		opts = {},
		config = function()
			require("render-markdown").enable()
			require("render-markdown").setup({
				render_modes = { "n", "c" },
				bullet = {
					enabled = true,
					icons = { "", "◆" },
					left_pad = 0,
					right_pad = 0,
					highlight = "RenderMarkdownBullet",
				},
				heading = {
					enabled = true,
					sign = true,
					position = "overlay",
					icons = {
						"󰝤 ",
						"󰝤󰝤 ",
						"󰝤󰝤󰝤 ",
						"󰝤󰝤󰝤󰝤 ",
						"󰝤󰝤󰝤󰝤󰝤 ",
						"󰝤󰝤󰝤󰝤󰝤󰝤 ",
					},
					width = "full",
					left_margin = 0,
					left_pad = 0,
					right_pad = 0,
					min_width = 0,
					border = false,
					border_virtual = false,
					border_prefix = false,
					above = "▄",
					below = "▀",
					backgrounds = {
						"RenderMarkdownH1Bg",
						"RenderMarkdownH2Bg",
						"RenderMarkdownH3Bg",
						"RenderMarkdownH4Bg",
						"RenderMarkdownH5Bg",
						"RenderMarkdownH6Bg",
					},
					foregrounds = {
						"RenderMarkdownH1",
						"RenderMarkdownH2",
						"RenderMarkdownH3",
						"RenderMarkdownH4",
						"RenderMarkdownH5",
						"RenderMarkdownH6",
					},
				},
			})
		end,
		--dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	},
}
