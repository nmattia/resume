{}:
let
  sources = import ./sources.nix;
  pkgs = import sources.nixpkgs {};
in
pkgs //
  { niv = (import sources.niv { inherit pkgs; }).niv; }
