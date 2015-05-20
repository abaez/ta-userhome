--- default initializer
-- @author [Alejandro Baez](https://twitter.com/a_baez)
-- @copyright 2015
-- @license MIT (see LICENSE)
-- @module init

local fn = require("common")
_M.ctags = require("ctags")
--require("hastebin")

-- new lexer modules go here
textadept.file_types.extensions.rs    = 'rust'
textadept.file_types.extensions.toml  = 'toml'
textadept.file_types.extensions.lock  = 'toml'
textadept.file_types.extensions.ld    = "lua"
textadept.file_types.extensions.yml   = 'yaml'
textadept.file_types.extensions.moon  = 'moonscript'
for _, v in ipairs{'zshrc, zsh-theme', 'zsh', 'zshenv'} do
  textadept.file_types.extensions[v]  = 'bash'
end

events.connect(events.INITIALIZED, function()
  ui.tabs = false -- always hides the tabs

--  textadept.editing.INDIC_BRACEMATCH
  textadept.editing.AUTOPAIR = true
  textadept.editing.TYPEOVER_CHARS = true
  textadept.editing.STRIP_TRAILING_SPACES = true
  textadept.editing.AUTOCOMPLETE_ALL = false

  textredux = require('textredux')
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
    local tavi = _USERHOME .. "/modules/vi"
    package.path = tavi .. "/?.lua;" .. package.path
    package.cpath = tavi .. "/?.so;" .. package.cpath
    _G.vi_mode = require('vi_mode')
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

  -- ctags module keys
  keys['a&'] = _M.ctags.goto_tag
  keys['a,'] = {_M.ctags.goto_tag, nil, true} -- back
  keys['a.'] = {_M.ctags.goto_tag, nil, false} -- forward
  keys['ac'] = {textadept.editing.autocomplete, 'ctag'}
end)
