#!/usr/bin/env julia
# Convert every Data/*.jld2 file in this repository to a plain HDF5
# file that is readable from Python (h5py), Matlab, C/C++ and other
# languages without needing Julia or JLD2.jl.
#
# Output goes to an "hdf5/" directory at the repository root.
#
# Usage:
#     julia --project=. scripts/export_to_hdf5.jl

using JLD2
using HDF5

const ROOT    = normpath(joinpath(@__DIR__, ".."))
const SRC_DIR = joinpath(ROOT, "Data")
const OUT_DIR = joinpath(ROOT, "hdf5")

function write_group!(h5group, dict::AbstractDict)
    for (k, v) in dict
        key = String(k)
        if v isa AbstractDict
            sub = create_group(h5group, key)
            write_group!(sub, v)
        elseif v isa AbstractArray || v isa Number || v isa AbstractString
            h5group[key] = v
        else
            @warn "Skipping key '$key' with unsupported type $(typeof(v))"
        end
    end
end

function convert(src::AbstractString, dst::AbstractString)
    data = JLD2.load(src)
    h5open(dst, "w") do f
        write_group!(f, data)
    end
    println("  $(basename(src))  →  $(relpath(dst, ROOT))")
end

function main()
    isdir(OUT_DIR) || mkpath(OUT_DIR)
    sources = sort(filter(p -> endswith(p, ".jld2"),
                          readdir(SRC_DIR; join=true)))
    if isempty(sources)
        println("No .jld2 files found in $SRC_DIR")
        return
    end
    println("Writing HDF5 copies to $(relpath(OUT_DIR, ROOT))/ …")
    for src in sources
        dst = joinpath(OUT_DIR, replace(basename(src), ".jld2" => ".h5"))
        convert(src, dst)
    end
    println("Done.")
end

main()
