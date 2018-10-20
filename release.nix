{}:

let
  pkgs = import <nixpkgs> {};

in {
  hie-nix-wrapper = pkgs.haskellPackages.callPackage ./default.nix {};
}

