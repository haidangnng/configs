return {
  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",
    opts = {
      keymap = {
        ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },

        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
      },

      sources = {
        -- min_keyword_length = 3,
      },

      completion = {
        -- Show documentation when selecting a completion item
        documentation = { auto_show = true, auto_show_delay_ms = 1000 },

        list = {
          selection = function(ctx) return ctx.mode == 'cmdline' and 'auto_insert' or 'preselect' end,
          cycle = {
            from_bottom = true,
            from_top = true,
          },
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
