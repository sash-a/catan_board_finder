module Viz

using Luxor
using ..Game: Board, on
using ..Hexagon

export drawboard

_size = 50

_resourcecolour = Dict(
    wood => "green", 
    brick => "brown", 
    sheep => "green1", 
    wheat => "gold",
    ore => "grey",
    desert => "burlywood"
)

function _drawhex(size::Int, pos::Point)
    ngon(pos, size, 6, 0, :fillstroke)
end

function _drawtext(s::String, pos::Point)
    sethue("white")
    textcentred(s, pos)
end

function _drawhex(hex::Hex, offset = _size * 2)
    sethue(_resourcecolour[hex.resource])
    x = hex.coord.x
    y = (hex.coord.y - hex.coord.z) / 2
    pos = Point(x * offset, y * offset)

    _drawhex(_size, pos)
    _drawtext(hex.num == 0 ? "" : string(hex.num), pos)
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