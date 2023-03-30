{lib, stdenv
, fetchFromGitHub
, plasma-framework
, plasma-workspace
, kdeclarative
}:
stdenv.mkDerivation {
  pname = "sddm-chili-theme";
  version = "0.5.5";

  src = fetchFromGitHub {
    owner = "MarianArlt";
    repo = "kde-plasma-chili";
    rev = "a371123959676f608f01421398f7400a2f01ae06";
    sha256 = "17pkxpk4lfgm14yfwg6rw6zrkdpxilzv90s48s2hsicgl3vmyr3x";
  };

  propagatedBuildInputs = [
    plasma-framework
    plasma-workspace
    kdeclarative
  ];

  dontWrapQtApps = true;

  postFixup = ''
  mkdir -p $out/nix-support
  echo ${plasma-framework.bin} \
       ${plasma-workspace} \
       ${kdeclarative} >> $out/nix-support/propagated-user-env-packages
  '';

  postInstall = ''
  mkdir -p $out/share/sddm/themes/chili
  mv * $out/share/sddm/themes/chili/
'';
}
