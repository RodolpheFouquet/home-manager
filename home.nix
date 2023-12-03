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
  #config.allowUnfree = true;
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
    polybar
    zellij
    picom
    dunst
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

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/rodolphe/etc/profile.d/hm-session-vars.sh
  #
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
    colorschemes.catppuccin.enable = true;
    plugins.lightline.enable = true;
    plugins.telescope.enable = true;
    plugins.rust-tools.enable = true;
    plugins.presence-nvim.enable = true;
  };
 # programs.neovim = {
 #   viAlias = true;
 #   enable = true;
 #   vimAlias = true;
   # extraConfig = ''
   #     :luafile ~/.config/nvim/lua/init.lua
   # '';
   # plugins = [
   #   pkgs.vimExtraPlugins.catppuccin
   #   pkgs.vimExtraPlugins.plenary-nvim
   #   pkgs.vimExtraPlugins.popup-nvim
   #   pkgs.vimExtraPlugins.telescope-nvim
   #   pkgs.vimExtraPlugins.telescope-media-files-nvim

    #  pkgs.vimPlugins.nvim-treesitter.withAllGrammars
    #  pkgs.vimExtraPlugins.nvim-treesitter-context
    #  pkgs.vimExtraPlugins.nvim-treesitter-refactor
    #  pkgs.vimExtraPlugins.nvim-treesitter-textobjects
    #  pkgs.vimExtraPlugins.playground

     # pkgs.vimExtraPlugins.undotree

     # pkgs.vimExtraPlugins.which-key-nvim
     # pkgs.vimExtraPlugins.neodev-nvim
     # pkgs.vimExtraPlugins.trouble-nvim
     # pkgs.vimExtraPlugins.nvim-web-devicons

     # pkgs.vimExtraPlugins.nvim-lspconfig
     # pkgs.vimExtraPlugins.nvim-dap
     # pkgs.vimExtraPlugins.nvim-dap-ui
     # pkgs.vimExtraPlugins.nvim-cmp
     # pkgs.vimExtraPlugins.cmp-nvim-lsp
     # pkgs.vimExtraPlugins.cmp-buffer
     # pkgs.vimExtraPlugins.cmp-path
     # pkgs.vimExtraPlugins.cmp-cmdline
     # pkgs.vimExtraPlugins.cmp-nvim-lsp-document-symbol
     # pkgs.vimExtraPlugins.cmp-nvim-lsp-signature-help
     # pkgs.vimExtraPlugins.cmp-nvim-lua
     # pkgs.vimExtraPlugins.LuaSnip
     # pkgs.vimExtraPlugins.cmp-luasnip

     # pkgs.vimExtraPlugins.rust-tools-nvim
     # pkgs.vimExtraPlugins.Comment-nvim
     # pkgs.vimExtraPlugins.lualine-nvim
    #];
 # };

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
    BROWSER = "google-chrome-stable";
    TERMINAL = "kitty";
    TERM = "kitty";
    VISUAL = "nvim"; 
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.fish.enable = true;
}
