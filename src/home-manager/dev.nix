{ pkgs }:
let 
  packages = with pkgs; [
    tree-sitter
    rustup
    cmake
    nodejs
    go
    ripgrep
    fd
    bat
    gcc_multi
    glibc
    llvmPackages_16.clang-unwrapped
    zellij
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
    vscode-extensions.vadimcn.vscode-lldb
    lldb
    graphviz
    gh
    chafa
    imagemagick
    poppler_utils
    ffmpegthumbnailer
  ];
in
packages ++ [ ]
