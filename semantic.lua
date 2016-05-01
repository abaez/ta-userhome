--- adding semantic abilities to textadept
-- @author [Alejandro Baez](https://keybase.io/baez)
-- @copyright 2016
-- @license MIT (see LICENSE)
-- @module semantic

--- holds languages NOT to use semantic highlighting if semantic is on.
-- @table dont
-- @field `language = true`: language being any one you choose.
local dont = {
  perl = true,
  yaml = true,
  markdown = true,
  toml = true
}

-- semantic highligting. NEED base16 themes to work!
events.connect(events.LEXER_LOADED, function(lang)
  if CURSES or dont[lang] or not _SEMANATIC then return end

  buffer.edge_colour = buffer.property_int["color.base0A"]

  buffer.property['style.operator']   = 'fore:%(color.base0F)'
  buffer.property['style.function']   = 'fore:%(color.base08)'
  buffer.property['style.library']    = 'fore:%(color.base09)'
  buffer.property['style.identifier'] = 'fore:%(color.base0D)'
  buffer.property['style.number']     = 'fore:%(color.base0E)'
  buffer.property['style.constant']   = 'fore:%(color.base0A)'

  buffer.property['style.keyword']    = CURRENT_BACKGROUND == '-light' and
    'fore:%(color.base02)' or 'fore:%(color.base05)'
end)
