--print("hello from root init lua")
if vim.g.init_loaded then
  return
end
vim.g.init_loaded = true
require("core")
