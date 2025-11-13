# DESPACHO ECONÓMICO, COMPROMISO DE GENERACIÓN y DC-OPF en Julia-JuMP
Este código utiliza Julia-JuMP y el solver HiGHS para resolver versiones simples de los problemas de Despacho Económico, Compromiso de Generación y DC-OPF.

## 👨🏽‍💻 Ejecutar el Código Online (directamente en la web)

**1. 💻 Abrir el sitio web https://mybinder.org/:**

**2. 🚀 Construir y Lanzar el Repositorio:**  
<details>
  <summary>Haz clic para ver los detalles</summary>

  <p align="center">
    <img src="./utils/Step1.png" alt="Paso 1" width="50%">
  </p>

  1. Copia y pega la URL del repositorio (`https://github.com/alexupm95/DC-OPF_SSE_ETSIDI`) en el campo **Nombre o URL del repositorio de GitHub**.  
  2. En el campo **Git ref (rama, etiqueta o commit)**, escribe `main`.  
  3. Luego haz clic en **launch**.  
  4. Espera a que el servidor instale todos los requisitos y precompile los paquetes.
     <p align="center">
      <img src="./utils/Step2.png" alt="Paso 2" width="50%">
     </p>

> ℹ️ **Nota**: **Después de hacer clic en `launch` en MyBinder, este construye un entorno temporal en la nube desde el repositorio de GitHub seleccionado — instalando dependencias y abriendo un espacio de trabajo interactivo (como Jupyter o VS Code) donde puedes ejecutar el código directamente en tu navegador. En MyBinder, puedes editar cualquier archivo y guardarlo localmente. Sin embargo, cualquier cambio que realices no se envía al repositorio de GitHub (afortunadamente).**

</details>

**3. 👨🏽‍💻 Ejecutar el Código:**  
<details>
  <summary>Haz clic para ver los detalles</summary>

  1. Cuando el servidor complete la instalación de todos los requisitos, abrirá una ventana como la siguiente.
      <p align="center">
        <img src="./utils/Step3.png" alt="Paso 3" width="50%">
      </p>
  2. Haz clic en `Terminal`
      <p align="center">
        <img src="./utils/Step5.png" alt="Paso 5" width="50%">
      </p>
  3. En la ventana de terminal, escribe `julia` y luego presiona **Enter**
      <p align="center">
        <img src="./utils/Step6.png" alt="Paso 6" width="50%">
      </p>
  4. Para ejecutar el código, en la Terminal de Julia escribe `include("main.jl")` y luego presiona **Enter**
      <p align="center">
        <img src="./utils/Step7.png" alt="Paso 7" width="50%">
      </p>
> ℹ️ **Nota**: Cada vez que quieras ejecutar la simulación, escribe `include("main.jl")` en la terminal y presiona **Enter**. Alternativamente, puedes presionar la tecla **⬆️ (flecha arriba)** para recuperar el comando anterior de tu historial y luego presionar **Enter** nuevamente.
</details>

---

**4. 🗂️ Conocer la estructura del repositorio dentro de MyBinder:**
<details>
  <summary>Haz clic para ver los detalles</summary>

  1. El directorio raíz está compuesto por las siguientes carpetas y archivos:  

      <p align="center">
        <img src="./utils/Step4.png" alt="Paso 4" width="50%" height="30%">
      </p>

      - 📁 [`Functions/`](./Functions): Contiene todas las funciones auxiliares utilizadas en la simulación  
      - 📁 [`Input_Data/`](./Input_Data): Contiene los datos de entrada para los casos de estudio  
      - 📁 [`Results/`](./Results): Contiene todos los resultados de salida
      - 📁 [`utils/`](./utils): Contiene algunas figuras utilizadas en esta guía  
      - 📄 [`main.jl`](./main.jl): El script principal para ejecutar simulaciones y obtener resultados  
      - 📄 [`Manifest.toml`](./Manifest.toml), [`Project.toml`](../Project.toml), y [`README.md`](../README.md): Archivos de configuración y documentación auxiliares  

  2. Acceder a la carpeta [`Functions/`](./Functions):
     <details> <summary>Ver detalles</summary>
      - Dentro de esta carpeta, hay nueve archivos, que son las funciones de Julia utilizadas durante la simulación (<b>NO NECESITAN SER MODIFICADAS</b>)
        <p align="center">
          <img src="./utils/Step14.png" alt="Paso 14" width="50%">
        </p>
     </details>

  3. Acceder a la carpeta [`Input_Data/`](./Input_Data):
     <details> <summary>Ver detalles</summary>
       
      - Dentro de esta carpeta, hay dos subcarpetas, que contienen los datos para los casos de prueba disponibles ([`2nodos`](./Input_Data/2nodos) & [`3nodos`](./Input_Data/3nodos))
        <p align="center">
          <img src="./utils/Step9.png" alt="Paso 9" width="50%">
        </p>
       
     </details>
        
  4. 📊 Acceder a la carpeta [`Results/`](./Results):
     <details> <summary>Ver detalles</summary>
      - Dentro de esta carpeta, hay siete archivos txt en los que se almacenan los resultados para su análisis
        <p align="center">
          <img src="./utils/Step15.png" alt="Paso 15" width="50%">
        </p>
        
      - 📄 [`1_coste_DCOPF.txt`](./Results/1_coste_DCOPF.txt): Muestra el coste total obtenido mediante DC-OPF
        <p align="center">
          <img src="./utils/Step16.png" alt="Paso 16" width="50%">
        </p>
      - 📄 [`2_generacion_DCOPF.txt`](./Results/2_generacion_DCOPF.txt): Muestra el despacho de generación obtenido mediante DC-OPF
        <p align="center">
          <img src="./utils/Step17.png" alt="Paso 17" width="50%">
        </p>
      - 📄 [`3_lineas_DCOPF_DCOPF.txt`](./Results/3_lineas_DCOPF.txt): Muestra el flujo de líneas obtenido mediante DC-OPF
        <p align="center">
          <img src="./utils/Step18.png" alt="Paso 18" width="50%">
        </p>
      - 📄 [`4_duals_DCOPF.txt`](./Results/4_duals_DCOPF.txt): Muestra los precios marginales para cada nodo obtenidos mediante DC-OPF
        <p align="center">
          <img src="./utils/Step19.png" alt="Paso 19" width="50%">
        </p>
      - 📄 [`5_detalles_modelo_DCOPF.txt`](./Results/5_detalles_modelo_DCOPF.txt): Muestra el modelo DC-OPF creado mediante Julia-JuMP
        <p align="center">
          <img src="./utils/Step20.png" alt="Paso 20" width="50%">
        </p>
      - 📄 [`6_solucion_DE.txt`](./Results/6_solucion_DE.txt): Muestra los resultados obtenidos mediante Despacho Económico
        <p align="center">
          <img src="./utils/Step21.png" alt="Paso 21" width="50%">
        </p>
      - 📄 [`7_solucion_DE.txt`](./Results/7_solucion_DE.txt): Muestra los resultados obtenidos mediante Compromiso de Generación
        <p align="center">
          <img src="./utils/Step22.png" alt="Paso 22" width="50%">
        </p>
     </details>
</details>

---

**5. 👨🏽‍💻 Modificar los datos de entrada:**
<details>
  <summary>Haz clic para ver los detalles</summary>
  
  1. Para modificar los datos de entrada, ve a la carpeta 📁 [`Input_Data/`](./Input_Data), y abre la subcarpeta asociada al sistema que quieras modificar (`2nodos` & `3nodos`):
       <p align="center">
        <figure style="display:inline-block; margin:10px; text-align:center;">
          <img src="./utils/_2bus.png" alt="2bus" style="width:300px; height:200px; object-fit:contain; display:block;">
          <figcaption style="text-align:center; margin-top:8px; display:block;"><em>(a) Diagrama sistema 2 nodos.</em></figcaption>
        </figure>
        <figure style="display:inline-block; margin:10px; text-align:center;">
          <img src="./utils/_3bus.png" alt="3bus" style="width:300px; height:200px; object-fit:contain; display:block;">
          <figcaption style="text-align:center; margin-top:8px; display:block;"><em>(b) Diagrama sistema 3 nodos.</em></figcaption>
        </figure>
      </p> 
      
  2. Luego, haz doble clic en el archivo llamado `dados_sistema.jl`
      
  3. **Ejemplo para el sistema `3nodos`:** 
     
      - Ve a la subcarpeta 📁 [`Input_Data/3nodos`](./Input_Data/3nodsos) y haz doble clic en el archivo [`Input_Data/3nodos/dados_sistema.jl`](./Input_Data/3nodsos/dados_sistema.jl)
        
      - Las variables con las que puedes experimentar son:
        > ℹ️ **Nota**: **Todas las variables de entrada se guardan en vectores. Para separar dos elementos dentro del vector, usa punto y coma (`;`).**
        
        - Variables de nodo
          ```julia
            # =====================================================================
            #                        VARIABLES DE NODO
            # =====================================================================
            # nodo -----------> Número de identificación del nodo
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
            # generador -------> Número de identificación del generador
            # minima_potencia -> Mínima potencia generada (MW)
            # maxima_potencia -> Máxima potencia generada (MW)
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
            # linea ------------> Número de identificación de la línea
            # de_nodo ----------> Número del nodo donde empieza la línea
            # para_nodo --------> Número del nodo donde termina la línea
            # susceptancia -----> Susceptancia serie de la línea (p.u)
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

---
**6. 🛠️ Modificar el tipo de simulación:**
<details>
  <summary>Haz clic para ver los detalles</summary>

  1. Abre el archivo 📄 [`main.jl`](main.jl)  
      <p align="center">
        <img src="./utils/Step8.png" alt="Paso 8" width="50%" height="30%">
      </p>

  2. Para seleccionar el sistema que quieres simular, modifica la variable `sistema`.  
     Actualmente, hay dos opciones disponibles: `2nodos` y `3nodos`.

  3. Para elegir el tipo de simulación, establece la variable `simulacion` a una de las siguientes opciones:
     - `DE` → ejecuta un **Despacho Económico**
     - `UC` → ejecuta un **Compromiso de Generación**
     - `DCOPF` → ejecuta un **Flujo de Carga Óptimo Linealizado**

</details>

---
**7. 📜 Abrir el archivo README dentro de MyBinder:**  
<details>
  <summary>Haz clic para ver los detalles</summary>
  
  1. Para ver el archivo README en el entorno creado usando MyBinder, haz clic derecho en el archivo [`README.md`](README.md), luego haz clic en `Open With`, y luego haz clic en `Markdown Preview`.
     
      <figure style="display:inline-block; margin:10px; text-align:center;">
       <img src="./utils/Step23.png" alt="Paso 23" style="width:300px; height:350px; object-fit:contain; display:block;">
       <figcaption style="text-align:center; margin-top:8px; display:block;"><em>(a) Abrir con</em></figcaption>
     </figure>
     <figure style="display:inline-block; margin:10px; text-align:center;">
       <img src="./utils/Step24.png" alt="Paso 24" style="width:400px; height:350px; object-fit:contain; display:block;">
       <figcaption style="text-align:center; margin-top:8px; display:block;"><em>(b) Vista previa de Markdown</em></figcaption>
     </figure>
</details>