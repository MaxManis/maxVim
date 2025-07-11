return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "hrsh7th/cmp-buffer",
  },
  {
    "tzachar/cmp-ai",
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  -- NOTE: cmp_ai config:
  -- {
  -- 	"tzachar/cmp-ai",
  -- 	config = function()
  -- 		local cmp_ai = require("cmp_ai.config")

  -- 		cmp_ai:setup({
  -- 			max_lines = 100,
  -- 			provider = "Ollama",
  -- 			provider_options = {
  -- 				model = "qwen2.5-coder:1.5b",
  -- 				auto_unload = true, -- Set to true to automatically unload the model when exiting nvim.
  -- 				prompt = function(lines_before, lines_after)
  -- 					-- You may include filetype and/or other project-wise context in this string as well.
  -- 					-- Consult model documentation in case there are special tokens for this.
  -- 					return "<|fim_prefix|>" .. lines_before .. "<|fim_suffix|>" .. lines_after .. "<|fim_middle|>"
  -- 				end,
  -- 			},
  -- 			notify = true,
  -- 			notify_callback = function(msg)
  -- 				vim.notify(msg)
  -- 			end,
  -- 			run_on_every_keystroke = false,
  -- 			ignored_file_types = {
  -- 				-- default is not to ignore
  -- 				-- uncomment to ignore in lua:
  -- 				-- lua = true,
  -- 			},
  -- 		})
  -- 	end,
  -- },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "tzachar/cmp-ai" },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Replace })
              --       -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
              --       -- this way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
              --elseif luasnip.has_words_before() then
              --	cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          -- NOTE: cmp_ai trigger:
          -- ["<C-x>"] = cmp.mapping(
          --   cmp.mapping.complete({
          --     config = {
          --       sources = cmp.config.sources({
          --         { name = "cmp_ai" },
          --       }),
          --     },
          --   }),
          --   { "i" }
          -- ),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          --{ name = 'vsnip' }, -- For vsnip users.
          { name = "luasnip" }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
          -- { name = 'cmp_ai' }, -- For AI completion with cmp_ai.
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
