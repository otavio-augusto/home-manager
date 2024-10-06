{pkgs, ...}: {
  #programs.bash.shellAliases = {
  #programs.zsh.shellAliases = {
  programs.nushell.shellAliases = {
    rust = "${pkgs.cached-nix-shell}/bin/cached-nix-shell /home/souza/.config/home-manager/shells/rust.nix --run nu";
  };
}
