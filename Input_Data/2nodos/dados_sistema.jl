# =====================================================================
#                        VARIABLES DE NODO
# =====================================================================
# nodo -----------> Numero de identificación del nodo
# tipo_nodo ------> Tipo del nodo: (3 = SW), (2 = PV) or (1 = PQ) 
# potencia_carga -> Potencia demandada por la carga (MW)
function nodos()
    nodo = [1; 2] 
    tipo_nodo = [3; 2] 
    potencia_carga = [70; 150]

    return nodo, tipo_nodo, potencia_carga
end

# =====================================================================
#                    VARIABLES DE GENERACIÓN
# =====================================================================
# generador -------> Numero de identificación del generador
# maxima_potencia -> Maxima potencia generada (MW)
# custo -----------> Custo de generación (€/MW)
function generadores()
    generador = [1; 2] 
    maxima_potencia = [200; 200]
    custo = [20; 30]

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
    linea = [1]
    de_nodo = [1]
    para_nodo = [2]
    susceptancia = [10]
    maxima_potencia = [200]

    return linea, de_nodo, para_nodo, susceptancia, maxima_potencia
end