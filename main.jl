using OffsetArrays


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