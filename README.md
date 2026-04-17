[![Paper](https://img.shields.io/badge/paper-arXiv%3A2512.08220-B31B1B.svg)](https://arxiv.org/abs/2512.08220)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

# Dynamics of Quantum Chiral Solitons

Leandro M. Chinellato, Oleg A. Starykh, Cristian D. Batista

[arXiv:2512.08220](https://arxiv.org/abs/2512.08220)

## Abstract

We introduce a non-perturbative framework for quantizing chiral solitons in interacting quantum spin chains. This approach provides a direct lattice extension of the well-established S-duality between the sine-Gordon and Thirring models, thereby bridging the gap between continuum dualities and their lattice counterparts. By constructing the quantum chiral-soliton operators explicitly, we show how their unconventional dynamics appear in the excitation spectrum and correlation functions across the full Brillouin zone. A key result is that the dominant soliton tunneling amplitude alternates in sign, $\mathrm{sgn}(t_{1+}) = (-1)^{2S+1}$, sharply distinguishing half-odd-integer from integer spin chains. We further identify characteristic signatures of these chiral excitations in the dynamical spin structure factor, demonstrating their visibility in inelastic neutron scattering. Our results open a route to experimentally probing non-perturbative features of dual quantum field theories in condensed-matter settings.

## Repository contents

This repository contains the numerical data needed to reproduce the figures of the manuscript.

```
.
├── Data/                 # Raw data files, one (or more) per figure
│   ├── README.md         # Data dictionary — what each file contains
│   ├── Figure6.jld2
│   ├── Figure7.txt
│   ├── Figure8_L{12,24,36,48}.jld2
│   ├── Figure9.txt
│   ├── Figure12.jld2
│   ├── Figure13.jld2
│   ├── Figure14.jld2
│   ├── Figure16.jld2
│   └── Figure17.jld2
├── scripts/              # Helper scripts to load / convert the data
│   ├── load_data.jl      # Minimal loader (Julia + JLD2)
│   └── export_to_hdf5.jl # Convert JLD2 → plain HDF5 (portable)
├── Project.toml          # Pinned Julia environment
├── CITATION.cff          # How to cite this dataset
└── LICENSE               # CC BY 4.0
```


## Requirements

The `.jld2` files are written in [JLD2](https://github.com/JuliaIO/JLD2.jl) format (HDF5-compatible, Julia-native). To read them natively:

- Julia ≥ 1.9
- Packages listed in `Project.toml` (`JLD2`, `HDF5`)

The `.txt` files are plain whitespace-separated numeric tables and can be read with any language (NumPy, Matlab, Mathematica, etc.). See `Data/README.md` for the column specification.

## Loading the data

```julia
using Pkg
Pkg.activate(".")
Pkg.instantiate()

using JLD2
data = load("Data/Figure6.jld2")        # returns a Dict{String,Any}
```

### For non-Julia users

A conversion script is provided to rewrite every `.jld2` file as a plain HDF5 file readable from Python (`h5py`), Matlab (`h5read`), C/C++, etc.:

```bash
julia --project=. scripts/export_to_hdf5.jl
```

This will create an `hdf5/` directory with one `.h5` file per `.jld2` source.

## How to cite

If you use this dataset, please cite the accompanying paper:

```bibtex
@article{Chinellato2025ChiralSolitons,
  title   = {Dynamics of Quantum Chiral Solitons},
  author  = {Chinellato, Leandro M. and Starykh, Oleg A. and Batista, Cristian D.},
  journal = {arXiv preprint arXiv:2512.08220},
  year    = {2025},
  url     = {https://arxiv.org/abs/2512.08220}
}
```


## License

This dataset is released under the [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/) license (CC BY 4.0). See the [`LICENSE`](LICENSE) file for details.

## Contact

For questions, corrections, or alternative data formats please open an issue on this repository or contact the corresponding author (Leandro M. Chinellato).
