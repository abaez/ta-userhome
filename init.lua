--- default initializer
-- @author [Alejandro Baez](https://twitter.com/a_baez)
-- @copyright 2015
-- @license MIT (see LICENSE)
-- @module init

--- ## Package Modules
_M.ctags = require("ctags")
local hastebin  = require("hastebin")
local textredux = require("textredux")

--- ## Extending Modules
require("common") -- extra functions or modules to make textadept greater. ;)
require("extend") -- holds all language configuration extensions

--- ## Userhome Modules
require("global") -- global configured constants for other modules to read.
require("extensions") -- holds all extra extensions to read
require("keymap") -- main keymaps for textadept from modules

--[[ textadept-vi for curses
if CURSES then
  local tavi = _USERHOME .. "/modules/vi"
  package.path = tavi .. "/?.lua;" .. package.path
  package.cpath = tavi .. "/?.so;" .. package.cpath
  _G.vi_mode = require('vi_mode')
end
--]]

--- ## Module Settings
-- textredux configuration
textredux.hijack()

--- ## Default Settings
-- ui configurations
ui.tabs = false -- always hides the tabs

-- editing settings
textadept.editing.AUTOPAIR = true
textadept.editing.TYPEOVER_CHARS = true
textadept.editing.STRIP_TRAILING_SPACES = true
textadept.editing.AUTOCOMPLETE_ALL = false

--- ## Project build commands
textadept.run.build_commands["lakefile"] = "lake"
