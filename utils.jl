module Utils

using Random

export randremove

function randremove(a)
    """Removes a random item from a 1D array and returns it"""
    i = rand(1:size(a)[1])
    item = a[i]
    deleteat!(a, i)

    item
end

end