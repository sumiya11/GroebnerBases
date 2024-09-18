# This file is a part of Groebner.jl. License is GNU GPL v2.

"""
    groebner(polynomials; options...)

Computes a Groebner basis of the ideal generated by `polynomials`.

## Arguments

- `polynomials`: an array of polynomials. Supports polynomials from
    AbstractAlgebra.jl, Nemo.jl, and DynamicPolynomials.jl. For
    AbstractAlgebra.jl and Nemo.jl, the coefficients of polynomials must be
    either in `GF(p)`, in `Native.GF(p)`, or in `QQ`.

## Possible Options

The `groebner` routine takes the following optional arguments:
- `reduced`: If the returned basis must be autoreduced and unique (default is
  `true`).
- `ordering`: Specifies the monomial ordering. Available monomial orderings are: 
    - `InputOrdering()` for inferring the ordering from the given `polynomials`
      (default), 
    - `Lex(args...)` for lexicographic, 
    - `DegLex(args...)` for degree lexicographic, 
    - `DegRevLex(args...)` for degree reverse lexicographic, 
    - `WeightedOrdering(args...)` for weighted ordering, 
    - `ProductOrdering(args...)` for block ordering, 
    - `MatrixOrdering(args...)` for matrix ordering. For details and examples
        see the corresponding documentation page.
- `certify`: Certify the obtained basis. When this option is `false`, the
    algorithm is randomized, and the result is correct with high probability.
    When this option is `true`, the result is guaranteed to be correct in case
    the ideal is homogeneous (default is `false`). 
- `linalg`: Linear algebra backend. Available options are: 
    - `:auto` for the automatic choice (default),
    - `:deterministic` for deterministic sparse linear algebra, 
    - `:randomized` for probabilistic sparse linear algebra.
- `threaded`: The use of multi-threading. Available options are: 
    - `:auto` for the automatic choice (default),
    - `:no` never use multi-threading, 
    - `:yes` allow the use of multi-threading.
    Additionally, you can set the environment variable `GROEBNER_NO_THREADED` to
    `1` to disable all multi-threading in Groebner.jl. In this case, the
    environment variable takes precedence over the `threaded` option.
- `monoms`: Monomial representation used in the computations. The algorithm
    tries to automatically choose the most suitable monomial representation.
    Otherwise, set `monoms` to one of the following: 
    - `:auto` for the automatic choice (default), 
    - `:dense` for classic dense exponent vectors,
    - `:packed` for packed representation, 
- `modular`: Modular computation algorithm. Only has effect when computing basis
    over the rational numbers. Possible options are:
    - `:auto` for the automatic choice (default),
    - `:classic_modular` for the classic multi-modular algorithm,
    - `:learn_and_apply` for the learn & apply algorithm.
- `seed`: The seed for randomization. Default value is `42`. Groebner uses
    `Random.Xoshiro` and `Random.MersenneTwister` for random number generation.
- `loglevel`: Logging level, one of `:all`, `:debug`, `:info`, `:warn`, `:no`,
    or an integer. An integer `0` is equivalent to `:info`, and lower integer
    values mean more verbose. Default is `:info`.
- `homogenize`: Controls the use of homogenization in the algorithm. Possible
  options are:
    - `:yes`, always homogenize the input ideal,
    - `:no`, never homogenize the input ideal,
    - `:auto`, for the automatic choice (default).

## Example

Using DynamicPolynomials.jl:

```jldoctest
using Groebner, DynamicPolynomials
@polyvar x y
groebner([x*y^2 + x, y*x^2 + y])
```

Using AbstractAlgebra.jl:

```jldoctest
using Groebner, AbstractAlgebra
R, (x, y) = QQ["x", "y"]
groebner([x*y^2 + x, y*x^2 + y])
```

Using Nemo.jl:

```jldoctest
using Groebner, Nemo
R, (x, y) = GF(2^30+3)["x", "y"]
groebner([x*y^2 + x, y*x^2 + y])
```

Or, say, in another monomial ordering:

```jldoctest
# y > x
groebner([x*y^2 + x, y*x^2 + y], ordering=Lex(y, x))

# degree reverse lexicographic
groebner([x*y^2 + x, y*x^2 + y], ordering=DegRevLex())
```

## Notes

The function `groebner` is thread-safe.

The default algorithm is probabilistic (with `certify=false`). Results are
correct with high probability, however, no precise bound on the probability is
known.
"""
function groebner(polynomials::AbstractVector; options...)
    keywords = KeywordArguments(:groebner, options)
    result = groebner0(polynomials, keywords)
    result
end

"""
    groebner(ring, monoms, coeffs; options...)

Computes a Groebner basis. This function is a part of low level interface.

## Arguments

- `ring`: polynomial ring, a `PolyRing` object.
- `monoms`: vector of monomials of input polynomials.
- `coeffs`: vector of coefficients of input polynomials.

## Returns

Returns a tuple (`gb_monoms`, `gb_coeffs`), the monomials and the coefficients
of the resulting Groebner basis, respectively.

## Possible Options

Same as for `groebner`.

## Example

Computing a Groebner basis of a bivariate ideal modulo 65537 in degrevlex:

```jldoctest
using Groebner
ring = Groebner.PolyRing(2, Groebner.DegRevLex(), 65537)
# {x y - 1,  x^3 + 7 y^2}
monoms = [ [[1, 1], [0, 0]], [[3, 0], [0, 2]] ]
coeffs = [ [1,65536], [1, 7] ]
Groebner.groebner(ring, monoms, coeffs)
```

## Notes

Same as for `groebner`.
"""
function groebner(ring::PolyRing, monoms::AbstractVector, coeffs::AbstractVector; options...)
    keywords = KeywordArguments(:groebner, options)
    ir_is_valid_basic(ring, monoms, coeffs)
    result = groebner1(ring, monoms, coeffs, keywords)
    result
end

"""
    groebner_with_change_matrix(polynomials; options...)

Computes a Groebner basis of the ideal generated by `polynomials` and emits a
change matrix, that is, a map from the original generators to basis elements.

## Arguments

- `polynomials`: an array of polynomials. Supports polynomials from
    AbstractAlgebra.jl, Nemo.jl, and DynamicPolynomials.jl. For
    AbstractAlgebra.jl and Nemo.jl, the coefficients of polynomials must be
    either in `GF(p)`, in `Native.GF(p)`, or in `QQ`.

## Possible Options

Same as for `groebner`.

## Example

Using AbstractAlgebra.jl:

```jldoctest
using Groebner, AbstractAlgebra
R, (x, y) = QQ["x", "y"]
f = [x*y^2 + x, y*x^2 + y]

g, m = groebner_with_change_matrix(f, ordering=DegRevLex())

@assert isgroebner(g, ordering=DegRevLex())
@assert m * f == g
```

## Notes

Same as for `groebner`.
"""
function groebner_with_change_matrix(polynomials::AbstractVector; options...)
    keywords = KeywordArguments(:groebner_with_change_matrix, options)
    result = groebner_with_change_matrix0(polynomials, keywords)
    result
end

"""
    groebner_learn(polynomials; options...)

Computes a Groebner basis of the ideal generated by `polynomials` and emits the trace.

The trace can be used to speed up the computation of other Groebner bases, which
should be specializations of the same ideal as the one `groebner_learn` has been
applied to.

See also `groebner_apply!`.

## Arguments

- `polynomials`: an array of polynomials. Must be polynomials from
  AbstractAlgebra.jl over `GF(p)`.

## Example

Using `groebner_learn` and `groebner_apply!` over the same ground field:

```jldoctest
using Groebner, AbstractAlgebra
R, (x, y) = GF(2^31-1)["x", "y"]

# Learn
trace, gb_1 = groebner_learn([x*y^2 + x, y*x^2 + y])

# Apply (same support, different coefficients)
flag, gb_2 = groebner_apply!(trace, [2x*y^2 + 3x, 4y*x^2 + 5y])

@assert flag
```

Using `groebner_learn` and `groebner_apply!` over different ground fields:

```jldoctest
using Groebner, AbstractAlgebra
R, (x, y) = GF(2^31-1)["x", "y"]

# Learn
trace, gb_1 = groebner_learn([x*y^2 + x, y*x^2 + y], ordering=DegRevLex())

# Create a ring with a different modulo
R2, (x2, y2) = GF(2^30+3)["x", "y"]

# Apply (different modulo)
flag, gb_2 = groebner_apply!(
    trace, 
    [2x2*y2^2 + 3x2, 4y2*x2^2 + 5y2], 
    ordering=DegRevLex()
)

@assert flag
@assert gb_2 == groebner([2x2*y2^2 + 3x2, 4y2*x2^2 + 5y2], ordering=DegRevLex())
```

Using `groebner_apply!` in batches (works only in `:degrevlex` at the moment):

```jldoctest
using Groebner, AbstractAlgebra
R, (x, y) = polynomial_ring(GF(2^31-1), ["x", "y"], internal_ordering=:degrevlex)

# Learn
trace, gb_1 = groebner_learn([x*y^2 + x, y*x^2 + y])

# Create rings with some other moduli
R2, (x2, y2) = polynomial_ring(GF(2^30+3), ["x", "y"], internal_ordering=:degrevlex)
R3, (x3, y3) = polynomial_ring(GF(2^27+29), ["x", "y"], internal_ordering=:degrevlex)

# Two specializations of the same ideal
batch = ([2x2*y2^2 + 3x2, 4y2*x2^2 + 5y2], [4x3*y3^2 + 4x3, 5y3*x3^2 + 7y3])

# Apply for two sets of polynomials at once
flag, (gb_2, gb_3) = groebner_apply!(trace, batch)

@assert flag
@assert (gb_2, gb_3) == map(groebner, batch)
```

Perhaps, in a more involved example, we will compute Groebner bases of the
Katsura-9 system:

```jldoctest
using Groebner, AbstractAlgebra, BenchmarkTools

# Create the system
kat = Groebner.Examples.katsuran(9, k=ZZ, internal_ordering=:degrevlex)

# Reduce the coefficients modulo 5 different primes
kat_0 = map(f -> map_coefficients(c -> GF(2^30 + 3)(c), f), kat)
kat_1 = map(f -> map_coefficients(c -> GF(2^30 + 7)(c), f), kat)
kat_2 = map(f -> map_coefficients(c -> GF(2^30 + 9)(c), f), kat)
kat_3 = map(f -> map_coefficients(c -> GF(2^30 + 15)(c), f), kat)
kat_4 = map(f -> map_coefficients(c -> GF(2^30 + 19)(c), f), kat)

# Learn the trace
trace, gb_0 = groebner_learn(kat_0);

# Compare the performance of applying with 1 input and with 4 different inputs:

# Apply for one system
@btime groebner_apply!(\$trace, \$kat_1);
#  46.824 ms (19260 allocations: 24.48 MiB)

# Apply for a batch of four systems
@btime groebner_apply!(\$trace, \$(kat_1, kat_2, kat_3, kat_4));
#  72.813 ms (23722 allocations: 59.44 MiB)
```

Observe the better amortized performance of the batched `groebner_apply!`.

## Notes

The function `groebner_learn` is thread-safe.
"""
function groebner_learn(polynomials::AbstractVector; options...)
    keywords = KeywordArguments(:groebner_learn, options)
    result = groebner_learn0(polynomials, keywords)
    result
end

"""
    groebner_learn(ring, monoms, coeffs; options...)

Computes a Groebner basis and emits the trace.
"""
function groebner_learn(ring::PolyRing, monoms::AbstractVector, coeffs::AbstractVector; options...)
    keywords = KeywordArguments(:groebner_learn, options)
    ir_is_valid_basic(ring, monoms, coeffs)
    result = groebner_learn1(ring, monoms, coeffs, keywords)
    result
end

"""
    groebner_apply!(trace, polynomials; options...)
    groebner_apply!(trace, batch::NTuple{N, Vector}; options...)

Computes a Groebner basis of the ideal generated by `polynomials` following the given `trace`. 

See also `groebner_learn`.

## Arguments

- `trace`: a trace from `groebner_learn`.
- `polynomials`: an array of polynomials. Must be polynomials from
    AbstractAlgebra.jl over `GF(p)`. It is possible to supply a tuple of `N`
    arrays to compute `N` Groebner bases simultaneously, which could be more
    efficient overall than computing them in separate.

## Possible Options

The `groebner_apply!` routine automatically inherits most parameters from the
given `trace`.

## Example

For examples, see the documentation of `groebner_learn`.

## Notes

This function is **not** thread-safe, since it mutates the `trace`.
"""
function groebner_apply! end

# Specialization for a single input
function groebner_apply!(trace::WrappedTrace, polynomials::AbstractVector; options...)
    keywords = KeywordArguments(:groebner_apply!, options)
    result = groebner_apply0!(trace, polynomials, keywords)
    result
end

const _supported_batch_size = (1, 2, 4, 8, 16, 32, 64, 128)

# Specialization for a batch of inputs
function groebner_apply!(
    trace::WrappedTrace,
    batch::NTuple{N, T}; # deliberately not ::Tuple{T, Vararg{T, Nminus1}}
    options...
) where {N, T <: AbstractVector}
    !(N in _supported_batch_size) &&
        throw(DomainError("The batch size must be one of the following: $_supported_batch_size"))
    keywords = KeywordArguments(:groebner_apply!, options)
    result = groebner_apply_batch0!(trace, batch, keywords)
    result
end

# Low level specialization for a single input
function groebner_apply!(
    trace::WrappedTrace,
    ring::PolyRing,
    monoms::AbstractVector,
    coeffs::AbstractVector;
    options...
)
    keywords = KeywordArguments(:groebner_apply!, options)
    ir_is_valid_basic(ring, monoms, coeffs)
    result = groebner_apply1!(trace, ring, monoms, coeffs, keywords)
    result
end

# Low level specialization for a batch of inputs
function groebner_apply!(trace::WrappedTrace, batch::NTuple{N, T}; options...) where {N, T}
    !(N in _supported_batch_size) &&
        throw(DomainError("The batch size must be one of the following: $_supported_batch_size"))
    keywords = KeywordArguments(:groebner_apply!, options)
    ir_is_valid_basic(batch)
    result = groebner_apply_batch1!(trace, batch, keywords)
    result
end

"""
    isgroebner(polynomials; options...)

Checks if `polynomials` forms a Groebner basis.

## Arguments

- `polynomials`: an array of polynomials. Supports polynomials from
    AbstractAlgebra.jl, Nemo.jl, and DynamicPolynomials.jl. For
    AbstractAlgebra.jl and Nemo.jl, the coefficients of polynomials must be
    either in `GF(p)`, in `Native.GF(p)`, or in `QQ`.

## Possible Options

The `isgroebner` routine takes the following optional arguments:
- `ordering`: Specifies the monomial ordering. Available monomial orderings are: 
    - `InputOrdering()` for inferring the ordering from the given `polynomials`
      (default), 
    - `Lex()` for lexicographic, 
    - `DegLex()` for degree lexicographic, 
    - `DegRevLex()` for degree reverse lexicographic, 
    - `WeightedOrdering(weights)` for weighted ordering, 
    - `ProductOrdering(args...)` for block ordering, 
    - `MatrixOrdering(matrix)` for matrix ordering. 
  For details and examples see the corresponding documentation page.
- `certify`: Use deterministic algorithm (default is `false`).
- `seed`: The seed for randomization. Default value is `42`. Groebner uses
    `Random.Xoshiro` and `Random.MersenneTwister` for random number generation.
- `loglevel`: Logging level, one of `:all`, `:debug`, `:info`, `:warn`, `:no`,
    or an integer. An integer `0` is equivalent to `:info`, and lower integer
    values mean more verbose. Default is `:info`.

## Example

Using `DynamicPolynomials`:

```jldoctest
using Groebner, DynamicPolynomials
@polyvar x y;
isgroebner([x*y^2 + x, y*x^2 + y])
```

Using `AbstractAlgebra`:

```jldoctest
using Groebner, AbstractAlgebra
R, (x, y) = QQ["x", "y"]
isgroebner([x*y^2 + x, y*x^2 + y])
```

## Notes

The function `isgroebner` is thread-safe.
"""
function isgroebner(polynomials::AbstractVector; options...)
    keywords = KeywordArguments(:isgroebner, options)
    result = isgroebner0(polynomials, keywords)::Bool
    result
end

function isgroebner(ring::PolyRing, monoms::AbstractVector, coeffs::AbstractVector; options...)
    keywords = KeywordArguments(:isgroebner, options)
    ir_is_valid_basic(ring, monoms, coeffs)
    result = isgroebner1(ring, monoms, coeffs, keywords)
    result
end

"""
    normalform(basis, to_be_reduced; options...)

Computes the normal form of polynomials with respect to a Groebner basis.

## Arguments

- `basis`: an array of polynomials, a Groebner basis.
- `tobereduced`: can be either a single polynomial or an array of polynomials.

## Possible Options

The `normalform` routine takes the following optional arguments:
- `check`: Check if the given array `basis` forms a Groebner basis (default is `false`).
- `ordering`: Specifies the monomial ordering. Available monomial orderings are: 
    - `InputOrdering()` for inferring the ordering from the given `polynomials`
      (default), 
    - `Lex()` for lexicographic, 
    - `DegLex()` for degree lexicographic, 
    - `DegRevLex()` for degree reverse lexicographic, 
    - `WeightedOrdering(weights)` for weighted ordering, 
    - `ProductOrdering(args...)` for block ordering, 
    - `MatrixOrdering(matrix)` for matrix ordering. 
    For details and examples see the corresponding documentation page.
- `loglevel`: Logging level, one of `:all`, `:debug`, `:info`, `:warn`, `:no`,
    or an integer. An integer `0` is equivalent to `:info`, and lower integer
    values mean more verbose. Default is `:info`.

## Example

Reducing a single polynomial:

```jldoctest
using Groebner, DynamicPolynomials
@polyvar x y;
normalform([y^2 + x, x^2 + y], x^2 + y^2 + 1)
```

Or, reducing two polynomials at a time:

```jldoctest
using Groebner, DynamicPolynomials
@polyvar x y;
normalform([y^2 + x, x^2 + y], [x^2 + y^2 + 1, x^10*y^10])
```

## Notes

The function `normalform` is thread-safe.
"""
function normalform(basis::AbstractVector, to_be_reduced::AbstractVector; options...)
    keywords = KeywordArguments(:normalform, options)
    result = normalform0(basis, to_be_reduced, keywords)
    result
end

normalform(basis::AbstractVector, to_be_reduced; options...) =
    first(normalform(basis, [to_be_reduced]; options...))

function normalform(
    ring::PolyRing,
    monoms::AbstractVector,
    coeffs::AbstractVector,
    ring_to_be_reduced::PolyRing,
    monoms_to_be_reduced::AbstractVector,
    coeffs_to_be_reduced::AbstractVector;
    options...
)
    keywords = KeywordArguments(:normalform, options)
    ir_is_valid_basic(ring, monoms, coeffs)
    ir_is_valid_basic(ring_to_be_reduced, monoms_to_be_reduced, coeffs_to_be_reduced)
    result = normalform1(
        ring,
        monoms,
        coeffs,
        ring_to_be_reduced,
        monoms_to_be_reduced,
        coeffs_to_be_reduced,
        keywords
    )
    result
end
