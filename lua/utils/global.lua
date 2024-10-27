-- Global functions--

function _G.pRequire(name)
  local status_ok, plugin = pcall(require, name)
  if not status_ok then
    vim.notify(" Can't find: " .. name)
    return nil
  end
  return plugin
end
