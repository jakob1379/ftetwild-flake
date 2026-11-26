<p align="center">
  <img src=".github/assets/meshing-pipeline.svg" width="100%" alt="2D illustration of the FloatTetwild pipeline: an input surface with its epsilon envelope is filled with a background mesh, the surface is inserted, poor-quality elements relax into well-shaped ones, and cells outside the shape are removed, leaving the volume mesh written to a .msh file.">
</p>

# FloatTetwild, packaged as a Nix flake

`FloatTetwild` turns a triangle surface mesh (`.off`, `.obj`, `.stl` or `.ply`) into a tetrahedral volume mesh in `.msh` format. It is developed and maintained upstream at [chrismile/fTetWild](https://github.com/chrismile/fTetWild).

This repository only distributes a pre-compiled binary, wrapped in a Nix flake so you can build and run it with one command. For the source code, documentation and development, go to the [fTetWild repository](https://github.com/chrismile/fTetWild).

## Requirements

- [Nix](https://nixos.org/download.html) package manager (version 2.0 or higher recommended)
- [Flakes](https://nixos.wiki/wiki/Flakes) enabled
- An x86_64 Linux machine. The flake exposes a package for every default system, but the bundled binary is an x86_64 Linux executable.

## Build

```bash
nix build
```

This creates a `result` symlink in the project directory that points to the build output. The build copies the binary to `bin/FloatTetwild` and points its library search path at Nix's `gmp`.

## Run

Run the binary straight from `result`:

```bash
./result/bin/FloatTetwild --help
```

Or install it into your user profile, which puts `FloatTetwild` on your `PATH`:

```bash
nix profile install ./result
```

Mesh a surface:

```bash
FloatTetwild -i surface.obj -o volume.msh
```

| Option | What it does |
| --- | --- |
| `-i, --input` | Input surface mesh in `.off`, `.obj`, `.stl` or `.ply` format. Required. |
| `-o, --output` | Output tetrahedral mesh in `.msh` format. Defaults to the input file name plus a postfix. |
| `-l, --lr` | Ideal edge length, relative to the bounding-box diagonal. Default `0.05`. |
| `-e, --epsr` | Envelope size epsilon, relative to the bounding-box diagonal. Default `1e-3`. |
| `--max-threads` | Maximum number of threads used. |
| `-q, --is-quiet` | Mute console output. |

`FloatTetwild --help` lists every option.

## License

The `FloatTetwild` binary is licensed under the **Mozilla Public License 2.0 (MPL-2.0)**. See the [fTetWild repository](https://github.com/chrismile/fTetWild) for its license text. This distribution flake is also licensed under MPL-2.0; see [`LICENSE.MPL2`](LICENSE.MPL2).
