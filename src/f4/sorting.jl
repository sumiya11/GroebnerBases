# Sorting monomials, polynomials, and other things.

# Unstable algorithm should be a bit faster for large arrays
# (basically, quicksort/radixsort vs. mergesort)
_default_sorting_alg() = Base.Sort.DEFAULT_UNSTABLE

# Sorts arr at the range of indices from..to 
function sort_part!(
    arr,
    from::Integer,
    to::Integer;
    lt=isless,
    alg=_default_sorting_alg(),
    by=identity,
    rev=false
)
    ordr = Base.Sort.ord(lt, by, rev, Base.Sort.Forward)
    sort!(arr, from, to, alg, ordr)
end

# Sorts polynomials from the basis by their leading monomial in the
# non-decreasing way by the given monomial ordering. Also sorts any arrays
# passed in the `abc` optional argument in the same order.
#
# Returns the sorting permutation.
function sort_polys_by_lead_increasing!(
    basis::Basis,
    hashtable::MonomialHashtable,
    abc...;
    ord::Ord=hashtable.ord
) where {Ord <: AbstractMonomialOrdering}
    b_monoms = basis.monoms
    h_monoms = hashtable.monoms
    permutation = collect(1:(basis.nfilled))
    cmps =
        (x, y) -> monom_isless(
            @inbounds(h_monoms[b_monoms[x][1]]),
            @inbounds(h_monoms[b_monoms[y][1]]),
            ord
        )
    sort!(permutation, lt=cmps, alg=_default_sorting_alg())
    # use array assignment insted of elemewise assignment
    # (seems to compile to faster code)
    basis.monoms[1:(basis.nfilled)] = basis.monoms[permutation]
    basis.coeffs[1:(basis.nfilled)] = basis.coeffs[permutation]
    @inbounds for a in abc
        @invariant length(a) >= length(permutation)
        a[1:(basis.nfilled)] = a[permutation]
    end
    permutation
end

function is_sorted_by_lead_increasing(
    basis::Basis,
    hashtable::MonomialHashtable,
    ord::Ord=hashtable.ord
) where {Ord <: AbstractMonomialOrdering}
    b_monoms = basis.monoms
    h_monoms = hashtable.monoms
    permutation = collect(1:(basis.nfilled))
    cmps =
        (x, y) -> monom_isless(
            @inbounds(h_monoms[b_monoms[x][1]]),
            @inbounds(h_monoms[b_monoms[y][1]]),
            ord
        )
    issorted(permutation, lt=cmps)
end

# Sorts critical pairs from the pairset in the range from..from+sz by the total
# degree of their lcms in increasing order
#
# Used in update once per one f4 iteration to sort pairs in pairset; Also used
# in normal selection strategy also once per iteration
function sort_pairset_by_degree!(ps::Pairset, from::Int, sz::Int)
    sort_part!(ps.pairs, from, from + sz, by=pair -> pair.deg)
end

# Sorts the first `npairs` pairs from `pairset` in the non-decreasing order of
# their lcms by the given monomial ordering
function sort_pairset_by_lcm!(pairset::Pairset, npairs::Int, hashtable::MonomialHashtable)
    monoms = hashtable.monoms
    cmps =
        (pair1, pair2) -> monom_isless(
            @inbounds(monoms[pair1.lcm]),
            @inbounds(monoms[pair2.lcm]),
            hashtable.ord
        )
    sort_part!(pairset.pairs, 1, npairs, lt=cmps)
end

# Sorts generators selected in normal selection strategy by their position in
# the current basis (identity sort)
function sort_generators_by_position!(gens::Vector{Int}, load::Int)
    sort_part!(gens, 1, load)
end

###
# Sorting matrix rows and columns.
# See f4/matrix.jl for details.

# Compare sparse matrix rows a and b.
# A row is an array of integers, which are the indices of nonzero elements
function matrix_row_decreasing_cmp(a::Vector{T}, b::Vector{T}) where {T <: ColumnIdx}
    #= a, b - rows as arrays of nonzero indices =#
    # va and vb are the leading columns
    @inbounds va = a[1]
    @inbounds vb = b[1]
    if va > vb
        return false
    end
    if va < vb
        return true
    end
    # If the same leading column => compare the density of rows
    va = length(a)
    vb = length(b)
    if va > vb
        return true
    end
    if va < vb
        return false
    end
    # Hmm, equal rows?
    # This should never happen!
    # TODO!!!: add some kind of assertion here
    # @invariant false
    false
end

# Compare sparse matrix rows a and b.
# A row is an array of integers, which are the indices of nonzero elements
function matrix_row_increasing_cmp(a::Vector{T}, b::Vector{T}) where {T <: ColumnIdx}
    #= a, b - rows as arrays of nonzero indices =#
    # va and vb are the leading columns
    @inbounds va = a[1]
    @inbounds vb = b[1]
    if va > vb
        return true
    end
    if va < vb
        return false
    end
    # If the same leading column => compare the density of rows
    va = length(a)
    vb = length(b)
    if va > vb
        return false
    end
    if va < vb
        return true
    end
    # Hmm, equal rows?
    # This should never happen!
    # @invariant false
    return false
end

# Sort matrix upper rows (polynomial reducers) by the leading column index and
# density.
#
# After the sort, the first (smallest) row will have the left-most leading
# column index and, then, the smallest density.
function sort_matrix_upper_rows_decreasing!(matrix::MacaulayMatrix)
    #= smaller means pivot being more left  =#
    #= and density being smaller            =#
    permutation = collect(1:(matrix.nup))
    cmp =
        (x, y) -> matrix_row_decreasing_cmp(
            @inbounds(matrix.uprows[x]),
            @inbounds(matrix.uprows[y])
        )
    sort!(permutation, lt=cmp, alg=_default_sorting_alg())
    matrix.uprows[1:(matrix.nup)] = matrix.uprows[permutation]
    matrix.up2coef[1:(matrix.nup)] = matrix.up2coef[permutation]
    # TODO: this is a bit hacky
    if !isempty(matrix.up2mult)
        matrix.up2mult[1:(matrix.nup)] = matrix.up2mult[permutation]
    end
    matrix
end

# Sort matrix lower rows (polynomials to be reduced) by the leading column index
# and density.
#
# After the sort, the first (smallest) row will have the right-most leading
# column index and, then, the largest density.
function sort_matrix_lower_rows_increasing!(matrix::MacaulayMatrix)
    #= smaller means pivot being more right =#
    #= and density being larger             =#
    permutation = collect(1:(matrix.nlow))
    cmp =
        (x, y) -> matrix_row_increasing_cmp(
            @inbounds(matrix.lowrows[x]),
            @inbounds(matrix.lowrows[y])
        )
    sort!(permutation, lt=cmp, alg=_default_sorting_alg())
    matrix.lowrows[1:(matrix.nlow)] = matrix.lowrows[permutation]
    matrix.low2coef[1:(matrix.nlow)] = matrix.low2coef[permutation]
    # TODO: this is a bit hacky
    if !isempty(matrix.low2mult)
        matrix.low2mult[1:(matrix.nlow)] = matrix.low2mult[permutation]
    end
    matrix
end

# Sorts the columns of the matrix (encoded in `col2hash` vector) by the role of
# the corresponding monomial in the matrix, and then by the current monomial
# ordering decreasingly.
#
# See f4/matrix.jl for details
function sort_columns_by_hash!(col2hash::Vector{T}, symbol_ht::MonomialHashtable) where {T}
    hd = symbol_ht.hashdata
    es = symbol_ht.monoms

    function cmp(a, b, ord)
        @inbounds ha = hd[a]
        @inbounds hb = hd[b]
        if ha.idx != hb.idx
            return ha.idx > hb.idx
        end
        @inbounds ea = es[a]
        @inbounds eb = es[b]
        !monom_isless(ea, eb, ord)
    end

    ordcmp = (x, y) -> cmp(x, y, symbol_ht.ord)

    sort!(col2hash, lt=ordcmp, alg=_default_sorting_alg())
end

# Given a vector of vectors of exponent vectors and coefficients,
# sort each vector wrt. the given monomial ordering `ord`.
# 
function sort_input_to_change_ordering!(
    exps::Vector{Vector{M}},
    coeffs::Vector{Vector{C}},
    ord::AbstractMonomialOrdering
) where {M <: Monom, C <: Coeff}
    # for each polynomial encoded as 
    # two vectors exps[polyidx] and coeffs[polyidx]..
    @inbounds for polyidx in 1:length(exps)
        cmps =
            (x, y) ->
                monom_isless(@inbounds(exps[polyidx][y]), @inbounds(exps[polyidx][x]), ord)

        inds = collect(1:length(exps[polyidx]))

        sort!(inds, lt=cmps, alg=_default_sorting_alg())

        exps[polyidx][1:end] = exps[polyidx][inds]
        coeffs[polyidx][1:end] = coeffs[polyidx][inds]
    end
    nothing
end

function sort_monom_indices_decreasing!(
    monoms::Vector{MonomIdx},
    cnt::Integer,
    hashtable::MonomialHashtable,
    ord::AbstractMonomialOrdering
)
    exps = hashtable.monoms

    cmps = (x, y) -> monom_isless(@inbounds(exps[y]), @inbounds(exps[x]), ord)

    sort_part!(monoms, 1, cnt, lt=cmps, alg=_default_sorting_alg())
end

function sort_term_indices_decreasing!(
    monoms::Vector{MonomIdx},
    coeffs::Vector{C},
    hashtable::MonomialHashtable,
    ord::AbstractMonomialOrdering
) where {C <: Coeff}
    exps = hashtable.monoms

    cmps =
        (x, y) -> monom_isless(@inbounds(exps[monoms[y]]), @inbounds(exps[monoms[x]]), ord)

    inds = collect(1:length(monoms))

    sort!(inds, lt=cmps, alg=Base.Sort.DEFAULT_UNSTABLE)

    monoms[1:end] = monoms[inds]
    coeffs[1:end] = coeffs[inds]
end
