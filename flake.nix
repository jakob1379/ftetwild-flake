{
  inputs = { utils.url = "github:numtide/flake-utils"; };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        lib = nixpkgs.lib;
        gmpDep = pkgs.gmp; # Store gmp in a variable
      in {
        packages.default = pkgs.stdenv.mkDerivation {
          name = "FloatTetwild";
          src = ./.;
          version = "v0.1.0";

          installPhase = ''
            mkdir -p $out/bin
            cp FloatTetwild_bin $out/bin/FloatTetwild
            # Wrap the binary to include runtime dependencies
            patchelf --set-rpath "${gmpDep}/lib" $out/bin/FloatTetwild
          '';

          # Optional: Add dependencies if your binary needs them at runtime
          buildInputs = with pkgs; [ gmp pkgs.patchelf ];

          meta = {
            description = "My awesome FloatTetwild binary";
            license = lib.licenses.mpl20;
            maintainers = with lib.maintainers; [ "jakob1379" ];
          };
        };

      });
}
