module Viz

using Luxor
using ..Game: Board, on
using ..Hexagon: Coord, Hex, wood, brick, sheep, wheat, ore


_size = 50

resourcecolour = Dict(
    wood => "green", 
    brick => "brown", 
    sheep => "green1", 
    wheat => "yellow",
    ore => "grey"
)
function _drawhex(size::Int, pos::Point)
    ngon(pos, size, 6, 0, :fillstroke)
end

function _drawtext(s::String, pos::Point)
    sethue("white")
    textcentred(s, pos)
end

function _drawhex(hex::Hex, offset = _size * 2)
    sethue(resourcecolour[hex.resource])
    # xmod = hex.coord.z % 2 == 0 ? 1 : 0.5
    # pos = Point((hex.coord.x - hex.coord.y) * offset, hex.coord.z / 2 * offset)
    x = hex.coord.x
    y = (hex.coord.y - hex.coord.z) / 2
    pos = Point(x * offset, y * offset)
    println(pos)

    _drawhex(_size, pos)
    _drawtext(string(hex.coord), pos)
end

function drawboard(b::Board)
    Drawing(1000, 1000, "board.png")
    origin()

    fontsize(25)
    background("lightblue")


    for hex in b.hexs
        if on(hex, b)
            _drawhex(hex)
        end
    end

    finish()
    preview()
end
end