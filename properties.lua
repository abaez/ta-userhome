--- buffer properties or view related settings
-- @author [Alejandro Baez](https://twitter.com/a_baez)
-- @copyright 2015
-- @license MIT (see LICENSE)
-- @module properties

require("semantic")

-- Line padding
buffer.extra_ascent = 2
buffer.extra_descent = 2

--- ## Wrap
buffer.wrap_mode = buffer.WRAP_WORD
buffer.wrap_indent_mode = buffer.WRAPINDENT_INDENT
buffer.wrap_visual_flags = buffer.WRAPVISUALFLAG_END
buffer.wrap_visual_flags_location = buffer.WRAPVISUALFLAGLOC_END_BY_TEXT

--- ## Fold Margin
buffer.margin_width_n[2] = not CURSES and 12 or 0

--- ## Column Width
buffer.edge_column = 79
buffer.edge_mode   = buffer.EDGE_LINE -- line marker
--buffer.edge_mode = buffer.EDGE_BACKGROUND -- colors all after edge to colour
--buffer.edge_colour = 0x0f03ff


--- ## Scrolling
buffer:set_x_caret_policy(buffer.CARET_SLOP, 20)
buffer:set_y_caret_policy(buffer.CARET_SLOP + buffer.CARET_STRICT +
                          buffer.CARET_EVEN, 1)
buffer.h_scroll_bar = false
buffer.v_scroll_bar = false
--buffer.scroll_width_tracking = true
--buffer.scroll_width = 120
buffer.end_at_last_line = false


--- ## Tabs and Indentation Guides.
-- Note: tab and indentation settings apply to individual buffers.
buffer.tab_width = 2
buffer.use_tabs = false
buffer.tab_indents = true
buffer.back_space_un_indents = true
buffer.indentation_guides = not CURSES and buffer.IV_REAL or buffer.IV_NONE


--- ## Multiple Selection and Virtual Space
buffer.multiple_selection = true
buffer.additional_selection_typing = true
--buffer.multi_paste = buffer.MULTIPASTE_EACH
--buffer.virtual_space_options = buffer.VS_RECTANGULARSELECTION +
--                               buffer.VS_USERACCESSIBLE
buffer.rectangular_selection_modifier = buffer.MOD_ALT
buffer.mouse_selection_rectangular_switch = true
--buffer.additional_carets_blink = false
--buffer.additional_carets_visible = false


--- ## Annotations.
buffer.annotation_visible = buffer.ANNOTATION_BOXED


