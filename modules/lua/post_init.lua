--- Alejandro Baez's default post_init for lua
-- 2013,

local M = {}

if type(snippets) == 'table' then
  snippets.lua = {

    -- loops
    foriter = "for %1(k) in %2(iterator) do\n\t%0\nend",
    fori = "for %1(i), %2(v) in ipairs(%3(table)) do\n\t%0\nend",
    forp = "for %1(k), %2(v) in pairs(%3(table)) do\n\t%0\nend",
    ["for"] = "for %1(i) = %2(1), %3(10)%4(, -1) do\n\t%0\nend",
    ["while"] = "while %1(exp) do\n\t%0\nend",
    ["repeat"] = "repeat\n\t%0\nuntil %1(exp) end",
    ["do"] = "do\n\t%0\nend",

    -- functions
    ["fnc"] = "%3(--- %4\n-- @function %1\n-- @param %2)\nfunction %1(name)(%2(param))\n\t%0\nend",
    ["fn"] = "function %1(name)(%2(param))\n\t%0\nend",
    ["fna"] = "function(%1(param))\n\t%0\nend",
    ["lambda"] = "function(%1(param)) %0 end",

    -- Miscelenious
    ["local"] = "local %1(x) = %2(value)",
    ["--"] = "--[[\n\t%0\n--]]",
    ["---"] = "---[[ %1(name)\n%0\n--]]",

    -- if statement
    ["if"] = "if %1(condition) then\n\t%2\n%3(end)",
    ["ife"] = "if %1(condition) then\n\t%2(--body)\nelse\n\t%0\nend",
    ["else"] = "else\n\t%0\nend",
    ["elseif"] = "elseif %1(condition) then\n\t%2\n%3(end)",
  }
end


events.connect(events.LEXER_LOADED, function (lang)
  if lang ~= 'lua' then return end

  buffer.tab_width = 4
  buffer.use_tabs = false
end)


return M
