--- snippets and settings for ansi_c
-- @author Alejandro Baez <alejan.baez@gmail.com>
-- @copyright 2015
-- @license MIT (see LICENSE)
-- @module post_ansi_c

if type(snippets) == 'table' then
  snippets.ansi_c = snippets.linux
end

events.connect(events.LEXER_LOADED, function (lang)
  if lang ~= 'ansi_c' then return end
  buffer.tab_width = 2
  buffer.use_tabs = false
end)
