R, (a_21, a_31, a_32, a_41, a_42, a_43, b_1, b_2, b_3, b_4) = polynomial_ring(
    QQ,
    ["a_21", "a_31", "a_32", "a_41", "a_42", "a_43", "b_1", "b_2", "b_3", "b_4"]
)

system = [
    b_1 + b_2 + b_3 + b_4 - 1,
    2 * a_21 * b_2 +
    2 * a_31 * b_3 +
    2 * a_32 * b_3 +
    2 * a_41 * b_4 +
    2 * a_42 * b_4 +
    2 * a_43 * b_4 - 1,
    6 * a_21 * a_32 * b_3 + 6 * a_21 * a_42 * b_4 + 6 * a_31 * a_43 * b_4 + 6 * a_32 * a_43 * b_4 - 1,
    3 * a_21^2 * b_2 +
    3 * a_31^2 * b_3 +
    6 * a_31 * a_32 * b_3 +
    3 * a_32^2 * b_3 +
    3 * a_41^2 * b_4 +
    6 * a_41 * a_42 * b_4 +
    6 * a_41 * a_43 * b_4 +
    3 * a_42^2 * b_4 +
    6 * a_42 * a_43 * b_4 +
    3 * a_43^2 * b_4 - 1,
    24 * a_21 * a_32 * a_43 * b_4 - 1,
    12 * a_21^2 * a_32 * b_3 +
    12 * a_21^2 * a_42 * b_4 +
    12 * a_31^2 * a_43 * b_4 +
    24 * a_31 * a_32 * a_43 * b_4 +
    12 * a_32^2 * a_43 * b_4 - 1,
    8 * a_21 * a_31 * a_32 * b_3 +
    8 * a_21 * a_32^2 * b_3 +
    8 * a_21 * a_41 * a_42 * b_4 +
    8 * a_21 * a_42^2 * b_4 +
    8 * a_21 * a_42 * a_43 * b_4 +
    8 * a_31 * a_41 * a_43 * b_4 +
    8 * a_31 * a_42 * a_43 * b_4 +
    8 * a_31 * a_43^2 * b_4 +
    8 * a_32 * a_41 * a_43 * b_4 +
    8 * a_32 * a_42 * a_43 * b_4 +
    8 * a_32 * a_43^2 * b_4 - 1,
    4 * a_21^3 * b_2 +
    4 * a_31^3 * b_3 +
    12 * a_31^2 * a_32 * b_3 +
    12 * a_31 * a_32^2 * b_3 +
    4 * a_32^3 * b_3 +
    4 * a_41^3 * b_4 +
    12 * a_41^2 * a_42 * b_4 +
    12 * a_41^2 * a_43 * b_4 +
    12 * a_41 * a_42^2 * b_4 +
    24 * a_41 * a_42 * a_43 * b_4 +
    12 * a_41 * a_43^2 * b_4 +
    4 * a_42^3 * b_4 +
    12 * a_42^2 * a_43 * b_4 +
    12 * a_42 * a_43^2 * b_4 +
    4 * a_43^3 * b_4 - 1
]
