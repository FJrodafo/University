## <img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/T01_Exploracion_de_SGBD/Assets/Images/Computer.png" width="24" height="24"> Exploración de SGBD (Sistemas Gestores de Bases de Datos)

1. [Objetivo](#objetivo)
2. [Instrucciones](#instrucciones)
3. [Ejemplo de cuadro comparativo](#ejemplo-de-cuadro-comparativo)
4. [Notas adicionales](#notas-adicionales)
5. [Solución](#solución)
6. [Conclusión](#conclusión)
7. [Referencias](#referencias)

## Objetivo

- Investigar y comparar diferentes tipos de SGBD (Sistemas Gestores de Bases de Datos) para identificar sus características, ventajas y casos de uso.

## Instrucciones

1. **Tipos de SGBD a investigar**: Deberás buscar información sobre **al menos cinco (5)** SGBD pertenecientes a los siguientes tipos:  
    - **Relacionales** (MySQL, PostgreSQL).
    - **NoSQL** (MongoDB, Cassandra).
    - **Orientados a grafos** (Neo4j, ArangoDB).
    - **Almacenamiento en la nube** (Amazon RDS, Google BigQuery).
    - **Otros** (orientados a objetos, distribuidos, u otros tipos especializados).
2. **Aspectos a investigar**: Para cada SGBD, responde las siguientes preguntas:
    - ¿Cuál es su modelo de datos principal (relacional, NoSQL, grafos, etc.)?
    - ¿Cuáles son sus principales características técnicas?
    - ¿En qué casos de uso se recomienda utilizarlo?
    - ¿Qué ventajas tiene frente a otros SGBD similares?
    - ¿Cuáles son sus limitaciones o desventajas?
3. **Formato del informe**: Presenta la información en un cuadro comparativo con las siguientes columnas:
    - **Nombre del SGBD**
    - **Tipo de SGBD**
    - **Modelo de datos**
    - **Características principales**
    - **Ventajas**
    - **Limitaciones**
    - **Casos de uso recomendados**
4. **Entrega**:
    - El cuadro comparativo debe estar acompañado de una **conclusión personal** de **máximo 200 palabras**, explicando cuál de los SGBD investigados te parece más interesante, útil y por qué.

## Ejemplo de cuadro comparativo

| Nombre del SGBD | Tipo de SGBD | Modelo de datos     | Características principales                 | Ventajas                            | Limitaciones                            | Casos de uso                  |
| :-------------: | :----------: | :-----------------: | :------------------------------------------ | :---------------------------------- | :-------------------------------------- | :---------------------------- |
| MySQL           | Relacional   | Tablas relacionales | Open source, soporte a SQL, gran comunidad. | Fácil de usar, escalable.           | Menor soporte para NoSQL.               | Aplicaciones web, e-commerce. |
| MongoDB         | NoSQL        | Documentos          | Almacena datos en formato JSON.             | Flexible, escalabilidad horizontal. | Menos eficiente en consultas complejas. | Big data, apps móviles.       |

## Notas adicionales

- Usa fuentes confiables para tu investigación, como la documentación oficial de cada SGBD, artículos técnicos o tutoriales especializados.
- Sé claro y conciso al llenar las columnas del cuadro comparativo.

## Solución

| Nombre del SGBD | Tipo de SGBD              | Modelo de datos         | Características principales                                                                 | Ventajas                                                               | Limitaciones                                                                                | Casos de uso                                                          |
| :-------------: | :-----------------------: | :---------------------: | :------------------------------------------------------------------------------------------ | :--------------------------------------------------------------------- | :------------------------------------------------------------------------------------------ | :-------------------------------------------------------------------- |
| Oracle          | Relacional                | Tablas relacionales     | Base de datos empresarial, soporta SQL, transacciones ACID, replicación, particionamiento.  | Alta disponibilidad, seguridad avanzada, herramientas de optimización. | Costos elevados, complejidad en la configuración, menor flexibilidad en proyectos pequeños. | Grandes empresas, sistemas financieros, ERP, CRM.                     |
| MongoDB         | NoSQL                     | Documentos (JSON-like)  | Almacena documentos en formato BSON (extensión de JSON), escalabilidad horizontal.          | Alta flexibilidad, escalabilidad horizontal, alto rendimiento.         | No es ideal para consultas complejas.                                                       | Big data, aplicaciones móviles.                                       |
| Neo4j           | Orientado a grafos        | Grafos                  | Almacena relaciones entre nodos, consultas con lenguaje Cypher, eficiente en grafos.        | Ideal para relaciones complejas y consultas de grafos.                 | No optimizado para datos no relacionados.                                                   | Redes sociales, recomendaciones, sistemas de gestión de redes.        |
| Google BigQuery | Almacenamiento en la nube | Columnar (SQL)          | Almacenamiento y análisis de grandes volúmenes de datos, SQL optimizado para grandes datos. | Velocidad de procesamiento, sin necesidad de infraestructura.          | No adecuado para transacciones frecuentes o actualizaciones rápidas.                        | Análisis de big data, data lakes.                                     |
| Apache HBase    | Distribuido               | Columnas (Modelo de CF) | Distribuido, basado en Hadoop, alto rendimiento en lectura/escritura.                       | Escalabilidad, soporta grandes volúmenes de datos.                     | Requiere una infraestructura Hadoop, no adecuado para consultas SQL tradicionales.          | Big data, sistemas distribuidos, almacenamiento de series temporales. |

## Conclusión

De los SGBD investigados, MongoDB destaca como una opción sumamente interesante por su flexibilidad y capacidad de adaptarse a proyectos modernos, especialmente aquellos que requieren manejar datos no estructurados o con esquemas dinámicos.

Su modelo basado en documentos (JSON-like) facilita la integración con aplicaciones web y móviles, además resulta particularmente útil en el desarrollo de bots de Discord, los cuales requieren un almacenamiento ágil, eficiente y capaz de ajustarse a cambios constantes en los datos, como configuraciones de servidores, estadísticas de usuarios o sistemas de roles personalizados.

Puedes consultar mi repositorio donde actualmente desarrollo un bot de Discord de código abierto en el siguiente [enlace](https://github.com/FJrodafo/DiscordAPP), además cuento con otro proyecto relacionado con Discord, que interactúa con la API (Application Programming Interface) de Discord para crear tu propio CRPS (Custom Rich Presence Status), también de código abierto en el siguiente [enlace](https://github.com/FJrodafo/DiscordCRPS).

Fue a través del desarrollo de bots de Discord que me interesé por el mundo de la informática y la programación. Aunque aún no he implementado una base de datos MongoDB en mi proyecto, es una tarea pendiente que tengo para el futuro. Espero aprender mucho sobre bases de datos este año y así poder integrar MongoDB en mi proyecto, cumpliendo con este objetivo en el camino.

## Referencias

- **Sistemas Gestores de Bases de Datos**:
    - [MySQL](https://www.mysql.com/)
    - [Oracle](https://www.oracle.com/)
    - [MongoDB](https://www.mongodb.com/)
    - [Neo4j](https://neo4j.com/)
    - [Google BigQuery](https://cloud.google.com/bigquery)
    - [Apache HBase](https://hbase.apache.org/)
- **Tipos de SGBD**:
    - [MongoDB - What is NoSQL?](https://www.mongodb.com/resources/basics/databases/nosql-explained)
    - [MongoDB - What is a Distributed Database?](https://www.mongodb.com/resources/basics/databases/distributed-database)
    - [IBM - What is a Relational Database?](https://www.ibm.com/think/topics/relational-databases)
    - [Oracle - What is a Relational Database?](https://www.oracle.com/database/what-is-a-relational-database/)
    - [Oracle - What is a Graph Database?](https://www.oracle.com/autonomous-database/what-is-graph-database/)
    - [AWS - What is a Graph Database?](https://aws.amazon.com/nosql/graph/)
    - [Google - What is a Cloud Database?](https://cloud.google.com/learn/what-is-a-cloud-database)
- **Modelo de datos**:
    - [Stack Overflow Blog - A beginner's guide to JSON, the data format for the internet](https://stackoverflow.blog/2022/06/02/a-beginners-guide-to-json-the-data-format-for-the-internet/)
    - [Stack Overflow Blog - Why do we need column families in Hbase?](https://stackoverflow.com/questions/64944559/why-do-we-need-column-families-in-hbase)
    - [W3Schools - SQL Tutorial](https://www.w3schools.com/sql/)
    - [Database.Guide - What does ACID mean in Database Systems?](https://database.guide/what-is-acid-in-databases/)
- **Otros**:
    - [Oracle - What Is Big Data?](https://www.oracle.com/big-data/what-is-big-data/)
    - [Oracle - What is ERP?](https://www.oracle.com/erp/what-is-erp/)
    - [Zendesk - What is CRM?](https://www.zendesk.es/blog/create-crm-database/#)
    - [Microsoft - What is Data Lake?](https://azure.microsoft.com/en-us/resources/cloud-computing-dictionary/what-is-a-data-lake/)
    - [IBM - What is Data Lake?](https://www.ibm.com/think/topics/data-lake)