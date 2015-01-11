--- snippets and settings for ansi_c
-- @author Alejandro Baez <alejan.baez@gmail.com>
-- @copyright 2015
-- @license MIT (see LICENSE)
-- @module post_ansi_c

if type(snippets) == 'table' then
  snippets.ansi_c = {

    -- functions and structs
    fn = '%1(T) %2(name)(%3(arguments)) \n{\n\t%0\n}',
    struct = "struct %1(name) {\n\t%0\n} %2( object_name);",
    enum = "enum %1(name) {\n\t%0\n}",
    t = "typedef %1(type) %2(alias);%0",

    -- random
    ['in'] = '#include %1(<%0>)',
    ['printf'] = 'printf("%1", %2(param))',
    ['/*'] = "/*\n * %0\n */",

    -- conditional
    ['for'] = 'for (%1(i) = %2(0); %1 %3(<) %4(10); %5(%1++)) {\n\t%0\n}',
    ['while'] = 'while (%1(expr)) {\n\t%0\n}',
    ['do'] = 'do {\n\t%1\n} while (%2); %0',

    -- if
    ['if'] = 'if (%1(expr)) {\n\t%2\n} %0',
    ['else'] = 'else {\n\t%0\n}',
    ['switch'] = 'switch (%1(expr)) {\n%1\ndefault:\n\t%0\n}',
    ['case'] = 'case %1(expr):\n\t%2\n%0',
  }

  snippets.linux = snippets.ansi_c
end

events.connect(events.LEXER_LOADED, function (lang)
  if lang ~= 'ansi_c' then return end
  buffer.tab_width = 2
  buffer.use_tabs = false
end)
