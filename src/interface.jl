
"""
    function groebner(
        polynomials;
        reduced=true,
        ordering=InputOrdering(),
        certify=false,
        linalg=:prob,
        monoms=best_monom_representation(),
        rng=MersenneTwister(42),
        loglevel=Logging.Warn,
        maxpairs=typemax(Int)
    )

Computes a Groebner basis of the ideal generated by array `polynomials`.

If `reduced` is set, the returned basis is reduced, which is **unique** (default).

Uses the monomial ordering from `polynomials` by default (if any).
If `ordering` parameter is explicitly specified, it takes precedence.
Possible monomial orderings to specify are

- `InputOrdering()` for preserving the input ordering (default),
- `Lex()` for lexicographic,
- `DegLex()` for degree lexicographic,
- `DegRevLex()` for degree reverse lexicographic,
- `WeightedOrdering(weights)` for weighted ordering,
- `BlockOrdering(args...)` for block ordering,
- `MatrixOrdering(matrix)` for matrix ordering.

For more info information about creation and usage of different monomial orderings, 
see the corresponding documentation page.

The algorithm is randomized. The obtained result will be correct with high probability.
Set `certify` to `true` to obtain correct result guaranteedly.

The `linalg` parameter is responsible for linear algebra backend to be used.
Currently, available options are

- `:exact` for deterministic sparse linear algebra,
- `:prob` for probabilistic sparse linear algebra. Tends to be faster (default).

The algorithm automatically chooses the best monomial representation.
Otherwise, you can set `monoms` to one of the following:

- `best_monom_representation()` for automatic choice (default),
- `NotPacked{<:Unsigned}`, e.g., `NotPacked{UInt32}()`, for not packed representation with 32 bits per exponent,
- `Packed{<:Unsigned}`, e.g., `Packed{UInt8}()`, for packed representation with 8 bits per exponent.

The algorithm uses randomized hashing that depends on random number generator `rng`.

Verboseness can be tweaked with the `loglevel` parameter (default is that only warnings are produced).

Set `maxpairs` to specify the maximum number of critical pairs used at once in matrix construction.

# Example

```jldoctest
using Groebner, DynamicPolynomials
@polyvar x y;
groebner([x*y^2 + x, y*x^2 + y])
```

"""
function groebner(
    polynomials::Vector{Poly};
    reduced::Bool=true,
    ordering::AbstractMonomialOrdering=InputOrdering(),
    certify::Bool=false,
    linalg::Symbol=:prob,
    monoms=best_monom_representation(),
    rng::Rng=Random.MersenneTwister(42),
    loglevel::Logging.LogLevel=Logging.Warn,
    maxpairs=typemax(Int)
) where {Poly, Rng <: Random.AbstractRNG}
    #= set the logger =#
    prev_logger = Logging.global_logger(ConsoleLogger(stderr, loglevel))
    try
        #= guess the best representation for polynomials =#
        representation = guess_effective_representation(
            polynomials,
            UnsafeRepresentation(),
            ordering,
            monoms
        )
        #= try to compute in this representation =#
        return groebner(
            polynomials,
            representation,
            reduced,
            ordering,
            certify,
            linalg,
            rng,
            maxpairs
        )
    catch beda
        if isa(beda, RecoverableException)
            # if computation fails recoverably
            @warn "RecoverableException caught. Restarting with safe parameters.."
            representation = default_safe_representation()
            linalg = safe_linear_algebra()
            rng = Random.MersenneTwister(floor(Int, time()))
            return groebner(
                polynomials,
                representation,
                reduced,
                ordering,
                certify,
                linalg,
                rng,
                maxpairs
            )
        else
            # if the computation just fails for some reason
            rethrow(beda)
        end
    finally
        #= revert logger =#
        Logging.global_logger(prev_logger)
    end
end

"""
    function isgroebner(
        polynomials;
        ordering=InputOrdering(),
        certify=false,
        rng=MersenneTwister(42),
        loglevel=Logging.Warn
    )

Checks if `polynomials` forms a Groebner basis.

Uses the ordering on `polynomials` by default.
If `ordering` is explicitly specified, it takes precedence.

By default, a fast randomized algorithm is used. Use `certify=true` 
to obtain a guaranteed result.

# Example

```jldoctest
julia> using Groebner, DynamicPolynomials
julia> @polyvar x y;
julia> isgroebner([y^2 + x, x^2 + y])
```

"""
function isgroebner(
    polynomials::Vector{Poly};
    ordering=InputOrdering(),
    certify::Bool=false,
    rng::Rng=Random.MersenneTwister(42),
    loglevel::LogLevel=Logging.Warn
) where {Poly, Rng <: Random.AbstractRNG}

    #= set the logger =#
    prev_logger = Logging.global_logger(ConsoleLogger(stderr, loglevel))

    #= extract ring information, exponents and coefficients
       from input polynomials =#
    # Copies input, so that polys would not be changed itself.
    ring, exps, coeffs =
        convert_to_internal(default_safe_representation(), polynomials, ordering)

    #= check and set algorithm parameters =#
    metainfo = set_metaparameters(ring, ordering, certify, :exact, rng)
    # now ring stores computation ordering
    # metainfo is now a struct to store target ordering

    iszerobasis = remove_zeros_from_input!(ring, exps, coeffs)
    iszerobasis && (return true)

    #= change input ordering if needed =#
    newring = assure_ordering!(ring, exps, coeffs, metainfo.targetord)

    #= check if groebner basis =#
    flag = isgroebner(newring, exps, coeffs, metainfo)

    #=
    Assuming ordering of `bexps` here matches `ring.ord`
    =#

    #= revert logger =#
    Logging.global_logger(prev_logger)

    flag
end

"""
    function normalform(
        basis,
        tobereduced;
        check=true,
        ordering=InputOrdering(),
        rng=MersenneTwister(42),
        loglevel=Logging.Warn
    )

Computes the normal form of `tobereduced` w.r.t `basis`.

`tobereduced` can be either a single polynomial or an array of polynomials.
In the latter case, normal form is computed for each of its entries 
*(which is faster than computing separately)*.

The `basis` is assumed to be a Groebner basis.
If `check=true`, we use randomized algorithm to quickly check 
if `basis` is indeed a Groebner basis (default).

Uses the ordering on `basis` by default.
If `ordering` is explicitly specified, it takes precedence.

# Example

```jldoctest
julia> using Groebner, DynamicPolynomials
julia> @polyvar x y;
julia> normalform([y^2 + x, x^2 + y], x^2 + y^2 + 1, check=false)
```

"""
function normalform(
    basispolys::Vector{Poly},
    tobereduced::Poly;
    check::Bool=true,
    ordering::AbstractMonomialOrdering=InputOrdering(),
    rng::Rng=Random.MersenneTwister(42),
    loglevel::LogLevel=Logging.Warn
) where {Poly, Rng <: Random.AbstractRNG}
    iszero(tobereduced) && (return tobereduced)

    first(
        normalform(
            basispolys,
            [tobereduced],
            check=check,
            ordering=ordering,
            rng=rng,
            loglevel=loglevel
        )
    )
end

function normalform(
    basispolys::Vector{Poly},
    tobereduced::Vector{Poly};
    check::Bool=true,
    ordering::AbstractMonomialOrdering=InputOrdering(),
    rng::Rng=Random.MersenneTwister(42),
    loglevel::LogLevel=Logging.Warn
) where {Poly, Rng <: Random.AbstractRNG}

    #= set the logger =#
    prev_logger = Logging.global_logger(ConsoleLogger(stderr, loglevel))

    check && _check_isgroebner(basispolys)

    #= extract ring information, exponents and coefficients
       from input basis polynomials =#
    # Copies input, so that polys would not be changed itself.
    ring1, basisexps, basiscoeffs =
        convert_to_internal(default_safe_representation(), basispolys, ordering)
    ring2, tbrexps, tbrcoeffs =
        convert_to_internal(default_safe_representation(), tobereduced, ordering)

    @assert ring1.nvars == ring2.nvars && ring1.ch == ring2.ch
    @assert ring1.ord == ring2.ord

    ring = ring1

    #= check and set algorithm parameters =#
    metainfo = set_metaparameters(ring, ordering, false, :exact, rng)

    # remove zeros from input
    input_sz = length(tbrexps)
    nonzero_indices = filter(i -> !isempty(tbrexps[i]), 1:input_sz)
    tbrexps = tbrexps[nonzero_indices]
    tbrcoeffs = tbrcoeffs[nonzero_indices]

    if isempty(tbrexps)
        for i in 1:input_sz
            push!(tbrexps, empty(basisexps[1]))
            push!(tbrcoeffs, empty(basiscoeffs[1]))
        end
        return convert_to_output(ring, tobereduced, tbrexps, tbrcoeffs, metainfo)
    end

    #= change input ordering if needed =#
    newring = assure_ordering!(ring, basisexps, basiscoeffs, metainfo.targetord)
    newring = assure_ordering!(ring, tbrexps, tbrcoeffs, metainfo.targetord)

    # We assume basispolys is already a Groebner basis! #

    #= compute the groebner basis =#
    bexps, bcoeffs =
        normal_form_f4(newring, basisexps, basiscoeffs, tbrexps, tbrcoeffs, rng)

    # bring back zeros
    bexps_with_zeros = Vector{eltype(bexps)}(undef, input_sz)
    bcoeffs_with_zeros = Vector{eltype(bcoeffs)}(undef, input_sz)
    bexps_with_zeros[nonzero_indices] = bexps
    bcoeffs_with_zeros[nonzero_indices] = bcoeffs
    for i in 1:input_sz
        if !(i in nonzero_indices)
            bexps_with_zeros[i] = empty(basisexps[1])
            bcoeffs_with_zeros[i] = empty(basiscoeffs[1])
        end
    end
    #=
    Assuming ordering of `bexps` here matches `newring.ord`
    =#

    #= revert logger =#
    Logging.global_logger(prev_logger)

    # ring contains ordering of computation, it is the requested ordering
    #= convert result back to representation of input =#
    convert_to_output(newring, tobereduced, bexps_with_zeros, bcoeffs_with_zeros, metainfo)
end

"""
    function fglm(
        basis;
        check=true,
        rng=MersenneTwister(42),
        loglevel=Warn
    )

Applies FGLM algorithm to `basis` and returns a Groebner basis in `lex` ordering.

The `basis` is assumed to be a Groebner basis.
If `check=true`, we use randomized algorithm to quickly check 
if `basis` is indeed a Groebner basis (default).

# Example

```jldoctest
julia> using Groebner, DynamicPolynomials
julia> @polyvar x y;
julia> fglm([y^2 + x, x^2 + y], check=true)
```

"""
function fglm(
    basis::Vector{Poly};
    check::Bool=true,
    rng::Rng=Random.MersenneTwister(42),
    loglevel::Logging.LogLevel=Logging.Warn
) where {Poly, Rng <: Random.AbstractRNG}

    #= set the logger =#
    prev_logger = Logging.global_logger(ConsoleLogger(stderr, loglevel))

    check && _check_isgroebner(basis)

    #= extract ring information, exponents and coefficients
       from input polynomials =#
    # Copies input, so that polynomials would not be changed itself.
    ring, exps, coeffs =
        convert_to_internal(default_safe_representation(), basis, InputOrdering())

    metainfo = set_metaparameters(ring, Lex(), false, :exact, rng)

    iszerobasis = remove_zeros_from_input!(ring, exps, coeffs)
    iszerobasis && (return convert_to_output(ring, basis, exps, coeffs, metainfo))

    bexps, bcoeffs = fglm_f4(ring, exps, coeffs, metainfo)
    newring = PolyRing(ring.nvars, Lex(), ring.ch, ring.origring)

    # ordering in bexps here matches target ordering in metainfo

    #= revert logger =#
    Logging.global_logger(prev_logger)

    # ring contains ordering of computation, it is the requested ordering
    #= convert result back to representation of input =#
    convert_to_output(newring, basis, bexps, bcoeffs, metainfo)
end

"""
    function kbase(
        basis;
        check=true,
        rng=MersenneTwister(42),
        loglevel=Warn
    )

Computes the basis of polynomial ring modulo the zero-dimensional ideal
generated by `basis` as a basis of vector space.

The `basis` is assumed to be a Groebner basis.
If `check=true`, we use randomized algorithm to quickly check 
if `basis` is indeed a Groebner basis (default).

# Example

```jldoctest
julia> using Groebner, DynamicPolynomials
julia> @polyvar x y;
julia> kbase([y^2 + x, x^2 + y], check=true)
```

"""
function kbase(
    basis::Vector{Poly};
    check::Bool=true,
    rng::Rng=Random.MersenneTwister(42),
    loglevel::Logging.LogLevel=Logging.Warn
) where {Poly, Rng <: Random.AbstractRNG}

    #= set the logger =#
    prev_logger = Logging.global_logger(ConsoleLogger(stderr, loglevel))

    check && _check_isgroebner(basis)

    #= extract ring information, exponents and coefficients
       from input polynomials =#
    # Copies input, so that polynomials would not be changed itself.
    ring, exps, coeffs =
        convert_to_internal(default_safe_representation(), basis, InputOrdering())

    metainfo = set_metaparameters(ring, InputOrdering(), false, :exact, rng)

    iszerobasis = remove_zeros_from_input!(ring, exps, coeffs)
    iszerobasis &&
        (throw(DomainError(basis, "Groebner.kbase does not work with such ideals, sorry")))

    bexps, bcoeffs = kbase_f4(ring, exps, coeffs, metainfo)

    # ordering in bexps here matches target ordering in metainfo

    #= revert logger =#
    Logging.global_logger(prev_logger)

    # ring contains ordering of computation, it is the requested ordering
    #= convert result back to representation of input =#
    convert_to_output(ring, basis, bexps, bcoeffs, metainfo)
end
