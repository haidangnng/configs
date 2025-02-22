-- TODO: update workspaces keybinding
local wezterm = require("wezterm")
local act = wezterm.action
local util = require("utils")

local kill_workspace = function(workspace)
  local success, stdout = wezterm.run_child_process({ "/opt/homebrew/bin/wezterm", "cli", "list", "--format=json" })

  if success then
    local json = wezterm.json_parse(stdout)
    if not json then
      return
    end

    local workspace_panes = util.filter(json, function(p)
      return p.workspace == workspace
    end)

    for _, p in ipairs(workspace_panes) do
      wezterm.run_child_process({
        "/opt/homebrew/bin/wezterm",
        "cli",
        "kill-pane",
        "--pane-id=" .. p.pane_id,
      })
    end
  end
end

local key_tables = {
  resize_pane = {
    { key = "h", action = act.AdjustPaneSize({ "Left", 5 }) },
    { key = "j", action = act.AdjustPaneSize({ "Down", 5 }) },
    { key = "k", action = act.AdjustPaneSize({ "Up", 5 }) },
    { key = "l", action = act.AdjustPaneSize({ "Right", 5 }) },
    { key = "q", action = "PopKeyTable" },
  },
  workspace = {
    {
      key = "s",
      action = act.ShowLauncherArgs({
        flags = "FUZZY|WORKSPACES",
      }),
    },
    {
      key = "n",
      action = act.PromptInputLine({
        description = wezterm.format({
          { Attribute = { Intensity = "Bold" } },
          { Foreground = { AnsiColor = "Fuchsia" } },
          { Text = "Enter name for new workspace" },
        }),
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            window:perform_action(
              act.SwitchToWorkspace({
                name = line,
              }),
              pane
            )
          end
        end),
      }),
    },
    {
      key = "k",
      action = wezterm.action_callback(function(window)
        local w = window:active_workspace()
        kill_workspace(w)
      end),
    },
  },
}

return key_tables
