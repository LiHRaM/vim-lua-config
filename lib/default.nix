{ pkgs, inputs, separator, ...}:
rec {
	inherit (pkgs.lib);
	plugins = import ./pluginList.nix {inherit inputs separator;};
	buildPluginOverlay = import ./buildPlugin.nix { inherit plugins; };
}
