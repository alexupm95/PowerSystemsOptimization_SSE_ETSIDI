# =====================================================================
#                        VARIABLES DE NODO
# =====================================================================
# nodo -----------> Numero de identificación del nodo
# potencia_carga -> Potencia demandada por la carga (MW)
function nodos()
    nodo = [1; 2; 3] 
    potencia_carga = [0; 60; 60]

    return nodo, potencia_carga
end

# =====================================================================
#                    VARIABLES DE GENERACIÓN
# =====================================================================
# generador -------> Numero de identificación del generador
# minima_potencia -> Minima potencia generada (MW)
# maxima_potencia -> Maxima potencia generada (MW)
# coste -----------> Coste de generación (€/MW)
function generadores()
    generador = [1; 2; 3] 
    minima_potencia = [10; 10; 10]
    maxima_potencia = [150; 100; 50]
    coste = [25; 15; 30]

    return generador, minima_potencia, maxima_potencia, coste
end


# =====================================================================
#                        VARIABLES DE LÍNEA
# =====================================================================
# linea ------------> Numero de identificación de la línea
# de_nodo ----------> Numero del nodo donde empieza la línea
# para_nodo --------> Numero del nodo donde termina la línea
# susceptancia -----> Susceptancia série de la línea (p.u)
# maxima_potencia -> Máxima potencia transportada por la línea (MW) 
function lineas()
    linea = [1; 2; 3]
    de_nodo = [1; 1; 2]
    para_nodo = [2; 3; 3]
    susceptancia = [10; 10; 10]
    maxima_potencia = [40; 80; 30]

    return linea, de_nodo, para_nodo, susceptancia, maxima_potencia
end