{
  description = "A command-line utility to help with software development";

  inputs = {
    nixpkgs.follows = "sub/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    sub.url = "github:ggazzi/sub/nix";
  };

  outputs = { self, flake-utils, nixpkgs, sub }:
    flake-utils.lib.eachDefaultSystem (system: {

      packages.default = sub.lib.${system}.mkSubDerivation {
        pname = "dev-cli-utils";
        cmd = "dev";
        version = "0.1.0";
        src = ./.;
      };
    });
}
