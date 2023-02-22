return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPre",
	dependencies = {
		"mrjones2014/nvim-ts-rainbow",
		"JoosepAlviste/nvim-ts-context-commentstring",
    "windwp/nvim-ts-autotag",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"RRethy/nvim-treesitter-textsubjects",
		{
			"m-demare/hlargs.nvim",
			config = function()
				require("hlargs").setup({ color = "#F7768E" })
			end,
		},
	},
	opts = {
		ensure_installed = { "lua", "vim", "regex", "typescript" }, -- one of "all", or a list of languages
		auto_install = true,
		ignore_install = { "haskell" }, -- list of parsers to ignore installing
    autotag = {
      enable = true,
    },
		highlight = {
			enable = true,
			-- disable = { "c", "rust" },  -- list of language that will be disabled
			-- additional_vim_regex_highlighting = false,
		},

		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<leader>gnn",
				node_incremental = "<leader>gnr",
				scope_incremental = "<leader>gne",
				node_decremental = "<leader>gnt",
			},
		},

		indent = {
			enable = true,
		},

		rainbow = {
			enable = true,
			extended_mode = true,
		},

		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},

		textobjects = {
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]]"] = "@function.outer",
					["]m"] = "@class.outer",
				},
				goto_next_end = {
					["]["] = "@function.outer",
					["]M"] = "@class.outer",
				},
				goto_previous_start = {
					["[["] = "@function.outer",
					["[m"] = "@class.outer",
				},
				goto_previous_end = {
					["[]"] = "@function.outer",
					["[M"] = "@class.outer",
				},
			},
			select = {
				enable = true,

				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,

				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["~"] = "@parameter.inner",
				},
			},
		},

		textsubjects = {
			enable = true,
			keymaps = {
				["<cr>"] = "textsubjects-smart", -- works in visual mode
			},
		},
	},
}
