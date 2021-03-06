--- default initializer
-- @author [Alejandro Baez](https://twitter.com/a_baez)
-- @copyright 2015
-- @license MIT (see LICENSE)
-- @module init

--- ## Package Modules
_M.ctags = require("ctags")
textredux = require("textredux") -- using global due to calls on keymap
relative = require("relative")
require("vim-adept")

--[[ textadept-vi for curses
if CURSES then
  textredux = require("textredux-vi")

  local tavi = _USERHOME .. "/modules/vi"
  package.path = tavi .. "/?.lua;" .. package.path
  package.cpath = tavi .. "/?.so;" .. package.cpath
  _G.vi_mode = require('vi_mode')
end
--]]

--- ## Userhome Modules
require("global") -- global configured constants for other modules to read.
require("extensions") -- holds all extra extensions to read
require("keymap") -- main keymaps for textadept from modules

--- ## Extending Modules
require("common") -- common functions or modules to make textadept greater. ;)
require("extra") -- holds all language configuration extensions


--- ## Module Settings
-- textredux configuration
textredux.hijack()

--- ## Default Settings
-- ui configurations
ui.tabs = false -- always hides the tabs

-- editing settings
-- textadept.editing.auto_pairs = {}
--textadept.editing.typeover_chars = {}
textadept.editing.strip_trailing_spaces = true
textadept.editing.autocomplete_all_words = false

--- ## Project build commands
textadept.run.build_commands["lakefile"] = "lake"
