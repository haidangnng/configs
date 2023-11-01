local status, swenv = pcall(require, "swenv")
local api_status, api = pcall(require, "swenv.api")

if not status then
  return
end

if not api_status then
  return
end

local opts = {
  get_venvs = function (venvs_path)
    return api.get_venvs(venvs_path)
  end,

  venvs_path = vim.fn.expand("~/venvs"),
  post_set_venv = function ()
    vim.cmd("LspRestart")
  end

}

swenv.setup(opts)

