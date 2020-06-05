module Hexagon

using Base

export Coord
export Hex

struct Coord
    x::Int8
    y::Int8
    z::Int8
end

Base.show(io::IO, c::Coord) = print(io, "($(c.x), $(c.y), $(c.z))")

struct Hex
    name::String
    coord::Coord
end

end