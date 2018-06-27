using Base.Test
using TestSetExtensions

tests = [
    "format_checksum",
    "citation_generation",
    "UCI",
    "GitHub",
    "DataDryad",
    "DataOneV1",
    "DataOneV2/KNB",
    "DataOneV2/TERN",
    "CKAN",
    "DataCite",
]

@testset "DataDepGenerators" begin
    for filename in tests
        @testset ExtendedTestSet "$filename" begin
            include(filename * ".jl")
        end
    end
end
