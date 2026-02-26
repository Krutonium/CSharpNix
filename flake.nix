{
  description = "Description Here";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system:
        f system (import nixpkgs { inherit system; })
      );
    in
    {
      packages = forAllSystems (system: pkgs: {
        default = pkgs.callPackage ./package.nix { };
      });

      devShells = forAllSystems (system: pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            dotnetCorePackages.sdk_10_0
            # Change this as required.
          ];
        };
      });
    };
}
