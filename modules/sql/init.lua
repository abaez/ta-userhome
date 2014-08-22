events.connect(events.LEXER_LOADED, function (lang)
  if lang ~= 'sql' then return end

  buffer.tab_width = 8
  buffer.use_tabs = true
  buffer.edge_column = 79
end)


return {}
