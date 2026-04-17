#!/usr/bin/env julia
# Minimal loader for the JLD2 data files shipped with this repository.
#
# Usage:
#     julia --project=. scripts/load_data.jl [path/to/File.jld2 ...]
#
# With no arguments, every *.jld2 file under Data/ is opened and its
# top-level keys (and array shapes, when applicable) are printed.

using JLD2

function summarise(path::AbstractString)
    println("── ", path)
    jldopen(path, "r") do f
        ks = keys(f)
        if isempty(ks)
            println("   (empty file)")
            return
        end
        for k in ks
            v = f[k]
            if v isa AbstractArray
                println("   $k :: $(typeof(v))  size=$(size(v))")
            else
                println("   $k :: $(typeof(v))  = $(repr(v))")
            end
        end
    end
end

function main(args)
    paths = isempty(args) ?
        sort(filter(p -> endswith(p, ".jld2"),
                    readdir(joinpath(@__DIR__, "..", "Data"); join=true))) :
        args
    for p in paths
        summarise(p)
    end
end

main(ARGS)
