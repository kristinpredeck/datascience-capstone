# Julia Docs: https://docs.julialang.org

#=
Use the following commands in the Julia REPL to install packages for working with the NFI particle data. 
You only need to run these commands once to install the packages on your system. 
=#
using Pkg
Pkg.add("NeXLParticle")
Pkg.add("DataFrames")
Pkg.add("Parquet2")

# Now you can use the packages in your Julia code.
using NeXLParticle
using DataFrames
using Parquet2

#=
Steps for loading a Zeppelin (HDZ/PXZ pair)
=#

# Point to the .hdz file — the .pxz must be alongside it
zep = Zeppelin("path/to/your/file.hdz")
# zep = Zeppelin("P:\\My Files\\00_BRENDAN\\school\\Merrimack\\Courses\\Capstone\\NIST_raw_data\\Chevy Caprise 422PC2 Front Driver\\data.hdz")

# Load the particle data into a DataFrame
df = zep.data

# Optional sanity checks:
println("Number of particles: ", nrow(df))
println("Columns in the DataFrame: ", names(df))
println("Shape: ", size(df))
first(df, 5)  # Show the first 5 rows of the DataFrame

# Write raw data to Parquet
# Parquet2.writefile("data/raw/NIST/brakes_chevy_front_driver/data.parquet", df)
Parquet2.writefile("C:\\git\\datascience-capstone\\data\\raw\\NIST\\brakes_chevy_front_driver\\data.parquet", df)

#=
NOTE: DataFrame may contain CategoricalArray columns (like CLASS),
which can cause issues when writing to Parquet.
To avoid this, you can convert CategoricalArray columns to String before writing, as seen below:
=#
for col in names(df)
    if eltype(df[!, col]) <: CategoricalValue
        df[!, col] = String.(df[!, col])
    end
end