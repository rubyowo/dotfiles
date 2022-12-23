{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs.fenix; [
    (default.withComponents [
      "rustc"
      "cargo"
      "rustfmt"
      "rust-std"
      "clippy"
    ])
    rust-analyzer
  ];
}
