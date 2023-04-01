{ lib
, stdenv
, fetchFromGitHub
, plasma-framework
, plasma-workspace
, kdeclarative
, config ? {}
}:
let
  configLines = lib.mapAttrsToList (name: value: lib.nameValuePair name value) config;
  configureTheme = "cp theme.conf theme.conf.orig \n" +
    (lib.concatMapStringsSep "\n" (configLine:
      "grep -q '^${configLine.name}=' theme.conf || echo '${configLine.name}=' >> \"$1\"\n" +
      "sed -i -e 's/^${configLine.name}=.*$/${configLine.name}=${
        lib.escape [ "/" "&" "\\"] configLine.value
      }/' theme.conf"
    ) configLines);
in
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

  preInstall = configureTheme;

  postInstall = ''
    mkdir -p $out/share/sddm/themes/chili
    mv * $out/share/sddm/themes/chili/
  '';

  postFixup = ''
    mkdir -p $out/nix-support
    echo ${plasma-framework.bin} \
         ${plasma-workspace} \
         ${kdeclarative} >> $out/nix-support/propagated-user-env-packages
  '';
  meta = with lib; {
    license = licenses.gpl3;
    homepage = https://github.com/MarianArlt/sddm-chili;
    description = "The chili login theme for SDDM";
    longDescription = ''
      Chili is hot, just like a real chili! Spice up the login experience for your users, your family and yourself. Chili reduces all the clutter and leaves you with a clean, easy to use, login interface with a modern yet classy touch.
    '';
  };
}
