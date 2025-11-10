function Run_DCOPF(case::String, current_path_folder::String)
    
    base_MVA    = 100.0         # Base Power [MVA]

    #-----------------------------------------
    Clean_Terminal() # Clean the terminal
    #-----------------------------------------

    #-----------------------------------------
    # Generate a folder to export the results
    #-----------------------------------------
    name_path_results   = "Results"                                        # Name of the folder to save the results (it must be created in advance)
    path_folder_results = joinpath(current_path_folder, name_path_results) # Results directory
    cd(current_path_folder)                                                # Load the current folder

    #------------------------------------------
    # Call the function to read the input data
    #------------------------------------------
    input_data_path_folder = joinpath(current_path_folder, "Input_Data", case) # Folder name where the input data is located

    # Get the structs with data related to buses, generators and circuits
    DBUS, DGEN, DCIR, bus_mapping, reverse_bus_mapping = Read_Input_Data(input_data_path_folder) 

    # ---------------------------------------------------
    nBUS = length(DBUS.bus)      # Number of buses in the system
    nGEN = length(DGEN.id)       # Number of generators in the system
    nCIR = length(DCIR.from_bus) # Number of circuits in the system
    cd(current_path_folder)      # Load the current folder

    #-------------------------------------------------------------------------------------------------
    # Associates the buses with the generators and circuits connected to it, as well as adjacent buses
    #-------------------------------------------------------------------------------------------------
    bus_gen_circ_dict, bus_gen_circ_dict_ON = Manage_Bus_Gen_Circ(DBUS, DGEN, DCIR) 

    #-----------------------------------
    # Calculate the Susceptance Matrix
    #-----------------------------------

    # Calculate the Susceptance Matrix
    B_matrix = Calculate_Matrix_B(DBUS, DCIR, nBUS, nCIR) # Susceptance matrix

    # ########################################################################################
    #                                 STARTS OPTIMIZATION PROCESS 

    #-----------------------------------
    # Optimization model -> Setup
    #-----------------------------------
    model = JuMP.Model(HiGHS.Optimizer)
    JuMP.set_optimizer_attribute(model, "mip_rel_gap", 1e-8)    # Set optimality tolerance

    #------------------------------
    # Build the Optimization Model
    #------------------------------
    time_to_build_model = time() # Start the timer to build the Optimization Model

    model, V, θ, P_g, eq_const_angle_sw, eq_const_p_balance, ineq_const_p_ik = Make_DCOPF_Model!(model, 
    B_matrix, DBUS, DGEN, DCIR, bus_gen_circ_dict_ON, base_MVA, nBUS, nGEN, nCIR)

    time_to_build_model = time() - time_to_build_model # End the timer to build the Optimization Model
    println("\nTime to build the model: $time_to_build_model sec\n")

    # =====================================================================================

    #-------------------------------------------------------------------------------------
    #                         SAVE MODEL SUMMARY AND DETAILS
    #-------------------------------------------------------------------------------------
    println("--------------------------------------------------------------------------------------------------------------------------------------")
    Export_DCOPF_Model(model, θ, P_g, eq_const_angle_sw, eq_const_p_balance, ineq_const_p_ik, current_path_folder, path_folder_results)

    println("--------------------------------------------------------------------------------------------------------------------------------------")

    # ---------------------------------
    #  Solve the optmization problem
    # ---------------------------------
    time_to_solve_model = time()                       # Start the timer to solve the Optimization Model
    JuMP.optimize!(model)                              # Optimize model
    time_to_solve_model = time() - time_to_solve_model # End the timer to build the Optimization Model
    println("\nTime to solve the model: $time_to_solve_model sec")
    status_model = JuMP.termination_status(model)
    println("Termination Status: $status_model \n")
    println("--------------------------------------------------------------------------------------------------------------------------------------")


    #                               ENDS OPTIMIZATION PROCESS 
    # ########################################################################################

    RBUS::Union{Nothing, DataFrame} = nothing
    RGEN::Union{Nothing, DataFrame} = nothing
    RCIR::Union{Nothing, DataFrame} = nothing

    if status_model == OPTIMAL || status_model == LOCALLY_SOLVED || status_model == ITERATION_LIMIT
        #-------------------------------------------------------------------------------------
        #                             SAVE RESULT   S 
        #-------------------------------------------------------------------------------------
        RBUS, RGEN, RCIR = Save_Solution_Model(model, V, θ, P_g, bus_gen_circ_dict_ON, 
        DBUS, DGEN, DCIR, base_MVA, nBUS, nGEN, nCIR, bus_mapping, reverse_bus_mapping, 
        current_path_folder, path_folder_results)

        #-------------------------------------------------------------------------------------
        #                             SAVE DUALS 
        #-------------------------------------------------------------------------------------
        Save_Duals_DCOPF_Model(model, θ, P_g, eq_const_angle_sw, eq_const_p_balance, 
        ineq_const_p_ik, base_MVA, current_path_folder, path_folder_results)

    else
        JuMP.@warn "Optmization process failed. No feasible solution found."
    end
    println("--------------------------------------------------------------------------------------------------------------------------------------")

end