local ready, dashboard = pcall(require, "dashboard")

if not ready then
  return
end

dashboard.setup({
    theme = 'hyper',
    config = {
      -- week_header = {
      --   "enable",  --boolean use a week header
      --   -- concat  --concat string after time string line
      --   "append" --table append after time string line
      -- },
      header = {
          "    ██████╗ ██╗     ███╗   ███╗ █████╗  ██████╗ ███████╗████████╗███████╗██████╗ ",
          "   ██╔═══██╗██║     ████╗ ████║██╔══██╗██╔═══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗",
          "   ██║   ██║██║     ██╔████╔██║███████║██║   ██║███████╗   ██║   █████╗  ██████╔╝",
          "   ██║   ██║██║     ██║╚██╔╝██║██╔══██║██║   ██║╚════██║   ██║   ██╔══╝  ██╔══██╗",
          "   ╚██████╔╝███████╗██║ ╚═╝ ██║██║  ██║╚██████╔╝███████║   ██║   ███████╗██║  ██║",
          "    ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝",
          "                                                                              ",
          "                                                                                 ",
          "                                                                                 ",
        },
      packages = { enable = true }, -- show how many plugins neovim loaded
      -- limit how many projects list, action when you press key or enter it will run this action.
      -- action can be a functino type, e.g.
      -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
      project = { enable = true, limit = 10, icon = '󰷏  ', label = 'Recent projects', action = 'Telescope find_files cwd=' },
      mru = false,
      footer = {"Yooooooooo"}, -- footer
      shortcut = {
        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
      },
    },
  })

