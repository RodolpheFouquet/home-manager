{ pkgs }:
let 
 packages = with pkgs; [
    btop
    discord
    pavucontrol
    firefox
    steam
    skypeforlinux
    rustup
    arandr
    vmware-horizon-client
    spotify-player
    zoom-us
    curl
    ffmpeg
    nodejs
    go
    ripgrep
    bat
    autorandr
    cmake
    unzip
    gcc_multi
    glibc
    llvmPackages_16.clang-unwrapped
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono"]; })
  ];
in
packages ++ []
