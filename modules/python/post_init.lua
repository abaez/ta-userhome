M = {}
if type(snippets) == 'table' then
  snippets.python = {
    ['def'] = 'def %1(name)(%2(params)):\n\t%3("""\n\t%4\n\t"""\n\t)%0',
    ['l'] = "lambda %1(param): %0",

    -- conditions
    ['if'] = 'if %1(expr):\n\t%0',
    ['elif'] = 'elif %1(expr):\n\t%0',
    ['else'] = 'else:\n\t',

    -- loop
    ['forr'] = 'for %1(i)%2(, %3(j)) in range(%4):\n\t%0',
    ['for'] = 'for %1(i) in %2(iter):\n\t%0',
    ['while'] = 'while %1(expr):\n\t%0',
    ['with'] = 'with open(%1(filename)) as %2(f):\n\t%0',

    -- exceptions
    ['try'] = 'try:\n\t%0',
    ['except'] = 'except %1(class):\n\t%0',
    ['finally'] = 'finally:\n\t%0',
    ['raise'] = 'raise %1(exception)',
  }
end



events.connect(events.LEXER_LOADED, function (lang)
  if lang ~= 'python' then return end

  buffer.tab_width = 4

  buffer.use_tabs = false

end)



return M
