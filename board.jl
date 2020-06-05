module Game

include("hex.jl")

using Base
using OffsetArrays
import .Hexagon.Coord, .Hexagon.Hex, .Hexagon.Resource

export Board, adj, in

struct Board
    hexs::OffsetArray{Hex,3}
end

function on(c::Coord)
    abs(c.x) <= 2 && abs(c.y) <= 2 && abs(c.z) <= 2 && c.x + c.y + c.z == 0
end

function _addadj(c::Coord, adjs::Array{Coord})
    """Adds adjacent coord to list if it is in the bounds of the board"""
    if on(c)
        push!(adjs, c)
    end

    adjs
end

function adj(c::Coord, b::Board)
    adjs = Coord[]  # list of adjacent hexs

    adjs = _addadj(b.hexs[c.x + 1, c.y - 1, c.z].coord, adjs)
    adjs = _addadj(b.hexs[c.x + 1, c.y, c.z - 1].coord, adjs)
    adjs = _addadj(b.hexs[c.x, c.y + 1, c.z - 1].coord, adjs)
    adjs = _addadj(b.hexs[c.x - 1, c.y + 1, c.z].coord, adjs)
    adjs = _addadj(b.hexs[c.x - 1, c.y, c.z + 1].coord, adjs)
    adjs = _addadj(b.hexs[c.x, c.y - 1, c.z + 1].coord, adjs)

    adjs
end

end