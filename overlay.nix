{
  default = final: prev:
    let
      mypkgs = import ./pkgs {pkgs = prev;};
    in
      {
        xorg = prev.xorg // { xwayland = mypkgs.xwayland;};
      };
}
