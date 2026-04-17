# Data dictionary

This directory contains the raw numerical data used to produce the figures of
*L. M. Chinellato, O. A. Starykh, C. D. Batista — "Dynamics of Quantum Chiral
Solitons", arXiv:2512.08220*.

Two formats are used:

- **`.jld2`** — Julia's JLD2 container (HDF5-compatible). Each file stores a
  `Dict{String,Any}`. Inspect the top-level keys with:
  ```julia
  using JLD2; jldopen("FileName.jld2", "r") do f; println(keys(f)); end
  ```
  Or use the portable HDF5 copies produced by `../scripts/export_to_hdf5.jl`.
- **`.txt`** — plain whitespace-separated ASCII tables, one row per sample.

`L` in the `Figure8_L*` filenames denotes the spin-chain length used for the
finite-size scaling panels of Figure 8.

