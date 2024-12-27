return {
  {
    "echasnovski/mini.pairs",
    event = 'InsertEnter',
    version = "*",
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "echasnovski/mini.comment",
    event = 'UIEnter',
    version = "*",
    config = function()
      require("mini.comment").setup()
    end,
  },
  {
    "echasnovski/mini.indentscope",
    event = 'UIEnter',
    version = "*",
    config = function()
      require("mini.indentscope").setup()
    end,
  },
  {
    "echasnovski/mini.surround",
    version = "*",
    event = 'UIEnter',
    config = function()
      require("mini.surround").setup()
    end,
  },
  {
    "echasnovski/mini.bufremove",
    version = "*",
    config = function()
      require("mini.bufremove").setup()
    end,
  },
  {
    "echasnovski/mini.jump",
    version = "*",
    event = 'UIEnter',
    config = function()
      require("mini.jump").setup()
    end,
  },
  {
    "echasnovski/mini.icons",
    version = "*",
    config = function()
      require("mini.icons").setup()
    end,
  },
}
