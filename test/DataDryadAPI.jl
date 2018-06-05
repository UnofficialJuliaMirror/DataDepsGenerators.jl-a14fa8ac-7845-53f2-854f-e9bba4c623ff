using DataDepsGenerators
using Base.Test

using ReferenceTests

@testset "DataDryadAPI test" begin
    # @testset "DataDryadWeb Ecology" begin
    #     registration_code = generate(DataDryadWeb(), "https://datadryad.org/resource/doi:10.5061/dryad.74699")

    #     @testset "Integration Test" begin
    #         eval(parse(registration_code))
    #         @test length(collect(readdir(datadep"Data from Ecology and genomics of an important crop wild relative as a prelude to agricultural innovation"))) > 0
    #     end
        
    #     @test_reference "references/DataDryad Ecology.txt" registration_code
    # end
    @test_reference "references/DataDryadAPI Ecology.txt" generate(DataDryadAPI(), "https://datadryad.org/mn/object/http://dx.doi.org/10.5061/dryad.74699")
    
    #Checking files with multiple files available for download
    @test_reference "references/DataDryadAPI Plasticity.txt" generate(DataDryadAPI(), "https://datadryad.org/mn/object/http://dx.doi.org/10.5061/dryad.f9s4424")
    @test_reference "references/DataDryadAPI Drought.txt" generate(DataDryadAPI(), "https://datadryad.org/mn/object/http://dx.doi.org/10.5061/dryad.cc8834s")
end
