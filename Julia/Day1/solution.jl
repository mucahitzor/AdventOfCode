using Base: SkipMissing
using Chain

# part 1: combine the first and last digits to form
# a two digit number. than sum them all
d = [ 
"1abc2",
"pqr3stu8vwx",
"a1b2c3d4e5f",
"treb7uchet"]
d

s = d[3]

ds = isdigit.(collect(s))
ds

n = @chain s begin
    filter(x -> isdigit(x), _)
    string(first(_), last(_))
    parse(Int,_)
end

n

function parseNum(st)
    @chain st begin 
        filter((x -> isdigit(x)), _)
        string(first(_), last(_))
        parse(Int,_)
        n = _
    end
    return(n)
end

dRes = @chain d begin
    map((x -> parseNum(x)), _)
    sum(_)
end

## solve for input
input = readlines("./input.txt");

inputRes = @chain input begin
    map((x -> parseNum(x)), _)
    sum(_)
end
#---------------------------------------
# part2: 

# solve for dummy
d =[ 
    "two1nine",
    "eightwothree",
    "abcone2threexyz",
    "xtwone3four",
    "4nineeightseven2",
    "zoneight234",
    "7pqrstsixteen"]

numWords = Dict(
    "one" => "1",
    "two" => "2",
    "three" => "3",
    "four" => "4",
    "five" => "5",
    "six" => "6",
    "seven" => "7",
    "eight" => "8",
    "nine" => "9",
)



g = d[2]
g

@chain g begin
        findfirst.(keys(numWords), _)
        filter((x -> !isnothing(x)), _)
        b = sort(_)
    end

if (length(b) != 0)
    v = b[1]
    g = replace(g, g[v] => numWords[g[v]])
end




function prepCoords(g)
    cond = true
    while cond
    @chain g begin
            findfirst.(keys(numWords), _)
            filter((x -> !isnothing(x)), _)
            b = sort(_)
        end
    if (length(b) != 0)
        v = b[1]
        g = replace(g, g[v] => numWords[g[v]])
    elseif (length(b) == 0)
            cond = false
    end
end
    return(g)
end

@chain d begin
    map((x -> prepCoords(x)), _)
    map((x -> parseNum(x)), _)
    sum(_)
end


# solve for actula input
#

input;


@chain input begin
    map((x -> prepCoords(x)), _)
    map((x -> parseNum(x)), _)
    sum(_)
end


