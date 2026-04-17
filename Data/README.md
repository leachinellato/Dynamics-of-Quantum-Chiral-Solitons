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

## File index

| File | Figure in paper | Format | Shape / size |
|------|-----------------|--------|--------------|
| `Figure6.jld2`       | Fig. 6        | JLD2 | ~53 kB |
| `Figure7.txt`        | Fig. 7        | TXT  | 50 rows × 5 cols |
| `Figure8_L12.jld2`   | Fig. 8, L=12  | JLD2 | ~1.6 kB |
| `Figure8_L24.jld2`   | Fig. 8, L=24  | JLD2 | ~1.6 kB |
| `Figure8_L36.jld2`   | Fig. 8, L=36  | JLD2 | ~1.6 kB |
| `Figure8_L48.jld2`   | Fig. 8, L=48  | JLD2 | ~1.5 kB |
| `Figure9.txt`        | Fig. 9        | TXT  | 20 rows × 4 cols |
| `Figure12.jld2`      | Fig. 12 (all panels) | JLD2 | ~254 kB |
| `Figure13.jld2`      | Fig. 13       | JLD2 | ~254 kB |
| `Figure14.jld2`      | Fig. 14       | JLD2 | ~254 kB |
| `Figure16.jld2`      | Fig. 16       | JLD2 | ~195 kB |
| `Figure17.jld2`      | Fig. 17       | JLD2 | ~105 kB |

`L` in the `Figure8_L*` filenames denotes the spin-chain length used for the
finite-size scaling panels of Figure 8.

## Per-file contents

The entries below list the variables stored in each file. Shapes and physical
meanings should be verified against the paper; where the on-disk key name is
not documented here, inspect it with the snippet in the previous section.

### `Figure6.jld2`
- Dynamical spin structure factor data for Figure 6.
- Expected keys: momentum grid, frequency grid, and the structure factor
  matrix. Refer to the paper caption for axes and normalisation.

### `Figure7.txt`
- 50 rows × 5 columns, whitespace-separated, no header.
- Column 1 is the independent variable (frequency / momentum — see Fig. 7
  caption); columns 2–5 are the quantities plotted in the panel.

### `Figure8_L{12,24,36,48}.jld2`
- Finite-size data for Figure 8 at chain lengths L = 12, 24, 36, 48.
- Typical contents: energy levels or gaps as a function of a control
  parameter.

### `Figure9.txt`
- 20 rows × 4 columns, whitespace-separated, no header.
- First column is the control parameter; remaining columns are the quantities
  plotted in the panel.

### `Figure12.jld2`, `Figure13.jld2`, `Figure14.jld2`
- Dynamical structure-factor maps S(q, ω) covering the full Brillouin zone.
- Expected keys include a momentum grid `q`, a frequency grid `omega` (or
  `w`), and a 2-D intensity array.
- Panels (a)–(d) of Figure 12 are cuts / regions of `Figure12.jld2`.

### `Figure16.jld2`, `Figure17.jld2`
- Supporting structure-factor / correlation-function data for the
  corresponding figures in the paper.

## Units and conventions

Unless noted otherwise in the paper:

- Energies / frequencies are in units of the exchange coupling J.
- Momenta are in units of inverse lattice spacing (q ∈ [-π, π]).
- All simulations use open or periodic boundary conditions as specified in
  the paper (see Figs. 6 and 8 captions).

> **Note to users:** if a particular column or dictionary key is ambiguous
> from this description, please open an issue on the repository — the
> dictionary will be refined as questions come in.
