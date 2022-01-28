{ plugins, ... }:
self: prev:
let
  inherit (prev.vimUtils) buildVimPluginFrom2Nix;

  treesitterGrammars = prev.tree-sitter.withPlugins (_: prev.tree-sitter.allGrammars);

  buildPlug = plugin: buildVimPluginFrom2Nix {
    pname = plugin.name;
    version = "master";
    src = plugin.src;
  };
in
{
  neovimPlugins = builtins.listToAttrs
    (map
      (plugin: {
        name = plugin.name;
        value = buildPlug plugin;
      })
      plugins.sources);
}
