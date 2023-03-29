{packages}:
{
  default = final: prev:
    let
      mypkgs = import ./pkgs {pkgs = prev;};
    in
      {
        maia-icon-theme = mypkgs.maia-icon-theme;
        mensapy = mypkgs.mensapy;
        swycle = packages.${prev.system}.swycle;
      };
}
