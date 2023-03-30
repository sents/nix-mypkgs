{packages}:
{
  default = final: prev:
    let
      mypkgs = import ./pkgs {pkgs = prev;};
    in
      {
        mensapy = mypkgs.mensapy;
        swycle = packages.${prev.system}.swycle;
      };
}
