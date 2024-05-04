{ config, pkgs, ... }:

{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "vachicorne";
  home.homeDirectory = "/home/vachicorne";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
      firefox
      steam
      skypeforlinux
      discord
      nvtopPackages.nvidia
      mangohud
      obs-studio
      sapling
      gh
      git
      git-lfs
      libratbag
      piper
      mesa-demos
      zoom-us
      vmware-horizon-client
      usbutils
      ffmpeg
      vlc
      mpv
      wezterm
      starship
      unzip
      ripgrep
      gpu-screen-recorder-gtk
      google-chrome
      zellij
      teamspeak5_client
      bat
      plank
      inotify-tools
      protonvpn-cli

      rustup
      nodejs
      clang
      zig
      gleam
      erlang
      elixir
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/wezterm/wezterm.lua".source = config/wezterm/wezterm.lua;
    ".config/zellij/config.kdl".source = config/zellij/config.kdl;
 };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
