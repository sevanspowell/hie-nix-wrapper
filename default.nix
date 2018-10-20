{ mkDerivation, base, directory, mtl, process, stdenv }:
mkDerivation {
  pname = "hie-nix-wrapper";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base directory mtl process ];
  license = stdenv.lib.licenses.bsd3;
}
