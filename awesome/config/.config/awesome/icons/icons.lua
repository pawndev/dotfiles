local gears = require("gears")
-- Variables that hold paths to various icons
local icons = {}
-- Set icon path prefix
local i = gears.filesystem.get_configuration_dir() .. "icons/"

icons.archlabs = i .. "archlabs.png"
icons.pikachu = i .. "pikachu.png"
icons.web_browser = i .. "web_browser.svg"
icons.camera = i .. "camera.svg"

return icons
--   
