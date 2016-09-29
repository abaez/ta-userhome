--- keymaps for textadept and modules
-- @author [Alejandro Baez](https://keybase.io/baez)
-- @copyright 2016
-- @license MIT (see LICENSE)
-- @module keymap


keys.co =
  function() textredux.fs.open_file() end

-- opens files in directory.
keys["cp"] =
  function()
    textredux.fs.snapopen(
      (buffer.filename or ''):match('^.+[//]')
    )
  end
keys["cu"] =
  function() textredux.fs.snapopen(_USERHOME) end

-- textadept-vi configuration
keys["aV"] =
  function()
    local tavi = _USERHOME .. "/modules/vi"
    package.path = tavi .. "/?.lua;" .. package.path
    package.cpath = tavi .. "/?.so;" .. package.cpath
    _G.vi_mode = require('vi_mode')
  end

-- ctags module keys
keys['a&'] =
  function() _M.ctags.goto_tag() end
keys['a,'] =
  function() _M.ctags.goto_tag(nil, true) end --back
keys['a.'] =
  function() _M.ctags.goto_tag(nil, false) end -- forward

keys['ac'] =
  function() textadept.editing.autocomplete('ctag') end

-- remap keys
keys["cE"] =
  function() textadept.editing.select_paragraph() end
keys["cP"] =
  function() textadept.menu.select_command() end
keys["cC"] =
  function() textadept.snippets._cancel_current() end



-- makes a new file with location
keys['can'] =
  function()
    io.open_file(ui.dialogs.filesave{
      with_directory = (buffer.filename or ''):match('^.+[//]')
    })
  end

--- A pair of events for changing view or buffer with the same keys.
events.connect(events.VIEW_NEW, function()
  -- view switch with buffer switch keys.
  keys[not CURSES and 'an' or 'mn'] =
    function() ui.goto_view(1, true) end
  keys[not CURSES and 'ap' or 'mp'] =
    function() ui.goto_view(-1, true) end
  -- close view
  keys[not CURSES and 'aq' or 'mq'] =
    function() view:unsplit() end
  keys[not CURSES and 'aQ' or 'mQ'] =
    function() while view:unsplit() do end end
end)

events.connect(events.BUFFER_NEW, function()
  if #_VIEWS ~= 1 then return end

  -- buffer switch with view switch keys.
  keys[not CURSES and 'an' or 'mn'] =
    function() view:goto_buffer() end
  keys[not CURSES and 'ap' or 'mp'] =
    function() view:goto_buffer() end
  -- close buffer
  keys[not CURSES and 'aq' or 'mq'] =
    function() io.close_buffer() end
  keys[not CURSES and 'aQ' or 'mQ'] =
    function() io.close_all_buffers() end
end)

