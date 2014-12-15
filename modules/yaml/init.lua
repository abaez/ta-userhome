textadept.file_types.extensions.yml = "yaml"

if type(snippets) == 'table' then
  snippets.yaml = {
    ["-"]     = "- %1(name): %0",
    ["---"]   = "---\n%1(name): %0",
    ["f"]     = "\t%1(param): %0",
    ["n"]     = "%1(param): %0",
    ["i"]     = "with_items:\n\t- %1\n\t-%0",
  }
end

return {}
