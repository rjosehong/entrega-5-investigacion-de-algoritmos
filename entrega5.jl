function bellman_ford(vertices, edges, start)

    # Verificar que el nodo inicial exista
    if !(start in vertices)
        error("El nodo inicial no existe.")
    end

    # Inicializar distancias
    distances = Dict()

    for v in vertices
        distances[v] = Inf
    end

    distances[start] = 0

    # RELAJACIÓN DE ARISTAS
    # Se repite |V| - 1 veces
    for i in 1:(length(vertices)-1)

        updated = false

        for (u, v, weight) in edges

            # Si el nodo origen es alcanzable
            if distances[u] != Inf

                new_distance = distances[u] + weight

                # Relajación
                if new_distance < distances[v]
                    distances[v] = new_distance
                    updated = true
                end
            end
        end

        # Optimización:
        # Si no hubo cambios, terminar antes
        if !updated
            break
        end
    end

    # DETECCIÓN DE CICLOS NEGATIVOS

    for (u, v, weight) in edges

        if distances[u] != Inf &&
           distances[u] + weight < distances[v]

            error("El grafo contiene un ciclo negativo.")
        end
    end

    return distances
end

# CASOS DE PRUEBA

println("CASO 1: Grafo normal\n")

vertices1 = ["A", "B", "C", "D", "E"]

edges1 = [
    ("A", "B", 4),
    ("A", "C", 2),
    ("B", "C", 3),
    ("B", "D", 2),
    ("B", "E", 3),
    ("C", "B", 1),
    ("C", "D", 4),
    ("C", "E", 5),
    ("E", "D", -5)
]

result1 = bellman_ford(vertices1, edges1, "A")

println("Distancias mínimas desde A:")
println(result1)

println("CASO 2: Nodo desconectado\n")

vertices2 = [1, 2, 3, 4]

edges2 = [
    (1, 2, 5),
    (2, 3, 2)
]

result2 = bellman_ford(vertices2, edges2, 1)

println("Distancias mínimas desde 1:")
println(result2)

println("CASO 3: Grafo con pesos negativos")

vertices3 = ["X", "Y", "Z"]

edges3 = [
    ("X", "Y", 4),
    ("X", "Z", 5),
    ("Y", "Z", -2)
]

result3 = bellman_ford(vertices3, edges3, "X")

println("Distancias mínimas desde X:")
println(result3)

println("CASO BORDE: Ciclo negativo\n")

vertices4 = ["A", "B", "C"]

edges4 = [
    ("A", "B", 1),
    ("B", "C", -1),
    ("C", "A", -1)
]

try
    bellman_ford(vertices4, edges4, "A")
catch e
    println("Error detectado correctamente:")
    println(e)
end