{
  description =
    "Packages for me";
  inputs.nixpkgs.url = "flake:nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.configurable-flakes.url = "github:sents/configurable-flakes";
  inputs.swycle.url = "github:sents/swycle";
  inputs.swycle.inputs.nixpkgs.follows = "nixpkgs";
  inputs.emojipicker.url = "github:sents/emojipicker";
  inputs.emojipicker.inputs.nixpkgs.follows = "nixpkgs";

  outputs = inputs@{ self, nixpkgs, flake-utils, configurable-flakes, swycle, emojipicker}:
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
            packages = import ./pkgs/default.nix { inherit pkgs;} //
                       {
                         swycle = swycle.packages.${system}.swycle;
                         emojipicker = emojipicker.packages.${system}.default;
                       };
          in
            { inherit packages; })
        //
        {
          overlays = import ./overlay.nix { packages = self.packages;};
        }
      );
}
