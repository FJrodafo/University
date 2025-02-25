## <img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/T08_Gestion_de_tienda/Computer.png" width="24"> Gestión de tienda

<details>
<summary>Tabla</summary>

| id_producto | nombre        | categoria                  | precio | dni_cliente | nombre_cliente | direccion_envio                         |
| :---------: | :------------ | :------------------------- | :----: | :---------: | :------------- | :-------------------------------------- |
| 1           | Laptop HP     | Electrónicos, Informática. | 800    | 12345678A   | Juan           | Calle 1, Ciudad A. / Calle 2, Ciudad A. |
| 2           | Camiseta Nike | Ropa, Deportes.            | 30     | 23456789B   | María          | Calle 3, Ciudad B.                      |
| 3           | Libro "Dune"  | Libros, Ciencia Ficción.   | 20     | 34567891C   | Juan           | Calle 1, Ciudad A.                      |
</details>
<details>
<summary>1FN</summary>

| id_producto | tipo_producto | marca | titulo | categoria       | precio | dni_cliente | nombre_cliente | direccion_envio    |
| :---------: | :------------ | :---- | :----- | :-------------- | :----: | :---------: | :------------- | :----------------- |
| 1           | Laptop        | HP    | Null   | Electrónicos    | 800    | 12345678A   | Juan           | Calle 1, Ciudad A. |
| 1           | Laptop        | HP    | Null   | Electrónicos    | 800    | 12345678A   | Juan           | Calle 2, Ciudad A. |
| 1           | Laptop        | HP    | Null   | Informática     | 800    | 12345678A   | Juan           | Calle 1, Ciudad A. |
| 1           | Laptop        | HP    | Null   | Informática     | 800    | 12345678A   | Juan           | Calle 2, Ciudad A. |
| 2           | Camiseta      | Nike  | Null   | Ropa            | 30     | 23456789B   | María          | Calle 3, Ciudad B. |
| 2           | Camiseta      | Nike  | Null   | Deportes        | 30     | 23456789B   | María          | Calle 3, Ciudad B. |
| 3           | Libro         | Null  | Dune   | Libros          | 20     | 34567891C   | Juan           | Calle 1, Ciudad A. |
| 3           | Libro         | Null  | Dune   | Ciencia Ficción | 20     | 34567891C   | Juan           | Calle 1, Ciudad A. |
</details>
<details>
<summary>2FN</summary>

| id_producto | tipo_producto | fabricante | marca | titulo | precio |
| :---------: | :------------ | :--------- | :---- | :----- | :----: |
| 1           | Laptop        | HP         | Null  | Null   | 800    |
| 2           | Camiseta      | Null       | Nike  | Null   | 30     |
| 3           | Libro         | Null       | Null  | Dune   | 20     |

| id_categoria | nombre_categoria |
| :----------: | :--------------- |
| 1            | Electrónicos     |
| 2            | Informática      |
| 3            | Ropa             |
| 4            | Deportes         |
| 5            | Libros           |
| 6            | Ciencia Ficción  |

| id_producto | id_categoria |
| :---------: | :----------: |
| 1           | 1            |
| 1           | 2            |
| 2           | 3            |
| 2           | 4            |
| 3           | 5            |
| 3           | 6            |

| dni_cliente | nombre_cliente |
| :---------: | :------------- |
| 12345678A   | Juan           |
| 23456789B   | María          |
| 34567891C   | Juan           |

| id_pedido | dni_cliente | costo_total |
| :-------: | :---------: | :---------: |
| 1         | 12345678A   | 800         |
| 2         | 23456789B   | 30          |
| 3         | 34567891C   | 20          |

| id_pedido | id_producto | cantidad |
| :-------: | :---------: | :------: |
| 1         | 1           | 1        |
| 2         | 2           | 1        |
| 3         | 3           | 1        |

| id_direccion | calle   | ciudad    |
| :----------: | :------ | :-------- |
| 1            | Calle 1 | Ciudad A. |
| 2            | Calle 2 | Ciudad A. |
| 3            | Calle 3 | Ciudad B. |

| dni_cliente | id_direccion |
| :---------: | :----------: |
| 12345678A   | 1            |
| 12345678A   | 2            |
| 23456789B   | 3            |
| 34567891C   | 1            |
</details>
<details>
<summary>3FN</summary>

| id_producto | precio |
| :---------: | :----: |
| 1           | 800    |
| 2           | 30     |
| 3           | 20     |

| id_laptop | id_producto | fabricante |
| :-------: | :---------: | :--------- |
| 1         | 1           | HP         |

| id_camiseta | id_producto | marca |
| :---------: | :---------: | :---- |
| 1           | 2           | Nike  |

| id_libro | id_producto | titulo |
| :------: | :---------: | :----- |
| 1        | 3           | Dune   |

| id_categoria | nombre_categoria |
| :----------: | :--------------- |
| 1            | Electrónicos     |
| 2            | Informática      |
| 3            | Ropa             |
| 4            | Deportes         |
| 5            | Libros           |
| 6            | Ciencia Ficción  |

| id_producto | id_categoria |
| :---------: | :----------: |
| 1           | 1            |
| 1           | 2            |
| 2           | 3            |
| 2           | 4            |
| 3           | 5            |
| 3           | 6            |

| dni_cliente | nombre_cliente |
| :---------: | :------------- |
| 12345678A   | Juan           |
| 23456789B   | María          |
| 34567891C   | Juan           |

| id_pedido | dni_cliente | costo_total |
| :-------: | :---------: | :---------: |
| 1         | 12345678A   | 800         |
| 2         | 23456789B   | 30          |
| 3         | 34567891C   | 20          |

| id_pedido | id_producto | cantidad |
| :-------: | :---------: | :------: |
| 1         | 1           | 1        |
| 2         | 2           | 1        |
| 3         | 3           | 1        |

| id_direccion | calle   | ciudad    |
| :----------: | :------ | :-------- |
| 1            | Calle 1 | Ciudad A. |
| 2            | Calle 2 | Ciudad A. |
| 3            | Calle 3 | Ciudad B. |

| dni_cliente | id_direccion |
| :---------: | :----------: |
| 12345678A   | 1            |
| 12345678A   | 2            |
| 23456789B   | 3            |
| 34567891C   | 1            |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/T08_Gestion_de_tienda/Diagram.drawio.svg">
</details>

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>