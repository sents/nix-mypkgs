{pkgs}:
{
  mensapy = pkgs.callPackage ./mensapy {};
  sddm-chili-theme = pkgs.libsForQt5.callPackage ./chili-sddm-theme {};
}
