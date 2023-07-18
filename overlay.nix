{packages}:
{
  default = final: prev:
    let
      mypkgs = import ./pkgs {pkgs = prev;};
    in
      with mypkgs; {
        inherit sddm-chili-theme;
        inherit mensapy;
        inherit xdg-terminal-exec;
        swycle = packages.${prev.system}.swycle;
      };
}
