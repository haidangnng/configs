return {
  --- HTML EMMET ---
  {
    "mattn/emmet-vim",
    event = { "BufRead" },
    init = function()
      vim.g.user_emmet_leader_key = "f"
      vim.g.user_emmet_mode = "n"
      vim.g.user_emmet_settings = {
        variables = { lang = "ja" },
        javascript = {
          extends = "jsx",
        },
        html = {
          default_attributes = {
            option = { value = vim.null },
            textarea = {
              id = vim.null,
              name = vim.null,
              cols = 10,
              rows = 10,
            },
          },
          snippets = {
            ["!"] = "<!DOCTYPE html>\n"
              .. '<html lang="en">\n'
              .. "<head>\n"
              .. '\t<meta charset="${charset}">\n'
              .. '\t<meta name="viewport" content="width=device-width, initial-scale=1.0">\n'
              .. '\t<meta http-equiv="X-UA-Compatible" content="ie=edge">\n'
              .. "\t<title></title>\n"
              .. "</head>\n"
              .. "<body>\n\t${child}|\n</body>\n"
              .. "</html>",
          },
        },
      }
    end,
  },

  --- AUTO TAGS PAIRS ---
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },

  --- COMMENTS ---
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
        end,
      }
      -- hooks = {
      --   pre = function()
      --     require("ts_context_commentstring.internal").update_commentstring({})
      --   end,
      -- },
    },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },

  --- AUTO TAGS BUT FOR TS (REACT/SVELTE)---
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "rust",
      "svelte",
      "tsx",
      "jsx",
      "xml",
    },
    opts = {
      enable = true,
      filetypes = {
        "html",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "vue",
        "tsx",
        "jsx",
        "xml",
        "rust",
      },
    },
  },

  --- SURROUND TAGS SHORTCUTS ---
	{
    'echasnovski/mini.surround', version = false, config = function ()
      require('mini.surround').setup()
    end
  },
  {
    -- "kevinhwang91/nvim-ufo",
    -- event = { "BufReadPost", "BufNewFile" },
    -- dependencies = { "kevinhwang91/promise-async", event = "BufReadPost" },
    -- opts = {
    --   fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
    --     local newVirtText = {}
    --     local suffix = ("  … %d "):format(endLnum - lnum)
    --     local sufWidth = vim.fn.strdisplaywidth(suffix)
    --     local targetWidth = width - sufWidth
    --     local curWidth = 0
    --     for _, chunk in ipairs(virtText) do
    --       local chunkText = chunk[1]
    --       local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    --       if targetWidth > curWidth + chunkWidth then
    --         table.insert(newVirtText, chunk)
    --       else
    --         chunkText = truncate(chunkText, targetWidth - curWidth)
    --         local hlGroup = chunk[2]
    --         table.insert(newVirtText, { chunkText, hlGroup })
    --         chunkWidth = vim.fn.strdisplaywidth(chunkText)
    --         -- str width returned from truncate() may less than 2nd argument, need padding
    --         if curWidth + chunkWidth < targetWidth then
    --           suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
    --         end
    --         break
    --       end
    --       curWidth = curWidth + chunkWidth
    --     end
    --     table.insert(newVirtText, { suffix, "MoreMsg" })
    --     return newVirtText
    --   end,
    --   open_fold_hl_timeout = 0,
    -- },
    -- keys = {
    --   { "fd", "zd", desc = "Delete fold under cursor" },
    --   { "fo", "zo", desc = "Open fold under cursor" },
    --   { "fO", "zO", desc = "Open all folds under cursor" },
    --   { "fc", "zC", desc = "Close all folds under cursor" },
    --   { "fa", "za", desc = "Toggle fold under cursor" },
    --   { "fA", "zA", desc = "Toggle all folds under cursor" },
    --   { "fv", "zv", desc = "Show cursor line" },
    --   {
    --     "fM",
    --     function()
    --       require("ufo").closeAllFolds()
    --     end,
    --     desc = "Close all folds",
    --   },
    --   {
    --     "fR",
    --     function()
    --       require("ufo").openAllFolds()
    --     end,
    --     desc = "Open all folds",
    --   },
    --   { "fm", "zm", desc = "Fold more" },
    --   { "fr", "zr", desc = "Fold less" },
    --   { "fx", "zx", desc = "Update folds" },
    --   { "fz", "zz", desc = "Center this line" },
    --   { "ft", "zt", desc = "Top this line" },
    --   { "fb", "zb", desc = "Bottom this line" },
    --   { "fg", "zg", desc = "Add word to spell list" },
    --   { "fw", "zw", desc = "Mark word as bad/misspelling" },
    --   { "fe", "ze", desc = "Right this line" },
    --   { "fE", "zE", desc = "Delete all folds in current buffer" },
    --   { "fs", "zs", desc = "Left this line" },
    --   { "fH", "zH", desc = "Half screen to the left" },
    --   { "fL", "zL", desc = "Half screen to the right" },
    -- },
  }
}
