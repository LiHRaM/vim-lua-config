{ inputs, separator, ... }:

let
  plugin-input-names = builtins.filter
    (s: (builtins.match "${separator}.*" s) != null)
    (builtins.attrNames inputs);
  plugName = input: builtins.substring 0 (builtins.stringLength separator) input;
in
{
  names = builtins.map plugName plugin-input-names;
  sources = builtins.map
    (input: {
      name = plugName input;
      src = builtins.getAttr input;
    })
    plugin-input-names;
}
