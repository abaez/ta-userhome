--- file extensions for textadept to auto recognize.
-- @author [Alejandro Baez](https://twitter.com/a_baez)
-- @copyright 2015
-- @license MIT (see LICENSE)
-- @module extensions

--- holds all the file extensions to extend for.
local auto = {
  rs    = 'rust',
  toml  = 'toml',
  lock  = 'toml',
  ld    = 'lua',
  yml   = 'yaml',
  moon  = 'moonscript',
  p8    = 'pico8',
  etlua = 'etlua',
  elm   = 'elm',
  spec  = 'rpmspec',
  sol   = 'solidity',
  tf    = 'terraform',

  -- zsh
  zshrc         = 'bash',
  ['zsh-theme'] = 'bash',
  zsh           = 'bash',
  zshenv        = 'bash',

  -- config files
  service = 'ini',

  -- Somefile
  Tupfile     = 'bash',
  Vagrantfile = 'ruby',
  Dockerfile  = 'dockerfile',
  lakefile    = 'lua',

  -- extra shortcuts
  luadoc    = 'lua',
  h         = 'ansi_c',
  gitconfig = 'ini',
  hgrc      = 'ini',
}


for k, v in pairs(auto) do
  textadept.file_types.extensions[k] = v
end
