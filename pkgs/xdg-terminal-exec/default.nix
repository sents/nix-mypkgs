{ stdenv, lib, fetchFromGitHub, bash}:
stdenv.mkDerivation rec {
  pname = "xdg-terminal-exec";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Vladimir-csp";
    repo = "xdg-terminal-exec";
    rev = "75fa03c9df3c96e16223f23b09f4d47e58a51233";
    hash = "sha256-6ESW54MH/iV9PB93J5d1QYbR1l4SSrHxs0uQdUFYuCg=";
  };

  preInstall = ''
  substituteInPlace xdg-terminal-exec \
    --replace "#!/bin/sh" "${bash}"
  '';
  installPhase = ''
  install -Dm 755 xdg-terminal-exec $out/bin/
  '';

  meta = with lib; {
    description = "Proposal for XDG terminal execution utility";
    homepage = "https://github.com/Vladimir-csp/xdg-terminal-exec";
    license = licenses.gpl3;
  };
}
