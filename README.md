# FloatTetwild (Binary Distribution)

This repository provides a Nix flake for distributing a pre-compiled binary of `FloatTetwild`, a command-line tool for generating tetrahedral meshes from floating-point data.  `FloatTetwild` is originally developed and maintained at [https://github.com/chrismile/fTetWild](https://github.com/chrismile/fTetWild). This flake provides a convenient way to obtain and run the binary using Nix.

**Please note:** This repository *only* distributes the binary. For the source code, documentation, and original development, refer to the [fTetWild repository](https://github.com/chrismile/fTetWild).

## Prerequisites

*   [Nix](https://nixos.org/download.html) package manager (version 2.0 or higher recommended)
*   [Flakes](https://nixos.wiki/wiki/Flakes) enabled (see instructions below)

## Building

To build the `FloatTetwild` binary package, run:

```bash
nix build
```

This will create a `result` symlink in your project directory, pointing to the build output.

## Running

You can run the binary directly from the `result` directory:

```bash
./result/bin/FloatTetwild --help
```

Or, you can install it into your user profile:

```bash
nix profile install ./result
```

This will make the `FloatTetwild` command available on your `PATH`.

## License

The `FloatTetwild` binary is licensed under the **Mozilla Public License 2.0 (MPL-2.0)**. Please refer to the [fTetWild repository](https://github.com/chrismile/fTetWild) for the full license text. This distribution flake is also licensed under the **Mozilla Public License 2.0 (MPL-2.0)**. See the `LICENSE` file for details.

