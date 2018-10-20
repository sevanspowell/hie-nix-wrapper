{}:

let
  pkgs = import <nixpkgs> {};

  drv = pkgs.haskellPackages.callPackage ./default.nix {};
in
  if pkgs.lib.inNixShell then drv.env else drv
