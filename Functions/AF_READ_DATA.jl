# Function used to Read the Input data from the input files and store them into DataFrames
function Read_Input_Data(folder_path::String)

    # =======================================================================================================
    # If some modification is done in the name of the variables in the input file, it must be modified here
    # =======================================================================================================

    # === Functions to convert raw tuples/vectors into DataFrames ================================

    function read_bus_data(nodo, potencia_carga)
        df_bus = DataFrame(
            bus = Int64.(nodo),
            p_d = Float64.(potencia_carga),
        )
        return df_bus
    end

    function read_gen_data(generador, minima_potencia, maxima_potencia, coste)
        df_gen = DataFrame(
            id = Int64.(generador),
            bus = Int64.(generador),  # same as ID
            pg_min = Float64.(minima_potencia),
            pg_max = Float64.(maxima_potencia),
            g_cost = Float64.(coste),
        )
        return df_gen
    end

    function read_circuit_data(linea, de_nodo, para_nodo, susceptancia, maxima_potencia)
        df_cir = DataFrame(
            circ = Int64.(linea),
            from_bus = Int64.(de_nodo),
            to_bus = Int64.(para_nodo),
            l_reac = 1.0 ./ Float64.(susceptancia),  # invert susceptance to get reactance
            l_cap = Float64.(maxima_potencia),
        )
        return df_cir
    end

    # ==============================================================================================
    # Load the input data module
    # ==============================================================================================
    mod = Module()
    Core.include(mod, joinpath(folder_path, "datos_sistema.jl"))
    Base.eval(mod, :(using DataFrames))

    # Call the functions inside the included module safely
    nodo, potencia_carga = Base.invokelatest(() -> getfield(mod, :nodos)())
    generador, minima_potencia, maxima_potencia, coste = Base.invokelatest(() -> getfield(mod, :generadores)())
    linea, de_nodo, para_nodo, susceptancia, maxima_potencia_linea = Base.invokelatest(() -> getfield(mod, :lineas)())

    # Convert to DataFrames
    DBUS = read_bus_data(nodo, potencia_carga)
    DGEN = read_gen_data(generador, minima_potencia, maxima_potencia, coste)
    DCIR = read_circuit_data(linea, de_nodo, para_nodo, susceptancia, maxima_potencia_linea)

    # ==============================================================================================
    # Map buses to ensure ascending order
    # ==============================================================================================
    bus_mapping, reverse_bus_mapping = Mapping_Buses_Labels(DBUS)
    DBUS.bus = [bus_mapping[b] for b in DBUS.bus]
    DGEN.bus = [bus_mapping[b] for b in DGEN.bus]
    DCIR.from_bus = [bus_mapping[b] for b in DCIR.from_bus]
    DCIR.to_bus = [bus_mapping[b] for b in DCIR.to_bus]

    return DBUS, DGEN, DCIR, bus_mapping, reverse_bus_mapping
end

# Function used to map the from old to new nomeclature
function Mapping_Buses_Labels(DBUS::DataFrame)

    # Given bus numbers
    original_buses = DBUS.bus

    # Create a dictionary that maps original bus labels to new indices
    bus_mapping = OrderedDict(original_buses[i] => i for i in eachindex(original_buses))

    # Reverse mapping (for converting back later)
    reverse_bus_mapping = OrderedDict(i => original_buses[i] for i in eachindex(original_buses))

    return bus_mapping, reverse_bus_mapping
end

# Function that can change the buses labels according to the new nomenclature
function Change_Buses_Labels(DBUS::DataFrame, DGEN::DataFrame, DCIR::DataFrame, bus_mapping::OrderedDict)
    
    # Convert using the reverse mapping
    DBUS.bus      = [bus_mapping[b] for b in DBUS.bus]
    DGEN.bus      = [bus_mapping[b] for b in DGEN.bus]
    DCIR.from_bus = [bus_mapping[b] for b in DCIR.from_bus]
    DCIR.to_bus   = [bus_mapping[b] for b in DCIR.to_bus]

    return DBUS, DGEN, DCIR
end

# Function that can return the buses labels according to the original nomenclature
function Reverse_Buses_Labels(DBUS::DataFrame, DGEN::DataFrame, DCIR::DataFrame, reverse_bus_mapping::OrderedDict)
        
    # Convert using the reverse mapping
    DBUS.bus      = [reverse_bus_mapping[b] for b in DBUS.bus]
    DGEN.bus      = [reverse_bus_mapping[b] for b in DGEN.bus]
    DCIR.from_bus = [reverse_bus_mapping[b] for b in DCIR.from_bus]
    DCIR.to_bus   = [reverse_bus_mapping[b] for b in DCIR.to_bus]

    return DBUS, DGEN, DCIR
end

