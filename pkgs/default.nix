{pkgs}:
{
  mensapy = pkgs.callPackage ./mensapy {};
  sddm-chili-theme = pkgs.libsForQt5.callPackage ./chili-sddm-theme {};
  emacs = pkgs.callPackage ./emacs/29.nix {
    libXaw = pkgs.xorg.libXaw;
    gconf = null;
    alsa-lib = null;
    acl = null;
    gpm = null;
    inherit (pkgs.darwin.apple_sdk.frameworks)
      AppKit Carbon Cocoa IOKit OSAKit Quartz QuartzCore WebKit
      ImageCaptureCore GSS ImageIO;
    inherit (pkgs.darwin) sigtool;
    withPgtk = true;
  };
}
