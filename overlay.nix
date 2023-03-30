{packages}:
{
  default = final: prev:
    let
      mypkgs = import ./pkgs {pkgs = prev;};
    in
      {
        sddm-chili-theme = mypkgs.sddm-chili-theme;
        mensapy = mypkgs.mensapy;
        swycle = packages.${prev.system}.swycle;
      };
}
