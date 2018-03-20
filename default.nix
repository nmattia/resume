{ pkgs ? import <nixpkgs> {}}:
let
  texlive = (pkgs.texlive.combine { inherit (pkgs.texlive) scheme-context; });
in
  # TODO: refactor with shell.nix
  pkgs.stdenv.mkDerivation
    { name = "nmattia-resume";
      src = pkgs.lib.cleanSource ./.;
      buildInputs =
        [ pkgs.pandoc
          texlive
        ];
      installPhase =
        ''
          mkdir -p $out
          cp output/* $out
        '';
      TEXMF="${texlive}/share/texmf";
    }
