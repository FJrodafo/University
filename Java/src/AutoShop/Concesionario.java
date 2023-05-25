package AutoShop;

public class Concesionario {
    // Atributos
    private int numVehiculos;
    private Vehiculo[] vehiculos;

    public Concesionario() {
        this.numVehiculos = 0;
        this.vehiculos = new Vehiculo[4];
    }

    public int insertarVehiculo(Vehiculo v) {
        if (this.numVehiculos == this.vehiculos.length) {
            return -1;
        }
        if (this.buscarVehiculo(v.getMatricula()) != null) {
            return -2;
        } else {
            // this.vehiculos[this.numVehiculos++] = v;
            this.vehiculos[this.numVehiculos] = v;
            this.numVehiculos++;
            return 0;
        }
    }

    public void listarVehiculos() {
        for (int i = 0; i < numVehiculos; i++) {
            Vehiculo v = this.vehiculos[i];
            System.out.println("Vehículo " + (i + 1) + " " + v.toString());
        }
    }

    /*
    public String buscarVehiculo(String matricula) {
    for (int i = 0; i < numVehiculos; i++) {
    Vehiculo v = this.vehiculos[i];
    if (v.getMatricula().equals(matricula)) {
    return v.toString();
    }
    }
    return null;
    }
    */

    public Vehiculo buscarVehiculo(String matricula) {
        for (int i = 0; i < numVehiculos; i++) {
            Vehiculo v = this.vehiculos[i];
            if (v.getMatricula().equals(matricula)) {
                return v;
            }
        }
        return null;
    }

    public boolean modificarKilometros(String matricula, int numKm) {
        for (int i = 0; i < numVehiculos; i++) {
            Vehiculo v = this.vehiculos[i];
            if (v.getMatricula().equals(matricula)) {
                return true;
            }
        }
        return false;
    }
}
