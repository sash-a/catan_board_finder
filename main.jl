include("hex.jl")
include("board.jl")
include("viz.jl")
include("utils.jl")

using OffsetArrays
using Random
using .Game: Board, on
using .Hexagon
using .Viz: drawboard
using .Utils

board_size = 2

resources = [
    wood, wood, wood, wood,
    brick, brick, brick,
    sheep, sheep, sheep, sheep,
    wheat, wheat, wheat, wheat,
    ore, ore, ore,
]

nums = [2, 3, 3, 4, 4, 5, 5, 6, 6, 8, 8, 9, 9, 10, 10, 11, 11, 12]

hexs = OffsetArray{Hexagon.Hex}(undef, -(board_size + 1):board_size + 1, -(board_size + 1):board_size + 1, -(board_size + 1):board_size + 1)  # +1 to accomodate out of bounds errors
for x in -(board_size + 1):board_size + 1
    for y in -(board_size + 1):board_size + 1
        for z in -(board_size + 1):board_size + 1
            
            coord = Coord(x, y, z)

            if !on(coord, board_size)
                hexs[x,y,z] = Hex("nob", coord, nob, -1)  # nob = not on board
                continue
            end

            if !isempty(resources) 
                resource = randremove(resources)
                num = randremove(nums)
            else
                resource = desert
                num = 0
            end

            hexs[x,y,z] = Hex(string(x, y, z), coord, resource, num)

        end
    end
end

b = Board(hexs, board_size)
drawboard(b)
