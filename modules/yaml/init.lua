textadept.file_types.extensions.yml = "yaml"

if type(snippets) == 'table' then
  snippets.yaml = {
    ["-"]     = "- name: %1(description)\n\t%2(module): %0",
    ["---"]   = "---\n- name: %0",
    ["f"]     = "\t%1(param)=%0",
    ["n"]     = "%1(param)=%0",
    ["wi"]     = "with_items:\n\t- %1\n\t- %0",
  }
end

return {}
