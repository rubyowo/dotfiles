{
  config,
  pkgs,
  ...
}: {
  imports = [./hardware.nix ../common ../../users/rei];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot = {enable = true;};
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
  };

  # Configure nix itself
  nix = {
    settings = {
      # Experimental Features
      experimental-features = ["nix-command" "flakes"];

      # Maximum number of concurrent tasks during one build
      cores = 4;

      max-jobs = 16;

      # Perform builds in a sandboxed environment
      sandbox = true;

      # Nix automatically detects files in the store that have identical contents, and replaces them with hard links to a single copy.
      auto-optimise-store = true;

      substituters = ["https://hyprland.cachix.org" "https://nix-community.cachix.org" "https://nix-gaming.cachix.org" "https://webcord.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" "webcord.cachix.org-1:l555jqOZGHd2C9+vS8ccdh8FhqnGe8L78QrHNn+EFEs="];
    };
  };

  networking = {
    networkmanager.enable = true;
    hostName = "selene";
  };

  # Set your time zone.
  time.timeZone = "Asia/Dubai";

  i18n.defaultLocale = "en_US.utf8";

  # Hardware configuration
  hardware = {bluetooth = {enable = true;};};

  # Blueman
  services.blueman = {enable = true;};

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Polkit
  security.polkit.enable = true;

  # Add swaylock to pam.d
  security.pam.services.swaylock = {};

  # OpenGL
  hardware.opengl.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [pkgs.canon-cups-ufr2];
  };

  # Allow unfree and insecure packages. Heh insecure, like me.
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-11.5.0"
    ];
  };

  # Fonts
  fonts = {
    fonts = with pkgs; [
      twemoji-color-font
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      (nerdfonts.override {fonts = ["FantasqueSansMono"];})
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [
          "FantasqueSansMono Nerd Font"
          "Noto Color Emoji"
        ];
        sansSerif = ["Noto Sans" "Noto Color Emoji"];
        serif = ["Noto Serif" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };

  users.users.rei = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "docker"];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  environment = {
    # Add zsh to /etc/shells
    shells = [pkgs.zsh];

    # List packages installed in system profile (globally).
    systemPackages = with pkgs; [
      wget
      git
      home-manager
      pipewire
      wireplumber
      pulseaudio
      zsh
      unzip
      gnupg
    ];

    pathsToLink = ["/share/zsh"];
  };

  systemd.services = {
    seatd = {
      serviceConfig = {
        Type = "simple";
        Restart = "always";
        RestartSec = "1";
        ExecStart = "${pkgs.seatd}/bin/seatd -g wheel";
      };
      wantedBy = ["multi-user.target"];
    };
  };

  system.stateVersion = "22.05";
}
