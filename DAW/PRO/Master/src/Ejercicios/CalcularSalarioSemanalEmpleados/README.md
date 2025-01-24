Supongamos que deseas crear un programa para calcular el salario semanal de los empleados de una empresa. El salario se calcula de la siguiente manera:

- Si el empleado trabaja menos de 40 horas a la semana, su salario es de $10 por hora.
- Si el empleado trabaja 40 horas o más a la semana, se le paga $10 por hora por las primeras 40 horas y $15 por hora por las horas extra.
- Para resolver este problema, podrías crear una clase llamada "Empleado" que contenga los siguientes atributos y métodos:

```java
private String nombre; // Nombre del empleado
private double horasTrabajadas; // El número de horas que el empleado trabajó en la semana

/**
 * Devuelve el salario semanal del empleado, utilizando las reglas mencionadas
 * anteriormente.
 * 
 * @return
 */
public double getSalarioSemanal() {
    return salario;
}
```
