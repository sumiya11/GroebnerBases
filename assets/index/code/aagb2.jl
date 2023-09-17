# This file was generated, do not modify it. # hide
ordering = Lex(z) * DegRevLex(x, y)  # z > x, y
groebner(polys, ordering=ordering)