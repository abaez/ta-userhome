--- default initializer
-- @author [Alejandro Baez](https://twitter.com/a_baez)
-- @copyright 2015
-- @license MIT (see LICENSE)
-- @module init

---[=[ global pre-module settings

-- themer
CURRENT_FONT = "Fantasque Sans Mono"
CURRENT_FONTSIZE = 13
CURRENT_THEME = "base16-atelierlakeside-light"
--CURRENT_BACKGROUND = "-light"

-- languages
_G._RUSTFMT = true -- enable rustfmt
--]=]

---[=[ modules

require("extensions") -- holds all extra extensions to read
_M.ctags = require("ctags")
require("common")
require("hastebin")
local textredux = require("textredux")

--[[ textadept-vi for curses
if CURSES then
  local tavi = _USERHOME .. "/modules/vi"
  package.path = tavi .. "/?.lua;" .. package.path
  package.cpath = tavi .. "/?.so;" .. package.cpath
  _G.vi_mode = require('vi_mode')
end
--]]
--]=]


---[=[ module settings

-- textredux configuration
textredux.hijack()
--]=]


---[=[ default settings

-- ui configurations
ui.tabs = false -- always hides the tabs

-- editing settings
textadept.editing.AUTOPAIR = true
textadept.editing.TYPEOVER_CHARS = true
textadept.editing.STRIP_TRAILING_SPACES = true
textadept.editing.AUTOCOMPLETE_ALL = false
--]=]

---[=[ keys

keys.co = textredux.fs.open_file

-- opens files in directory.
keys["cp"] = {function()
  return textredux.fs.snapopen(
    (buffer.filename or ''):match('^.+[//]'))
end}
keys["cu"] = {function() return textredux.fs.snapopen(_USERHOME)end}
keys["cE"] = textadept.editing.select_paragraph
keys["cP"] = textadept.menu.select_command
keys["cC"] = {textadept.snippets._cancel_current}
keys["aV"] = {function()
  local tavi = _USERHOME .. "/modules/vi"
  package.path = tavi .. "/?.lua;" .. package.path
  package.cpath = tavi .. "/?.so;" .. package.cpath
  _G.vi_mode = require('vi_mode')
end}

-- makes a new file with location
keys['can'] = function()
  io.open_file(ui.dialogs.filesave{
    with_directory = (buffer.filename or ''):match('^.+[//]')
  })
end

-- ctags module keys
keys['a&'] = _M.ctags.goto_tag
keys['a,'] = {_M.ctags.goto_tag, nil, true} -- back
keys['a.'] = {_M.ctags.goto_tag, nil, false} -- forward
keys['ac'] = {textadept.editing.autocomplete, 'ctag'}

--[[
local ui_ce = ui.command_entry
keys['ce'] = {ui_ce.enter_mode, 'lua_command'}
keys.lua_command = {
  ['\t'] = ui_ce.complete_lua,
  ['\n'] = {ui_ce.finish_mode, ui_ce.execute_lua}
} --]]

-- next and previous view
local view_next, view_prev = {ui.goto_view, 1, true},
                             {ui.goto_view, -1, true}

if not CURSES then
  keys[not OSX and 'an' or 'ca\t'] = view_next
  keys[not OSX and 'ap' or 'cas\t'] = view_prev
end
--]=]
