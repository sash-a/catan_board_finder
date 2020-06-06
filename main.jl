include("hex.jl")
include("board.jl")
include("viz.jl")

using OffsetArrays
using Random
using .Game: Board, on
using .Hexagon: Hex, Coord, Resource, wood, brick, sheep, wheat, ore
using .Viz: drawboard

hexs = OffsetArray{Hexagon.Hex}(undef, -3:3, -3:3, -3:3)  # -3 -> 3 to accomodate bounds errors
for x in -3:3
    for y in -3:3
        for z in -3:3
            hexs[x,y,z] = Hex(string(x, y, z), Coord(x, y, z), rand(instances(Resource)), 1)
        end
    end
end

b = Board(hexs, 2)

c = Coord(2, 0, -2)
println(on(c, b))

drawboard(b)
