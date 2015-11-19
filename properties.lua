--- buffer properties or view related settings
-- @author [Alejandro Baez](https://twitter.com/a_baez)
-- @copyright 2015
-- @license MIT (see LICENSE)
-- @module properties

-- enable semantic highlighting
_SEMANATIC = true

--- holds languages NOT to use semantic highlighting if semantic is on.
-- @table dont
-- @field `language = true`: language being any one you choose.
local dont = {
  perl = true,
  yaml = true,
  markdown = true,
  toml = true
}


-- Column Width
buffer.edge_column = 79
--buffer.edge_mode   = buffer.EDGE_LINE -- line marker
buffer.edge_mode = buffer.EDGE_BACKGROUND -- colors all after edge to colour
--buffer.edge_colour = 0x0f03ff


-- Scrolling
buffer:set_x_caret_policy(buffer.CARET_SLOP, 20)
buffer:set_y_caret_policy(buffer.CARET_SLOP + buffer.CARET_STRICT +
                          buffer.CARET_EVEN, 1)
buffer.h_scroll_bar = false
buffer.v_scroll_bar = false
--buffer.scroll_width_tracking = true
--buffer.scroll_width = 120
buffer.end_at_last_line = false


-- Tabs and Indentation Guides.
-- Note: tab and indentation settings apply to individual buffers.
buffer.tab_width = 2
buffer.use_tabs = false
buffer.tab_indents = true
buffer.back_space_un_indents = true
buffer.indentation_guides = not CURSES and buffer.IV_LOOKBOTH or buffer.IV_NONE


-- Multiple Selection and Virtual Space
buffer.multiple_selection = true
buffer.additional_selection_typing = true
--buffer.multi_paste = buffer.MULTIPASTE_EACH
--buffer.virtual_space_options = buffer.VS_RECTANGULARSELECTION +
--                               buffer.VS_USERACCESSIBLE
buffer.rectangular_selection_modifier = buffer.MOD_ALT
buffer.mouse_selection_rectangular_switch = true
--buffer.additional_carets_blink = false
--buffer.additional_carets_visible = false


-- Annotations.
buffer.annotation_visible = buffer.ANNOTATION_BOXED


-- semantic highligting. NEED base16 themes to work!
events.connect(events.LEXER_LOADED, function(lang)
  if CURSES then return end
  if not _SEMANATIC then return end
  if dont[lang] then return end

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
