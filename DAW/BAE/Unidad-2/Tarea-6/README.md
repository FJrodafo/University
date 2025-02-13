## <img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-5/Assets/Computer.png" height="24"> Ejercicios de Normalización de Bases de Datos

#### **Ejercicio 1**: Lista de Productos

- Aplicar **1FN**, eliminando los valores multivaluados en "Proveedores".
- Aplicar **2FN**, asegurando que cada campo dependa completamente de la clave primaria.

<details>
<summary>Tabla</summary>

| ID_Producto | Nombre_Producto | Proveedores | Categoría  | Precio |
| :---------: | :-------------- | :---------- | :--------- | :----: |
| 1           | Laptop          | Dell, HP    | Tecnología | 1000   |
| 2           | Mouse           | Logitech    | Accesorios | 25     |
</details>
<details>
<summary>Solución</summary>

| ID_Producto | Nombre_Producto | Proveedores | Categoría  | Precio |
| :---------: | :-------------- | :---------- | :--------- | :----: |
| 1           | Laptop          | Dell, HP    | Tecnología | 1000   |
| 2           | Mouse           | Logitech    | Accesorios | 25     |
</details>
<details>
<summary>E/R</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/1.drawio.svg">
</details>
<br />

---

#### **Ejercicio 2**: Pedidos de Clientes

- Aplicar **1FN**, separando valores repetidos y creando nuevas tablas si es necesario.
- Aplicar **2FN**, asegurando que las dependencias parciales sean eliminadas.

<details>
<summary>Tabla</summary>

| ID_Pedido | Cliente    | Dirección   | Producto | Cantidad | Precio |
| :-------: | :--------- | :---------- | :------- | :------: | :----: |
| 101       | Juan Pérez | Calle 123   | Laptop   | 1        | 1000   |
| 102       | Ana López  | Av. Central | Teclado  | 2        | 50     |
</details>
<details>
<summary>Solución</summary>

| ID_Pedido | Cliente    | Dirección   | Producto | Cantidad | Precio |
| :-------: | :--------- | :---------- | :------- | :------: | :----: |
| 101       | Juan Pérez | Calle 123   | Laptop   | 1        | 1000   |
| 102       | Ana López  | Av. Central | Teclado  | 2        | 50     |
</details>
<details>
<summary>E/R</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/2.drawio.svg">
</details>
<br />

---

#### **Ejercicio 3**: Registro de Empleados

- Aplicar **1FN**, eliminando los valores multivaluados en "Teléfonos".
- Aplicar **2FN**, asegurando que cada atributo dependa completamente de la clave primaria.

<details>
<summary>Tabla</summary>

| ID_Empleado | Nombre    | Teléfonos    | Departamento |
| :---------: | :-------: | :----------: | :----------: |
| 1           | Carlos R. | 12345, 67890 | Ventas       |
| 2           | Laura M.  | 54321        | Finanzas     |
</details>
<details>
<summary>Solución</summary>

| ID_Empleado | Nombre    | Teléfonos    | Departamento |
| :---------: | :-------: | :----------: | :----------: |
| 1           | Carlos R. | 12345, 67890 | Ventas       |
| 2           | Laura M.  | 54321        | Finanzas     |
</details>
<details>
<summary>E/R</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/3.drawio.svg">
</details>
<br />

---

#### **Ejercicio 4**: Reservas de Hotel

- Aplicar **1FN**, eliminando los valores multivaluados en "Fechas".
- Aplicar **2FN**, asegurando que las dependencias parciales sean eliminadas.

<details>
<summary>Tabla</summary>

| ID_Reserva | Cliente  | Habitación | Fechas              | Precio |
| :--------: | :------- | :--------: | :-----------------: | :----: |
| 5001       | Pedro G. | 101        | 01/02, 02/02, 03/02 | 300    |
| 5002       | María T. | 202        | 10/03, 11/03        | 200    |
</details>
<details>
<summary>Solución</summary>

| ID_Reserva | Cliente  | Habitación | Fechas              | Precio |
| :--------: | :------- | :--------: | :-----------------: | :----: |
| 5001       | Pedro G. | 101        | 01/02, 02/02, 03/02 | 300    |
| 5002       | María T. | 202        | 10/03, 11/03        | 200    |
</details>
<details>
<summary>E/R</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/4.drawio.svg">
</details>
<br />

---

#### **Ejercicio 5**: Inscripciones a Cursos

- Aplicar **1FN**, eliminando valores multivaluados en "Horarios".
- Aplicar **2FN**, asegurando que cada campo dependa completamente de la clave primaria.

<details>
<summary>Tabla</summary>

| ID_Inscripción | Estudiante | Curso       | Profesor    | Horarios                  |
| :------------: | :--------- | :---------- | :---------- | :------------------------ |
| 3001           | Luis R.    | Matemáticas | Prof. Pérez | Lunes 10AM, Miércoles 2PM |
| 3002           | Ana S.     | Física      | Prof. Gómez | Martes 3PM                |
</details>
<details>
<summary>Solución</summary>

| ID_Inscripción | Estudiante | Curso       | Profesor    | Horarios                  |
| :------------: | :--------- | :---------- | :---------- | :------------------------ |
| 3001           | Luis R.    | Matemáticas | Prof. Pérez | Lunes 10AM, Miércoles 2PM |
| 3002           | Ana S.     | Física      | Prof. Gómez | Martes 3PM                |
</details>
<details>
<summary>E/R</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/5.drawio.svg">
</details>
<br />

---

#### **Ejercicio 6**: Ventas de Tienda

- Aplicar **1FN**, separando valores multivaluados en "Productos Comprados".
- Aplicar **2FN**, asegurando que cada atributo dependa completamente de la clave primaria.

<details>
<summary>Tabla</summary>

| ID_Venta | Cliente   | Productos Comprados | Total |
| :------: | :-------- | :------------------ | :---: |
| 8001     | Juan P.   | Celular, Funda      | 500   |
| 8002     | Andrea M. | Laptop              | 1000  |
</details>
<details>
<summary>Solución</summary>

| ID_Venta | Cliente   | Productos Comprados | Total |
| :------: | :-------- | :------------------ | :---: |
| 8001     | Juan P.   | Celular, Funda      | 500   |
| 8002     | Andrea M. | Laptop              | 1000  |
</details>
<details>
<summary>E/R</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/6.drawio.svg">
</details>
<br />

---

#### **Ejercicio 7**: Biblioteca de Libros

- Aplicar **1FN**, eliminando valores multivaluados en "Autores".
- Aplicar **2FN**, asegurando que cada atributo dependa completamente de la clave primaria.

<details>
<summary>Tabla</summary>

| ID_Libro | Título     | Autores   | Género          |
| :------: | :--------- | :-------- | :-------------- |
| 101      | El Quijote | Cervantes | Novela          |
| 102      | 1984       | Orwell    | Ciencia Ficción |
</details>
<details>
<summary>Solución</summary>

| ID_Libro | Título     | Autores   | Género          |
| :------: | :--------- | :-------- | :-------------- |
| 101      | El Quijote | Cervantes | Novela          |
| 102      | 1984       | Orwell    | Ciencia Ficción |
</details>
<details>
<summary>E/R</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/7.drawio.svg">
</details>
<br />

---

#### **Ejercicio 8**: Facturación de Servicios

- Aplicar **1FN**, separando valores multivaluados en "Servicios Contratados".
- Aplicar **2FN**, asegurando que cada atributo dependa completamente de la clave primaria.

<details>
<summary>Tabla</summary>

| ID_Factura | Cliente | Servicios Contratados | Costo Total |
| :--------: | :------ | :-------------------- | :---------: |
| 9001       | Juan P. | Internet, TV          | 50          |
| 9002       | Ana M.  | Teléfono              | 20          |
</details>
<details>
<summary>Solución</summary>

| ID_Factura | Cliente | Servicios Contratados | Costo Total |
| :--------: | :------ | :-------------------- | :---------: |
| 9001       | Juan P. | Internet, TV          | 50          |
| 9002       | Ana M.  | Teléfono              | 20          |
</details>
<details>
<summary>E/R</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/8.drawio.svg">
</details>
<br />

---

#### **Ejercicio 9**: Gestión de Vehículos

- Aplicar **1FN**, eliminando valores multivaluados en "Modelos".
- Aplicar **2FN**, asegurando que cada atributo dependa completamente de la clave primaria.

<details>
<summary>Tabla</summary>

| ID_Vehículo | Marca  | Modelos        | Año  |
| :---------: | :----- | :------------- | :--: |
| 5001        | Toyota | Corolla, Yaris | 2022 |
| 5002        | Honda  | Civic          | 2023 |
</details>
<details>
<summary>Solución</summary>

| ID_Vehículo | Marca  | Modelos        | Año  |
| :---------: | :----- | :------------- | :--: |
| 5001        | Toyota | Corolla, Yaris | 2022 |
| 5002        | Honda  | Civic          | 2023 |
</details>
<details>
<summary>E/R</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/9.drawio.svg">
</details>
<br />

---

#### **Ejercicio 10**: Gestión de Proyectos

- Aplicar **1FN**, eliminando valores multivaluados en "Miembros".
- Aplicar **2FN**, asegurando que cada atributo dependa completamente de la clave primaria.

<details>
<summary>Tabla</summary>

| ID_Proyecto | Nombre     | Miembros     | Presupuesto |
| :---------: | :--------- | :----------- | :---------: |
| 7001        | Web App    | Juan, Ana    | 5000        |
| 7002        | E-commerce | Pedro, María | 10000       |
</details>
<details>
<summary>Solución</summary>

| ID_Vehículo | Marca  | Modelos        | Año  |
| :---------: | :----- | :------------- | :--: |
| 5001        | Toyota | Corolla, Yaris | 2022 |
| 5002        | Honda  | Civic          | 2023 |
</details>
<details>
<summary>E/R</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/9.drawio.svg">
</details>
<br />

---

<link rel="stylesheet" href="./../../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>