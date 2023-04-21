{
  config,
  pkgs,
  lib,
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
    cleanTmpDir = true;
    kernel.sysctl = {
      "net.ipv4.ip_forward" = true;
      "net.ipv6.conf.all.forwarding" = true;
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

      substituters = ["https://hyprland.cachix.org" "https://nix-community.cachix.org" "https://nix-gaming.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];

      #      use-xdg-base-directories = true;
    };
  };

  networking = {
    networkmanager.enable = true;

    hostName = "selene";
    nameservers = ["127.0.0.1" "1.1.1.1"];
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

  services.udev.packages = [pkgs.heimdall];
  programs.zsh.enable = true;

  # Polkit
  security.polkit.enable = true;

  # Add swaylock to pam.d
  security.pam.services.swaylock = {};

  # Doas
  security.doas.enable = true;
  security.sudo.enable = false;

  # OpenSSH
  services.openssh.enable = true;
  programs.ssh = {
    startAgent = true;
    extraConfig = ''
      AddKeysToAgent  yes
    '';
  };

  # GnuPG
  programs.gnupg.agent = {
    enable = true;
  };

  # GNOME Keyring
  services.gnome.gnome-keyring.enable = true;

  # OpenGL
  hardware.opengl.enable = true;

  # SeatD
  systemd.services = {
    seatd = {
      enable = true;
      description = "Seat management daemon";
      script = "${lib.getExe pkgs.seatd} -g wheel";
      serviceConfig = {
        Type = "simple";
        Restart = "always";
        RestartSec = "1";
      };
      wantedBy = ["multi-user.target"];
    };
  };

  # Docker
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      fixed-cidr-v6 = "fc00:6:0::1/64";
      ipv6 = true;
    };
  };

  # Podman
  virtualisation.podman = {
    enable = true;
    # dockerSocket.enable = true;
    defaultNetwork.settings = {
      # dns_enabled = true;
      ipv6_enabled = true;
    };
  };

  # QEMU
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = with pkgs; [gutenprint];
    browsing = true;
    browsedConf = ''
      BrowseDNSSDSubTypes _cups,_print
      BrowseLocalProtocols all
      BrowseRemoteProtocols all
      CreateIPPPrinterQueues All

      BrowseProtocols all
    '';
  };
  programs.system-config-printer.enable = true;

  services.avahi = {
    enable = true;
    openFirewall = true;
    nssmdns = true;
  };

  hardware.printers = let
    canon = "Canon_TS5100_series";
  in {
    ensureDefaultPrinter = canon;
    ensurePrinters = [
      {
        name = canon;
        deviceUri = "dnssd://Canon%20TS5100%20series._ipp._tcp.local/?uuid=00000000-0000-1000-8000-0018255cb515";
        model = "gutenprint.${lib.versions.majorMinor (lib.getVersion pkgs.gutenprint)}://bjc-TS5000-series/expert";
        description = lib.replaceStrings ["_"] [" "] canon;
        location = "My Desk";
      }
    ];
  };

  # Allow unfree and insecure packages. Heh insecure, like me.
  # Okay i don't do that anymore (allow insecure packages) but im still leaving the comment in :^)
  nixpkgs.config = {
    allowUnfree = true;
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

  system.stateVersion = "22.05";
}
