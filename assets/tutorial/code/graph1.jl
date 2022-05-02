# This file was generated, do not modify it. # hide
# hideall
xs = [0.5, 1.0, 0.5, 0.0]
ys = [-sqrt(3) / 6, 0.0, -1.0, 0.0]
nodelabeldist = 1.5
nodelabel = collect(1:4)
draw(SVG(joinpath(@OUTPUT, "graph.svg"), 16cm, 16cm), gplot(g, xs, ys, nodelabel=nodelabel, nodelabeldist=nodelabeldist));