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
    ranger
    llvmPackages_16.clang-unwrapped
    viewnior
    picom 
    feh
    killall 
    dunst
    catppuccin-gtk
    xclip
    zellij
    wget
    zip
    (lutris.override {
      extraLibraries = pkgs: [
         wineWowPackages.staging
         winetricks

      ];
    })
    prismlauncher
    python3
    rust-analyzer
    python310Packages.python-lsp-server
    gopls
    delve
    lua-language-server
    stylua
    rnix-lsp
    deno
    nodePackages_latest.vscode-langservers-extracted
    ruby
    rubyPackages.prettier
    e2fsprogs
    catppuccin-cursors
    lxappearance
    gtk_engines
    lldb
    graphviz
    gh
    (pkgs.callPackage ./pkgs/lid_handler/default.nix { })
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono"]; })
  ];
in
packages ++ [ ]
