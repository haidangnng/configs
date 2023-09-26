local status, neorg = pcall(require, 'neorg')

if not status then
  print('Something went wrong:', neorg)
end

neorg.setup {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          self_notes = "~/Desktop/self/notes",
          work_notes = "~/Desktop/work/notes",
          study_notes = "~/Desktop/study/notes",
        },
        default_workspace = "self_notes"
      },
    },
  },
}
