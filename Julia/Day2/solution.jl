using Chain


d = [
"Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green",
"Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue",
"Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red",
"Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red",
"Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"
]

g = d[1]


@chain g begin
    SubString(_, 9,)
    split(_,';')
    games = _
end

games


@chain games begin
    filter.((x -> isdigit(x)), collect(_))
    filter.((x -> !isempty(x)), collect(_))
end


@chain games begin
    filter.((x -> !isdigit(x)), collect(_))
    filter.((x -> !isspace(x)), collect(_))
    vv = _
end

colors = Dict(
    "blue" => 0,
    "red" => 0,
    "green" => 0
)

vv[1]

findfirst("blue", vv[1])

for i ∈ keys(colors)
    findfirst(i, vv[i])
end
