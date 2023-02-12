{
  config,
  pkgs,
  ...
}: {
  services.mpd = {
    enable = true;
    musicDirectory = config.xdg.userDirs.music;
    extraConfig = ''
      audio_output {
        type            "pipewire"
        name            "PipeWire Sound Server"
      }
      audio_output {
        type                    "fifo"
        name                    "fifo"
        path                    "/tmp/mpd.fifo"
        format                  "44100:16:2"
      }
    '';
  };

  programs.ncmpcpp = {
    enable = true;
    package = pkgs.ncmpcpp.override {
      visualizerSupport = true;
    };
    settings = {
      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "fifo";
      visualizer_in_stereo = "yes";
      visualizer_type = "ellipse";
      visualizer_look = "●●";
      visualizer_color = "6, 8, 2";
    };
  };
}
