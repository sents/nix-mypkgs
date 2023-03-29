{packages}:
{
  default = final: prev:
    let
      mypkgs = import ./pkgs {pkgs = prev;};
    in
      {
        xorg = prev.xorg // { xwayland = mypkgs.xwayland;};
        maia-icon-theme = mypkgs.maia-icon-theme;
        mensapy = mypkgs.mensapy;
        swycle = packages.${prev.system}.swycle;
      };
}