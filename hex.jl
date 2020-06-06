module Hexagon

using Base
import Base.Enums.@enum

export Coord, Hex, Resource, wood, brick, sheep, wheat, ore

mutable struct Coord
    x::Int8
    y::Int8
    z::Int8
end

@enum FRUIT apple=1 orange=2 kiwi=3

@enum Resource begin
    wood
    brick
    sheep
    wheat
    ore
end

Base.show(io::IO, c::Coord) = print(io, "($(c.x), $(c.y), $(c.z))")

mutable struct Hex
    name::String
    coord::Coord

    resource::Resource
    num::Int8
end

Base.show(io::IO, h::Hex) = print(io, "($(h.coord.x), $(h.coord.y), $(h.coord.z))")

end
