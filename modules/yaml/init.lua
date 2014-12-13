textadept.file_types.extensions.yml = "yaml"

if type(snippets) == 'table' then
  snippets.yaml = {
    ["-"]     = "- %1(name): %0",
    ["---"]   = "---\n%1(name): %0",
    ["f"]     = "\n\t%1(name): %0",
    ["n"]     = "\n%1(name): %0",
    ["{"]     = "{{ %1(name) }}%0",
  }
end

return {}
