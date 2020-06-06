module Game

using Base
using OffsetArrays
using ..Hexagon: Coord, Hex, Resource

export Board, adj, in

struct Board
    hexs::OffsetArray{Hex,3}
    size::Int
end

function on(c::Coord, b::Board)
    abs(c.x) <= b.size && abs(c.y) <= b.size && abs(c.z) <= b.size && c.x + c.y + c.z == 0
end

function on(h::Hex, b::Board)
    on(h.coord, b)
end

function _addadj(c::Coord, adjs::Array{Coord}, b::Board)
    """Adds adjacent coord to list if it is in the bounds of the board"""
    if on(c, b)
        push!(adjs, c)
    end

    adjs
end

function adj(c::Coord, b::Board)
    """Returns a list of adjacent hexs"""
    adjs = Coord[]

    adjs = _addadj(b.hexs[c.x + 1, c.y - 1, c.z].coord, adjs, b)
    adjs = _addadj(b.hexs[c.x + 1, c.y, c.z - 1].coord, adjs, b)
    adjs = _addadj(b.hexs[c.x, c.y + 1, c.z - 1].coord, adjs, b)
    adjs = _addadj(b.hexs[c.x - 1, c.y + 1, c.z].coord, adjs, b)
    adjs = _addadj(b.hexs[c.x - 1, c.y, c.z + 1].coord, adjs, b)
    adjs = _addadj(b.hexs[c.x, c.y - 1, c.z + 1].coord, adjs, b)

    adjs
end

end