-- enable vim mode.
--package.path = _USERHOME .. "/modules/textadept-vi/?.lua;" .. package.path
--package.cpath = _USERHOME .. "/modules/.textadept/textadept-vi/?.so;" .. package.cpath
--_G.vi_mode = require 'vi_mode'

local fn = require "common"

-- new lexer modules go here
textadept.file_types.extensions.rs = 'rust'
textadept.file_types.extensions.toml = 'toml'
textadept.file_types.extensions.yml = 'yaml'
for _, v in ipairs{'zshrc, zsh-theme', 'zsh', 'zshenv'} do
  textadept.file_types.extensions[v] = 'bash'
end

if not CURSES then
  ui.tabs = false -- always hides the tabs

--  textadept.editing.INDIC_BRACEMATCH
  textadept.editing.AUTOPAIR = true
  textadept.editing.TYPEOVER_CHARS = true
  textadept.editing.STRIP_TRAILING_SPACES = true
  textadept.editing.AUTOCOMPLETE_ALL = false
end

events.connect(events.INITIALIZED, function()
  textredux = require 'textredux'
  textredux.hijack()

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
    local tavi = _USERHOME .. "/modules/textadept-vi"
    package.path = tavi .. "/?.lua;" .. package.path
    package.cpath = tavi .. "/?.so;" .. package.cpath
    _G.vi_mode = require 'vi_mode'
  end}

  local ui_ce = ui.command_entry
  keys['ce'] = {ui_ce.enter_mode, 'lua_command'}
  keys.lua_command = {
    ['\t'] = ui_ce.complete_lua,
    ['\n'] = {ui_ce.finish_mode, ui_ce.execute_lua}
  }

  -- makes a new file with location
  keys['can'] = function()
    io.open_file(ui.dialogs.filesave{
      with_directory = (buffer.filename or ''):match('^.+[//]')
    })
  end
end)


