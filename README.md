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

> *Note:* **After you click `launch` on MyBinder, it builds a temporary cloud environment from the selected GitHub repository — installing dependencies and opening an interactive workspace (like Jupyter or VS Code) where you can run the code directly in your browser.**
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
      - Inside this folder, there are eight files, which are the julia functions used during the simulation
        <p align="center">
          <img src="./utils/Step14.png" alt="Step 14" width="50%">
        </p>
  3. Getting inside the folder [`Input_Data/`](./Input_Data):
      - Inside this folder, there are two subfolders, which are the data for the test cases available (`2nodos` & `3nodos`)
        <p align="center">
          <img src="./utils/Step9.png" alt="Step 9" width="50%">
        </p>
  4. Getting inside the folder [`Results/`](./Results):
      - Inside this folder, there are seven txt files in which the results are stored for analysis
        <p align="center">
          <img src="./utils/Step9.png" alt="Step 9" width="50%">
        </p>
      - 📄 [`1_coste_DCOPF.txt`](./Results/1_coste_DCOPF.txt): It prints the total cost obtained via DCOPF
      - 📄 [`2_generacion_DCOPF.txt`](./Results/2_generacion_DCOPF.txt): It prints the generation dispatch obtained via DCOPF
      - 📄 [`3_lineas_DCOPF_DCOPF.txt`](./Results/3_lineas_DCOPF.txt): It prints the line flow obtained via DCOPF
      - 📄 [`4_duals_DCOPF.txt`](./Results/4_duals_DCOPF.txt): It prints the marginal prices for each bus obtained via DCOPF
      - 📄 [`5_detalles_modelo_DCOPF.txt`](./Results/5_detalles_modelo_DCOPF.txt): It prints the DCOPF model created via Julia-JuMP
      - 📄 [`6_solucion_DE.txt`](./Results/6_solucion_DE.txt): It prints the results obtained via Economic Dispatch
      - 📄 [`7_solucion_DE.txt`](./Results/7_solucion_DE.txt): It prints the results obtained via Unit Commitment
</details>

**5. 🗂️ :**
<details>
  <summary>Click to see the details</summary>

</details>
