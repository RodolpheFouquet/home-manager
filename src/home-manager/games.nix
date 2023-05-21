{ pkgs }:
let 
  packages = with pkgs; [
    steam
    prismlauncher
    (lutris.override {
      extraLibraries = pkgs: [
         wineWowPackages.staging
         winetricks

      ];
    })
  ];
in
packages ++ [ ]

