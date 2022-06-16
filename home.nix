{ pkgs, config, username, ... }:

{
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [ 
    arc-theme
    awscli
    aws-vault
    bat
    brave
    capitaine-cursors
    dmenu
    fd
    htop
    killall
    lxappearance
    papirus-icon-theme
    pavucontrol
    pcmanfm
    pfetch
    procs
    ripgrep
    slack
    tealdeer
    teams
    virt-manager
    volumeicon
    zoom-us
  ];

  home.username = username;

  programs = {
    alacritty = {
      enable = true;

      settings = {
        font = {
          normal.family = "mononoki";
          size = 14;
        };

        shell = {
          program = "${pkgs.fish}/bin/fish";
          args = [ "--login" ];
        };
      };
    };

    exa = {
      enable = true;
      enableAliases = true;
    };

    firefox.enable = true;

    fish = {
      enable = true;

      interactiveShellInit = ''
        set fish_greeting
        fish_vi_key_bindings
        pfetch
      '';
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    git = {
      enable = true;
      userEmail = "srobu@sonatype.com";
      userName = "Sebastian Robu";
    };

    home-manager.enable = true;

    lf = {
      enable = true;
      settings.icons = true;
    };

    neovim = {
      enable = true;

      extraConfig = ''
        set expandtab
        set relativenumber
        set shiftwidth=2
        set smartindent
        set tabstop=2
      '';

      viAlias = true;
      vimAlias = true;
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
    };

    vscode.enable = true;

    xmobar = {
      enable = true;

      extraConfig = ''
        Config { overrideRedirect = False
               , font     = "xft:iosevka-9"
               , bgColor  = "#5f5f5f"
               , fgColor  = "#f8f8f2"
               , position = TopW L 90
               , commands = [ Run Weather "EGPF"
                                [ "--template", "<weather> <tempC>°C"
                                , "-L", "0"
                                , "-H", "25"
                                , "--low"   , "lightblue"
                                , "--normal", "#f8f8f2"
                                , "--high"  , "red"
                                ] 36000
                            , Run Cpu
                                [ "-L", "3"
                                , "-H", "50"
                                , "--high"  , "red"
                                , "--normal", "green"
                                ] 10
                            , Run Alsa "default" "Master"
                                [ "--template", "<volumestatus>"
                                , "--suffix"  , "True"
                                , "--"
                                , "--on", ""
                                ]
                            , Run Memory ["--template", "Mem: <usedratio>%"] 10
                            , Run Swap [] 10
                            , Run Date "%a %Y-%m-%d <fc=#8be9fd>%H:%M</fc>" "date" 10
                            , Run XMonadLog
                            ]
               , sepChar  = "%"
               , alignSep = "}{"
               , template = "%XMonadLog% }{ %alsa:default:Master% | %cpu% | %memory% * %swap% | %EGPF% | %date% "
               }
      '';
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  services = {
    blueman-applet.enable = true;
    dunst.enable = true;
    flameshot.enable = true;
    network-manager-applet.enable = true;
    picom.enable = true;

    screen-locker = {
      enable = true;
      lockCmd = "${pkgs.slock}/bin/slock";
    };

    trayer = {
      enable = true;

      settings = {
        align = "right";
        edge = "top";
        expand = true;
        height = 19;
        iconspacing = 2;
        SetDockType = true;
        SetPartialStrut = true;
        tint = "0x5f5f5f";
        transparent = true;
        width = 10;
      };
    };

    udiskie.enable = true;
  };

  xsession = {
    enable = true;

    initExtra = ''
      volumeicon &
    '';
  };
}
