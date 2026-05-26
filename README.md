# Bellman-Ford en Julia

## Descripción

Este proyecto implementa el algoritmo Bellman-Ford en Julia.

El algoritmo permite encontrar las distancias mínimas desde un nodo origen hacia todos los demás nodos de un grafo ponderado. También puede detectar ciclos negativos.

---

## Requisitos

* Julia 1.8 o superior

Verificar instalación:

```bash id="rfxs1n"
julia --version
```

---

## Ejecución

1. Abrir la terminal en la carpeta del proyecto.

2. Ejecutar:

```bash id="my5gzc"
julia bellman_ford.jl
```

---

## Casos de prueba

* Grafo normal
* Nodo desconectado
* Pesos negativos
* Detección de ciclo negativo

---

## Complejidad

* Tiempo: O(V × E)
* Espacio: O(V)

Donde:

* V = vértices
* E = aristas

---

## Autor

[Tu Nombre]
