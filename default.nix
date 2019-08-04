{ pkgs ? import ./nix {} }:
let
  texlive = (pkgs.texlive.combine { inherit (pkgs.texlive) scheme-context; });
in rec

{ pdf = pkgs.stdenv.mkDerivation
    { name = "resume-pdf";
      phases = [ "buildPhase" "installPhase" ];
      buildPhase =
        ''
        mkdir -p build
        cp ${./resume.md} build/resume.md

        pandoc \
          build/resume.md \
          --pdf-engine=context \
          --template ${./styles}/chmduquesne.tex \
          --variable papersize=A4\
          -o build/resume.pdf
        '';

      installPhase =
        ''
        mkdir -p $out
        cp build/resume.pdf $out/resume.pdf
        '';

      buildInputs =
        [ pkgs.pandoc
          texlive
        ];

      TEXMF="${texlive}/share/texmf";
    };
  html = pkgs.stdenv.mkDerivation
    { name = "resume-html";
      phases = [ "buildPhase" "installPhase" ];
      buildPhase =
        ''
        mkdir -p build
        cp ${./resume.md} build/resume.md

        pandoc \
          build/resume.md \
          --include-in-header ${./styles}/chmduquesne.css \
          --metadata pagetitle='Nicolas Mattia - resume' \
          -o build/resume.html
        '';

      installPhase =
        ''
        mkdir -p $out
        cp build/resume.html $out/resume.html
        '';

      buildInputs =
        [ pkgs.pandoc
          texlive
        ];

      TEXMF="${texlive}/share/texmf";
    };
}
