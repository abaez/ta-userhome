--- buffer properties or view related settings
-- @author Alejandro Baez <alejan.baez@gmail.com>
-- @copyright 2015
-- @license MIT (see LICENSE)
-- @module properties

local ct = require("common.themer")

-- enable semantic highlighting
_SEMANATIC = true

--- holds languages NOT to use semantic highlighting if semantic is on.
-- @param `language = true`: language being any one you choose.
local dont = {
  perl = true,
  yaml = true,
  markdown = true,
}

-- 4 spaces as a default
--buffer.tab_width = 4
--buffer.use_tabs = false

-- column width settings
buffer.edge_column = 79
buffer.edge_mode = buffer.EDGE_LINE -- line marker
--buffer.edge_mode = buffer.EDGE_BACKGROUND -- colors all after edge to colour
--buffer.edge_colour = "0x1132FF"
--buffer.edge_colour = "0xFF00FF"

-- multi select
buffer.multiple_selection = true
buffer.additional_selection_typing = true
buffer.additional_carets_visible = true

-- scrollbar
--buffer.scroll_width_tracking = true
--buffer.scroll_width = 120
buffer.end_at_last_line = false

-- auto complete
--buffer.auto_c_separator = '32' -- bytes
--buffer:auto_c_show(3, ) -- need item list

--buffer.eol_mode = buffer.EOL_LF

-- semantic highlighting. NEED base16 themes to work!
events.connect(events.LEXER_LOADED, function(lang)
  if _SEMANATIC == false then return end
  if dont[lang] then return end

  buffer.edge_colour = buffer.property_int["color.base0A"]

  buffer.property['style.operator']   = 'fore:%(color.base0F)'
  buffer.property['style.function']   = 'fore:%(color.base08)'
  buffer.property['style.library']    = 'fore:%(color.base09)'
  buffer.property['style.identifier'] = 'fore:%(color.base0D)'
  buffer.property['style.number']     = 'fore:%(color.base0E)'
  buffer.property['style.constant']   = 'fore:%(color.base0A)'

  buffer.property['style.keyword']    = ct.background == '-light' and
    'fore:%(color.base02)' or 'fore:%(color.base05)'
end)
