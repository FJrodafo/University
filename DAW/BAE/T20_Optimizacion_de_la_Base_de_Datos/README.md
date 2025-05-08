## Optimización de la Base de Datos

Un instituto de enseñanza guarda los siguientes datos de sus alumnos:

* Número de inscripción, comienza desde 1 cada año.
* Año de inscripción.
* Nombre del alumno.
* Documento del alumno.
* Domicilio.
* Ciudad.
* Provincia.
* Clave primaria: número de inscripción y año de inscripción.

Se pide:

1. Elimine la tabla "alumno" si existe.

    ```sql
    
    ```
2. Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de inscripción).

    ```sql
    
    ```
3. Define los siguientes indices:
    
    1. Un índice único por el campo "documento" y un índice común por ciudad y provincia.

        ```sql
        
        ```
    2. Vea los índices de la tabla.

        ```sql
        
        ```
4. Intente ingresar un alumno con clave primaria repetida.

    ```sql
    
    ```
5. Intente ingresar un alumno con documento repetido.

    ```sql
    
    ```
6. Ingrese varios alumnos de la misma ciudad y provincia.

    ```sql
    
    ```
7. Elimina los indices creados, y muestra que ya no se encuentran.

    ```sql
    
    ```
