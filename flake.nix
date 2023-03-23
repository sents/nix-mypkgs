{
  description =
    "Packages for me";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.configurable-flakes.url = "github:sents/configurable-flakes";

  outputs = inputs@{ self, nixpkgs, flake-utils, configurable-flakes }:
    let
      lib = nixpkgs.lib;
    in
    configurable-flakes.lib.configurableFlake inputs
      {
        options = {
          systems = lib.mkOption {
            type = with lib.types; listOf (enum flake-utils.lib.allSystems);
            default = [ "x86_64-linux"];
          };
        };
      }
      ({ config, ... }:
        flake-utils.lib.eachSystem config.systems (system:
          let
            pkgs = nixpkgs.legacyPackages.${system};
            packages = import ./pkgs/default.nix { inherit pkgs;};
          in
            { inherit packages; })
        //
        {
          overlays = import ./overlay.nix;
        }
      );
}
