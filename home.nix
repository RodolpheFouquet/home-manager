{ config, pkgs, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
  });
in
{

  imports = [
    nixvim.homeManagerModules.nixvim
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rodolphe";
  home.homeDirectory = "/home/rodolphe";

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    btop
    feh
    gh
    steam
    ripgrep
    autorandr
    discord
    flashprint
    pavucontrol
    rofi
    firefox
    skypeforlinux
    vmware-horizon-client
    spotify-player
    zoom-us
    curl
    ffmpeg
    unzip
    ranger
    viewnior
    killall 
    wget
    zip
    e2fsprogs
    google-chrome
    (pkgs.polybar.override {
      i3Support = true;
      alsaSupport = true;
      iwSupport = true;
      githubSupport = true;
    })
    zellij
    picom
    dunst
    lxappearance
    gtk_engines
    xclip
    bat
    fd
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono"]; })
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
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
  };

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    globals = {
      mapleader = " ";
    };

    options = {
      tabstop = 4;
      softtabstop = 4;
      shiftwidth = 4;
      expandtab = true;

      relativenumber = true;
      number = true;
      cursorline = true;
      termguicolors = true;
      showmode = false;
   
      clipboard = "unnamedplus";
      mouse = "";

      swapfile = false;
      undodir = "os.getenv";

      incsearch = true;
      ignorecase = true;
      smartcase = true;
    };

    keymaps = [
      #Telescope
      {
        key = "<leader>ff";
        mode = "n";
        options.desc ="Telescope Find File";
        action = "<cmd>Telescope find_files<cr>";
      }
      {
        key = "<leader>fg";
        mode = "n";
        options.desc ="Telescope Find Grep";
        action = "<cmd>Telescope live_grep<cr>";
      }
      {
        key = "<leader>fb";
        mode = "n";
        options.desc ="Telescope Find Buffers";
        action = "<cmd>Telescope buffers<cr>";
      }
      {
        key = "<leader>fo";
        mode = "n";
        options.desc ="Telescope Find Old files";
        action = "<cmd>Telescope oldfiles<cr>";
      }
      {
        key = "<leader>fz";
        mode = "n";
        options.desc ="Telescope Fuzzy Find";
        action = "<cmd>Telescope current_buffer_fuzzy_find<cr>";
      }

      #FTerm
      {
        key = "<A-i>";
        mode = "n";
        options.desc ="Toggle FTerm";
        action = "<cmd>lua require(\"FTerm\").toggle()<cr>";
      }
      {
        key = "<A-i>";
        mode = "t";
        options.desc ="Toggle FTerm";
        action = "<C-\\><C-n><CMD>lua require(\"FTerm\").toggle()<CR>";
      }
    ];

    
    extraPlugins = [ pkgs.vimPlugins.FTerm-nvim ];
    # swag
    colorschemes.catppuccin.enable = true;
    plugins.lualine = {
        enable = true;
        theme = "catppuccin";
    };
    plugins.noice.enable = true;

    plugins.telescope.enable = true;
    plugins.telescope.extensions.fzf-native.enable = true;
    plugins.telescope.extensions.undo.enable = true;
    plugins.telescope.extensions.media_files.enable = true;

    # Nerd stuff
    plugins.treesitter.enable = true;
    plugins.treesitter-refactor.enable = true;
    plugins.treesitter-textobjects.enable = true;
    plugins.ts-autotag.enable = true;
    plugins.ts-context-commentstring.enable = true;

    plugins.lsp.enable = true;
    plugins.trouble.enable = true;
    plugins.nvim-lightbulb.enable = true;
    plugins.rust-tools.enable = true;
    plugins.gitsigns.enable = true;
    plugins.markdown-preview.enable = true;

    # I use neovim btw - but on Discord
    plugins.presence-nvim.enable = true;
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

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "google-chrome-stable";
    TERMINAL = "kitty";
    TERM = "kitty";
    VISUAL = "nvim"; 
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.fish.enable = true;
}
