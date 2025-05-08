## Optimización de la Base de Datos

Una empresa guarda los siguientes datos de sus clientes, con los siguientes campos:

* documento CHAR(8) NOT NULL
* nombre VARCHAR(30) NOT NULL
* domicilio VARCHAR(30)
* ciudad VARCHAR(20)
* provincia VARCHAR(20)
* telefono VARCHAR(11)

Se pide:

1. Elimine la tabla "cliente" si existe.

    ```sql
    
    ```
2. Cree la tabla si clave primaria y incluye a posteriori esta.

    ```sql
    
    ```
3. Define los siguientes indices:
    
    1. Un índice único por el campo "documento" y un índice común por ciudad y provincia (Justifica el tipo de indice en un comentario).

        ```sql
        
        ```
        1. Vea los índices de la tabla.

            ```sql
            
            ```
4. Agregue un índice único por el campo "telefono".

    ```sql
    
    ```
5. Elimina los índices.

    ```sql
    
    ```
