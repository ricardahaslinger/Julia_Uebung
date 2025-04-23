
#=
Fuege in dieses Template deine Loesungscodes ein.
Wichtig 1: Die Datei gemaess der Namensrichtlinien benennen.
Wichtig 2: Bitte nur die Funktionen ausprogrammieren und keine Funktionsaufrufe vornehmen.
=#


### Beispiel 1:

function greatest(x::Vector{T}, k::Integer = 1) :: Vector{T} where {T <: Real}
    # Fuege hier deinen Loesungscode ein
    
    # Fehlermeldung fuer k
    if k <= 0 || k > length(x)
        throw(ArgumentError("0 < k <= length(x) muss gelten!"))
    end
    
    # Seiteneffekte vermeiden
    x_copy = float.(x)

    # k Anzahl an groessten Elementen finden
    max_list = []
    for i in 1:k
        max_val = findmax(x_copy)[1]
        max_ind = findmax(x_copy)[2]
        push!(max_list, max_val)
        x_copy[max_ind] = -Inf
    end

    # in Reihenfolge des Auftretens ausgeben
    res = []
    for j in x
        if j in max_list
            push!(res, j)
        end
    end

    return res

end

### Beispiel 2

function nearestindex(x::Vector{<:Real}, y::Real) :: Int
    # Fuege hier deinen Loesungscode ein

    # Start zum Vergleich
    min_diff = abs(x[1] - y)
    min_ind = [1]

    # Mininmale Differenz finden
    for i in 2:length(x)
        diff = abs(x[i] - y)

        if diff < min_diff
            min_diff = diff
            min_ind = [i]
        elseif diff == min_diff
            push!(min_ind, i)
        end

    end

    return rand(min_ind)

end


### Beispiel 3

function swap!(x::Vector, i::Integer, j::Integer) :: Nothing
    # Fuege hier deinen Loesungscode ein
    
    # Elemente an den Stellen i und j vertauschen
    temp = x[i] 
    x[i] = x[j]
    x[j] = temp

    return
end

function bubblesort!(x::Vector{<:Real}; rev::Bool = false) :: Nothing
    # Fuege hier deinen Loesungscode ein

    n = length(x)

    # Sortieren 
    for i in 1:n-1 # aeussere schleife: n-1 durchlaeufe
        for j in 1:n-i # innere schleife: benachbarte elemente vergleichen

            if (rev && x[j] < x[j+1]) || (!rev && x[j] > x[j+1])
                swap!(x, j, j+1)
            end

        end
    end

    return
end


### Beispiel 4

function canonicaltour(x::Vector{T}) :: Vector{T} where {T <: Integer}
    # Fuege hier deinen Loesungscode ein

    n = length(x)

    # Fehlermeldung fuer falsches x
    if sort(x) != collect(1:n)
        throw(ArgumentError("x must be a permutation of the numbers 1:length(x)!"))
    end

    # Dreimal x aneinander anhaengen 
    x3 = vcat(x, x, x)

    # Start bei mittlerem 1er
    start_ind = 0
    for i in n+1:2n
        if x3[i] == 1
            start_ind = i
            break
        end
    end

    # Nachbarwerte von 1 finden
    before = x3[start_ind - 1]
    after  = x3[start_ind + 1]

    # Richtung der Tour entscheiden
    if after < before
        return x3[start_ind : start_ind + n - 1]
    else
        return reverse(x3[start_ind - n + 1 : start_ind])
    end

    return
end


### Beispiel 5

function distance(x::Vector{<:Real}, y::Vector{<:Real}; p::Real = 2)
    # Fuege hier deinen Loesungscode ein

    # Fehlermeldung fuer x und y
    if length(x) != length(y)
        throw(ArgumentError("x and y should have the same length you idiot sandwich!"))
    end

    # Fehlermeldung fuer p 
    if p <= 0
        throw(ArgumentError("girl p > 0 better hold!"))
    end

    # Distanz bestimmen und ausgeben
    sum = 0.0
    for i in 1:length(x)
        sum += abs(x[i] - y[i])^p
    end

    p_dist = sum^(1/p)

    println(p_dist)

    return
end

