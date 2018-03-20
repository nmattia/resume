let
  pkgs = import <nixpkgs> {};
  texlive = (pkgs.texlive.combine { inherit (pkgs.texlive) scheme-context; });
in pkgs.mkShell
  { name = "pandoc-resume";
    buildInputs =
      [ pkgs.pandoc
        texlive
      ];
    shellHook = "export TEXMF=${texlive}/share/texmf";

  }
