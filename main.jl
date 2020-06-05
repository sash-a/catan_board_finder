include("hex.jl")
include("board.jl")

using OffsetArrays
import .Game.Board, .Game.Hexagon.Hex, .Game.Hexagon.Coord, .Game.adj

hexs = OffsetArray{Hex}(undef, -2:2, -2:2, -2:2)
for x in -2:2
    for y in -2:2
        for z in -2:2
            hexs[x,y,z] = Hex(string(x, y, z), Coord(x, y, z))
        end
    end
end

board = Board(hexs)

c = Coord(1, 0, 1)
println(adj(c, board))