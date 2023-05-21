
{ pkgs }:
let 
  packages = with pkgs; [
    picom 
    dunst
    xclip
    arandr
    catppuccin-gtk
    xdotool
    gnome.simple-scan
    feh
    catppuccin-cursors
    lxappearance
    gtk_engines
    maim
  ];
in
packages ++ [ ]
