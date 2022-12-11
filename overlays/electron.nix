self: let
  enableWayland = drv: bin:
    drv.overrideAttrs (
      old: {
        nativeBuildInputs = (old.nativeBuildInputs or []) ++ [self.makeWrapper];
        postFixup =
          (old.postFixup or "")
          + ''
                    wrapProgram $out/bin/${bin} \
                      --add-flags "--enable-features=UseOzonePlatform" \
                      --add-flags "--ozone-platform=wayland" \
            	      --add-flags "--enable-features=WaylandWindowDecorations" \
            	      --add-flags "--disable-gpu" \
            #	      --add-flags "--use-gl=desktop"
          '';
      }
    );
in
  super: {
    discord = enableWayland super.discord "discord";
  }
