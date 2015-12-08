--- default initializer
-- @author [Alejandro Baez](https://twitter.com/a_baez)
-- @copyright 2015
-- @license MIT (see LICENSE)
-- @module init

--- ## Global pre-module settings
-- themer
CURRENT_FONT = "Fantasque Sans Mono"
CURRENT_FONTSIZE = 13
CURRENT_THEME = "base16-atelierlakeside-light"
--CURRENT_BACKGROUND = "-light"

-- languages
_G._RUSTFMT = true  -- enable rustfmt
_G._PM      = false -- disable package manager. Default == true.


--- ## Modules
require("extensions") -- holds all extra extensions to read
_M.ctags = require("ctags")
require("common")
local textredux = require("textredux")

-- package manager modules
if _PM then
  require("hastebin")
end

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
keys.co = textredux.fs.open_file
-- opens files in directory.
keys["cp"] = {function()
  return textredux.fs.snapopen(
    (buffer.filename or ''):match('^.+[//]'))
end}
keys["cu"] = {function() return textredux.fs.snapopen(_USERHOME)end}


-- textadept-vi configuration
keys["aV"] = {function()
  local tavi = _USERHOME .. "/modules/vi"
  package.path = tavi .. "/?.lua;" .. package.path
  package.cpath = tavi .. "/?.so;" .. package.cpath
  _G.vi_mode = require('vi_mode')
end}

-- ctags module keys
keys['a&'] = _M.ctags.goto_tag
keys['a,'] = {_M.ctags.goto_tag, nil, true} -- back
keys['a.'] = {_M.ctags.goto_tag, nil, false} -- forward
keys['ac'] = {textadept.editing.autocomplete, 'ctag'}


--- ## Default Settings
-- ui configurations
ui.tabs = false -- always hides the tabs

-- editing settings
textadept.editing.AUTOPAIR = true
textadept.editing.TYPEOVER_CHARS = true
textadept.editing.STRIP_TRAILING_SPACES = true
textadept.editing.AUTOCOMPLETE_ALL = false

-- keys
keys["cE"] = textadept.editing.select_paragraph
keys["cP"] = textadept.menu.select_command
keys["cC"] = {textadept.snippets._cancel_current}

-- makes a new file with location
keys['can'] = function()
  io.open_file(ui.dialogs.filesave{
    with_directory = (buffer.filename or ''):match('^.+[//]')
  })
end

--[[ ui command entry
local ui_ce = ui.command_entry
keys['ce'] = {ui_ce.enter_mode, 'lua_command'}
keys.lua_command = {
  ['\t'] = ui_ce.complete_lua,
  ['\n'] = {ui_ce.finish_mode, ui_ce.execute_lua}
} --]]


--- connect view switch with buffer switch keys.
-- A pair of events for changing view or buffer with the same keys.
events.connect(events.VIEW_NEW, function()
  keys[not CURSES and 'an' or 'mn'] = {ui.goto_view, 1, true}
  keys[not CURSES and 'ap' or 'mp'] = {ui.goto_view, -1, true}
end)
events.connect(events.BUFFER_NEW, function()
  if #_VIEWS ~= 1 then return end
  keys[not CURSES and 'an' or 'mn'] = {view.goto_buffer, view, 1, true}
  keys[not CURSES and 'ap' or 'mp'] = {view.goto_buffer, view, -1, true}
end)
