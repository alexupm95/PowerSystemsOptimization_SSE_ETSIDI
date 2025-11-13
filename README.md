# DC-OPF and ECONOMIC DISPATCH in Julia Language
This code solves the DC-OPF and Economic Dispatch using Julia-JuMP and HiGHS solver.

## 🚀 Running the Code Online (direct without installing packages)

**1. 💻 Open the website https://mybinder.org/:**

**2. Build and Launch the Repository:**  
<details>
  <summary>Click to see the details</summary>

  <p align="center">
    <img src="./utils/Step1.png" alt="Step 1" width="50%">
  </p>

  1. Copy and paste the repository URL (`https://github.com/alexupm95/DC-OPF_SSE_ETSIDI`) into the field **GitHub repository name or URL**.  
  2. In the field **Git ref (branch, tag, or commit)**, type `main`.  
  3. Then click on **launch**.  
  4. Wait for the server to install all requirements and precompile the packages.
     <p align="center">
      <img src="./utils/Step2.png" alt="Step 2" width="50%">
     </p>

> ℹ️ Note: **After you click `launch` on MyBinder, it builds a temporary cloud environment from the selected GitHub repository — installing dependencies and opening an interactive workspace (like Jupyter or VS Code) where you can run the code directly in your browser.**

</details>

**3. Run the Code:**  
<details>
  <summary>Click to see the details</summary>

  1. When the server completes the installation of all the requirements, it will open a window like the one below.
      <p align="center">
        <img src="./utils/Step3.png" alt="Step 3" width="50%">
      </p>
  2. Click on `Terminal`
      <p align="center">
        <img src="./utils/Step5.png" alt="Step 5" width="50%">
      </p>
  3. In the terminal window, type `julia` and then enter
      <p align="center">
        <img src="./utils/Step6.png" alt="Step 6" width="50%">
      </p>
  4. To run the code, in the Julia Terminal type `include("main.jl")`
      <p align="center">
        <img src="./utils/Step7.png" alt="Step 7" width="50%">
      </p>
</details>

---

**4. 🗂️ Knowing the repository structure inside MyBinder:**
<details>
  <summary>Click to see the details</summary>

  1. The root directory is composed of the following folders and files:  

      <p align="center">
        <img src="./utils/Step4.png" alt="Step 4" width="50% height = 30%">
      </p>

      - 📁 [`Functions/`](./Functions): Contains all auxiliary functions used in the simulation  
      - 📁 [`Input_Data/`](./Input_Data): Contains the input data for the case studies  
      - 📁 [`Results/`](./Results): Contains all the output results
      - 📁 [`utils/`](./utils): Contains some figures used in this guide  
      - 📄 [`main.jl`](./main.jl): The main script to run simulations and obtain results  
      - 📄 [`Manifest.toml`](./Manifest.toml), [`Project.toml`](../Project.toml), and [`README.md`](../README.md): Auxiliary configuration and documentation files  

  2. Getting inside the folder [`Functions/`](./Functions):
     <details> <summary>See details</summary>
      - Inside this folder, there are nine files, which are the julia functions used during the simulation (DONT'T NEED TO BE MODIFIED)
        <p align="center">
          <img src="./utils/Step14.png" alt="Step 14" width="50%">
        </p>
     </details>
        
  3. Getting inside the folder [`Input_Data/`](./Input_Data):
     <details> <summary>See details</summary>
      - Inside this folder, there are two subfolders, which are the data for the test cases available (`2nodos` & `3nodos`)
        <p align="center">
          <img src="./utils/Step9.png" alt="Step 9" width="50%">
        </p>
     </details>
        
  4. Getting inside the folder [`Results/`](./Results):
     <details> <summary>See details</summary>
      - Inside this folder, there are seven txt files in which the results are stored for analysis
        <p align="center">
          <img src="./utils/Step15.png" alt="Step 15" width="50%">
        </p>
        
      - 📄 [`1_coste_DCOPF.txt`](./Results/1_coste_DCOPF.txt): It prints the total cost obtained via DCOPF
        <p align="center">
          <img src="./utils/Step16.png" alt="Step 16" width="50%">
        </p>
      - 📄 [`2_generacion_DCOPF.txt`](./Results/2_generacion_DCOPF.txt): It prints the generation dispatch obtained via DCOPF
        <p align="center">
          <img src="./utils/Step17.png" alt="Step 17" width="50%">
        </p>
      - 📄 [`3_lineas_DCOPF_DCOPF.txt`](./Results/3_lineas_DCOPF.txt): It prints the line flow obtained via DCOPF
        <p align="center">
          <img src="./utils/Step18.png" alt="Step 18" width="50%">
        </p>
      - 📄 [`4_duals_DCOPF.txt`](./Results/4_duals_DCOPF.txt): It prints the marginal prices for each bus obtained via DCOPF
        <p align="center">
          <img src="./utils/Step19.png" alt="Step 19" width="50%">
        </p>
      - 📄 [`5_detalles_modelo_DCOPF.txt`](./Results/5_detalles_modelo_DCOPF.txt): It prints the DCOPF model created via Julia-JuMP
        <p align="center">
          <img src="./utils/Step20.png" alt="Step 20" width="50%">
        </p>
      - 📄 [`6_solucion_DE.txt`](./Results/6_solucion_DE.txt): It prints the results obtained via Economic Dispatch
        <p align="center">
          <img src="./utils/Step21.png" alt="Step 21" width="50%">
        </p>
      - 📄 [`7_solucion_DE.txt`](./Results/7_solucion_DE.txt): It prints the results obtained via Unit Commitment
        <p align="center">
          <img src="./utils/Step22.png" alt="Step 22" width="50%">
        </p>
     </details>
</details>

---

**5. 💻 Modifying the input data:**
<details>
  <summary>Click to see the details</summary>
  
  1. To modify the input data, go to the folder 📁 [`Input_Data/`](./Input_Data), and open the subfolder associated with the system you want to simulate (`2nodos` & `3nodos`):
       <p align="center">
        <figure style="display:inline-block; margin:10px;">
          <img src="./utils/_2bus.png" alt="2bus" width="25%">
          <figcaption><em>(a) Diagrama sistema 2 nodos.</em></figcaption>
        </figure>
        <figure style="display:inline-block; margin:10px;">
          <img src="./utils/_3bus.png" alt="3bus" width="25%">
          <figcaption><em>(b) Diagrama sistema 3 nodos.</em></figcaption>
        </figure>
      </p> 
      
  2. Then, double-click on the file named `dados_sistema.jl`
      
  3. **Example for the `3nodos` system:** 
     
      - Go to the subfolder 📁 [`Input_Data/3nodos`](./Input_Data/3nodsos) and double click on the file [`Input_Data/3nodos/dados_sistema.jl`](./Input_Data/3nodsos/dados_sistema.jl)
        
      - The variables that you can play with are:
        > ℹ️ Note: **All the input variables are saved in vectors. To separate two elements inside the vector, use semicolon (`;`).**
        
        - Variables de nodo
          ```julia
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
          ```
          
        - Variables de Generación
          ```julia
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
          ```
          
        - Variables de Línea
          ```julia
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
          ```
      
</details>
