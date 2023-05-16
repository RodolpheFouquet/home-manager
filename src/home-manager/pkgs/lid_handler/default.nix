{ 
  pkgs ? import <nixpkgs> {} 
}:
pkgs.stdenv.mkDerivation {
  name = "lid_handler";
  src = pkgs.fetchurl {
    url = "https://github.com/RodolpheFouquet/lid_handler/releases/download/0.1.0/lid_handler_linux_amd64";
    sha256 = "576f40e4ff347acc6977cd115b1e28d17dbd8299228547b39a42f8daf3d4cfbe";
  };
  phases = ["installPhase" "patchPhase"];
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/lid_handler
    chmod +x $out/bin/lid_handler
  '';
}
