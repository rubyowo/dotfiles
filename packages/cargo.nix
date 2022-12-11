{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.cargo;
  tomlFormat = pkgs.formats.toml {};
in {
  meta.maintainers = [];

  options.programs.cargo = {
    enable = mkEnableOption "cargo package manager";

    package = mkOption {
      type = types.package;
      default = pkgs.cargo;
      defaultText = literalExpression "pkgs.cargo";
      description = "The package to use for cargo.";
    };

    settings = mkOption {
      inherit (tomlFormat) type;
      default = {};
      example = literalExpression ''
        {
            paths = ["/path/to/override"]; # path dependency overrides
            alias = {
                b = "build";
                c = "check";
                t = "test";
                r = "run";
                rr = "run --release";
                recursive_example = "rr --example recursions";
                space_example = ["run", "--release", "--", "\"command list\""];
            };
            build = {
                jobs = 1;                      # number of parallel jobs, defaults to # of CPUs
                rustc = "rustc";               # the rust compiler tool
                rustc-wrapper = "…";           # run this wrapper instead of `rustc`
                rustc-workspace-wrapper = "…"; # run this wrapper instead of `rustc` for workspace members
                rustdoc = "rustdoc";           # the doc generator tool
                target = "triple";             # build for the target triple (ignored by `cargo install`)
                target-dir = "target";         # path of where to place all generated artifacts
                rustflags = ["…", "…"];        # custom flags to pass to all compiler invocations
                rustdocflags = ["…", "…"];     # custom flags to pass to rustdoc
                incremental = true;            # whether or not to enable incremental compilation
                dep-info-basedir = "…";        # path for the base directory for targets in depfiles
            };
        };
      '';
      description = ''
        Configuration written to
        <filename>$HOME/.cargo/config.toml</filename>.
        </para><para>
        See <link xlink:href="https://doc.rust-lang.org/cargo/reference/config.html" />
        for the full list of options.
      '';
    };
  };

  config = mkIf cfg.enable {
    home.file.".cargo/config.toml" = mkIf (cfg.settings != {}) {
      source = tomlFormat.generate "cargo-config" cfg.settings;
    };
  };
}
