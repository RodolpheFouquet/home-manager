{ pkgs }:
let 
  packages = with pkgs; [
    btop
    discord
    pavucontrol
    firefox
    skypeforlinux
    vmware-horizon-client
    spotify-player
    zoom-us
    curl
    ffmpeg
    autorandr
    unzip
    ranger
    viewnior
    killall 
    wget
    zip
    e2fsprogs
    google-chrome
    (pkgs.callPackage ./pkgs/lid_handler/default.nix { })
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono"]; })
  ];
in
packages ++ (import ./dev.nix { inherit pkgs; } ) ++ (import ./games.nix { inherit pkgs; } ) ++ (import ./ui.nix { inherit pkgs; } )
