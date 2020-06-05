module Game

include("hex.jl")

using OffsetArrays

import .Hexagon.Coord
import .Hexagon.Hex

export Board, adj

struct Board
    hexs::OffsetArray{Hex,3}
end


function adj(c::Coord, b::Board)
    adjs = Coord[]  # list of adjacent hexs

    push!(adjs, b.hexs[c.x, c.y + 1, c.z + 1].coord)
    push!(adjs, b.hexs[c.x + 1, c.y, c.z + 1].coord)
    push!(adjs, b.hexs[c.x + 1, c.y - 1, c.z].coord)
    push!(adjs, b.hexs[c.x, c.y - 1, c.z - 1].coord)
    push!(adjs, b.hexs[c.x - 1, c.y, c.z - 1].coord)
    push!(adjs, b.hexs[c.x - 1, c.y, c.z].coord)

    adjs
end

end