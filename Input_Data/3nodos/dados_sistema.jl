# =====================================================================
#                        VARIABLES DE NODO
# =====================================================================
# nodo -----------> Numero de identificación del nodo
# tipo_nodo ------> Tipo del nodo: (3 = SW), (2 = PV) or (1 = PQ) 
# potencia_carga -> Potencia demandada por la carga (MW)
function nodos()
    nodo = [1; 2; 3] 
    tipo_nodo = [3; 2; 2] 
    potencia_carga = [0; 60; 60]

    return nodo, tipo_nodo, potencia_carga
end

# =====================================================================
#                    VARIABLES DE GENERACIÓN
# =====================================================================
# generador -------> Numero de identificación del generador
# maxima_potencia -> Maxima potencia generada (MW)
# custo -----------> Custo de generación (€/MW)
function generadores()
    generador = [1; 2; 3] 
    maxima_potencia = [150; 100; 50]
    custo = [25; 15; 30]

    return generador, maxima_potencia, custo
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