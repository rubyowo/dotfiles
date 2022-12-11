{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userEmail = "perhaps-you-know@what-is.ml";
    userName = "rubyowo";

    signing = {
      key = "/home/rei/.ssh/id_ed25519";
      signByDefault = true;
    };

    extraConfig = {
      gpg = { format = "ssh"; };

      url = {
        "ssh://git@github.com/" = { insteadOf = "https://github.com/"; };
      };

      init = { defaultBranch = "master"; };

      commit = { gpgsign = true; };

      tag = { gpgsign = true; };
    };
  };
}
