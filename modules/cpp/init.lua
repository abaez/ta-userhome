-- ansi_c snippets.
if type(snippets) == 'table' then
  snippets.cpp = {
    fn = '%1(T) %2(name)(%3(arguments)) \n{\n\t%0\n}',
    struct = "struct %1(type_name) {\n\t%0\n} %2( object_name);",
    enum = "enum %1(type_name) {\n\t%0\n} %2( object_name);",
    union = "union %1(type_name) {\n\t%0\n} %2( object_name);",
    template = "template <class %1(T)>\n%1 %2(name)(%3param) \n{\n\t%0\n}",

    -- class details
    class = "class %1(name) {\n\t%0\n}%2( object_names);",
    public = "public:\n\t%0",
    private = "private:\n\t%0",
    protected = "protected:\n\t%0",

    -- random
    ['in'] = '#include %1(<%0>)',
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

end


events.connect(events.LEXER_LOADED, function (lang)
  if lang ~= 'cpp' then return end

  buffer.tab_width = 4
  buffer.use_tabs = false
  buffer.edge_column = 79

end)


return {}
