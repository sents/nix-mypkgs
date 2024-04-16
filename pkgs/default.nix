{pkgs}:
{
  mensapy = pkgs.callPackage ./mensapy {};
  pdftowrite = pkgs.callPackage ./pdftowrite {};
  sddm-chili-theme = pkgs.libsForQt5.callPackage ./chili-sddm-theme {};
  xdg-terminal-exec = pkgs.callPackage ./xdg-terminal-exec {};
}
