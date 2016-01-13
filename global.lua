--- ## Global pre-module constants.
-- used for changing default settings in other modules.
-- @author [Alejandro Baez](https://twitter.com/a_baez)
-- @copyright 2015
-- @license MIT (see LICENSE)
-- @module global

-- themer
CURRENT_FONT = "Fantasque Sans Mono"
CURRENT_FONTSIZE = 13
--CURRENT_THEME = "base16-atelierlakeside-light"
--CURRENT_BACKGROUND = "-light"

-- languages
_RUSTFMT = true  -- enable rustfmt
_PM      = false -- disable package manager. Default == true.

-- default terminal for common
TERMINAL_STRING = "termite"

-- global snippets
snippets['shield'] = "https://img.shields.io/badge/%1(subject)-%2(status)-%3(color).svg%0"
snippets['badge'] = "[![%1(name)][%2(num)i]][%2p]\n[%2i]: %3(image)\n[%2p]: %4(url)\n%0"
snippets['baez'] = "https://keybase.io/baez%0"

