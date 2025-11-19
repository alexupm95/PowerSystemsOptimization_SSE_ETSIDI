cd(dirname(@__FILE__));
carpeta_actual = pwd();
#=
CÓDIGO PARA RESOLVER EL FLUJO DE POTENCIA LINEAL (DC-OPF)

Autor:      Alex Junior Da Cunha Coelho
Supervisor: Luis Badesa Bernardo
Afiliación: Universidad Politécnica de Madrid
Novembre 2025

===========================================================================
                         NOTAS IMPORTANTES
===========================================================================
Solo se tienen en cuenta las reactancias en serie de las líneas de 
transmisión o los transformadores.
=#

#--------------------------------
# INCLUIR LOS PAQUETES UTILIZADOS
#--------------------------------
# Paquetes relacionados con álgebra lineal
using LinearAlgebra, SparseArrays
# Paquetes relacionados con Manipulación de datos
using DataFrames, Printf, CSV, DataStructures
# Paquetes relacionados con optmización
using JuMP, HiGHS

#-----------------------------------------
# INCLUIR ARCHIVOS DE FUNCIONES AUXILIARES
#-----------------------------------------

include("./Functions/AF_CLEAN_TERMINAL.jl")    # Función auxiliar para limpiar el terminal 
include("./Functions/AF_READ_DATA.jl")         # Funciones auxiliares utilizadas para leer datos de entrada 
include("./Functions/AF_MANAGEMENT.jl")        # Función auxiliar que gestiona algunos datos 
include("./Functions/AF_B_MATRIX.jl")          # Función auxiliar para crear la matriz de susceptancia 
include("./Functions/AF_BUILD_DCOPF_MODEL.jl") # Función auxiliar para crear el modelo DC OPF para la optimización 
include("./Functions/AF_SAVE_OUTPUT.jl")       # Función auxiliar para guardar los resultados de salida 
include("./Functions/AF_RUN_DCOPF.jl")         # Función auxiliar para ejecutar el DC-OPF
include("./Functions/AF_ECONOMIC_DISPATCH.jl") # Función auxiliar para ejecutar el Despacho Economico
include("./Functions/AF_UNIT_COMMITMENT.jl")   # Función auxiliar para ejecutar el Encendido de Generación

#=
** Elige el sistema que quieres simular: **
1nodo
2nodos
3nodos
=#
sistema  = "1nodo"

#=
** Elige se quires simular Despacho Economico (ED), Encendido de Generación (UC), o Flujo de Potencia Lineal (DCOPF): **
ED
UC
DCOPF
=#
simulacion = "UC"

if simulacion == "ED"
    Run_Economic_Dispatch(sistema, carpeta_actual)

elseif simulacion == "UC"
    Run_Unit_Commitment(sistema, carpeta_actual)

elseif simulacion == "DCOPF"
    if sistema != "1nodo"
        Run_DCOPF(sistema, carpeta_actual)
    else
        Clean_Terminal()
        println("AVISO: Para simular el flujo de potencia lineal, el sistema debe tener dos nodos o más.")
    end
end



