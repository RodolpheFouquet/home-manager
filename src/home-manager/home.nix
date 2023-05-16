{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rodolphe";
  home.homeDirectory = "/home/rodolphe";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = import ./packages.nix { inherit pkgs; };
  fonts.fontconfig.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    ".config/nvim".source = dotfiles/nvim;
    ".config/nvim".recursive = true;
    ".config/i3".source = dotfiles/i3;
    ".config/i3".recursive = true;
    ".config/picom".source = dotfiles/picom;
    ".config/picom".recursive = true;
    ".config/zellij".source = dotfiles/zellij;
    ".config/zellij".recursive = true;
    ".config/polybar".source = dotfiles/polybar;
    ".config/polybar".recursive = true;
    ".config/dunst".source = dotfiles/dunst;
    ".config/dunst".recursive = true;
    ".config/wallpaper.png".source = dotfiles/wallpaper.png;
    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  programs.neovim = {
    viAlias = true;
    enable = true;
    vimAlias = true;

  };

  programs.git = {
    enable= true;
    userName  = "Rodolphe Fouquet";
    userEmail = "rodolphe@unicowd.com";
  };

  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";
  };

  programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      # add_newline = false;

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };

      # package.disabled = true;
    };
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/rodolphe/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
    TERM = "kitty";
    VISUAL = "nvim"; 
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.fish.enable = true;
}
