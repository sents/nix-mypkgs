{pkgs}:
{
  maia-icon-theme = pkgs.libsForQt5.callPackage ./maia-icon-theme {};
  mensapy = pkgs.callPackage ./mensapy {};
}
