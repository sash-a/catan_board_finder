include("hex.jl")
include("board.jl")

using OffsetArrays
using .Game

hexs = OffsetArray{Game.Hex}(undef, -3:3, -3:3, -3:3)  # -3 -> 3 to accomodate bounds errors
for x in -3:3
    for y in -3:3
        for z in -3:3
            hexs[x,y,z] = Game.Hex(string(x, y, z), Game.Coord(x, y, z), Game.Hexagon.brick, 1)
        end
    end
end

board = Board(hexs)

c = Game.Coord(2, 0, -2)
println(Game.adj(c, board))
println(Game.on(c))