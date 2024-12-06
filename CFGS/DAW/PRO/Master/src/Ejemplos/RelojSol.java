package Ejemplos;

public class RelojSol {
    public static void main(String[] args) {
        System.out.println("Hora: 00:00 - Periodo: " + getPeriodo(0, 00));
        System.out.println("Hora: 00:59 - Periodo: " + getPeriodo(0, 59));
        System.out.println("Hora: 01:00 - Periodo: " + getPeriodo(1, 00));
        System.out.println("Hora: 03:59 - Periodo: " + getPeriodo(3, 59));
        System.out.println("Hora: 04:00 - Periodo: " + getPeriodo(4, 00));
        System.out.println("Hora: 06:29 - Periodo: " + getPeriodo(6, 29));
        System.out.println("Hora: 06:30 - Periodo: " + getPeriodo(6, 30));
        System.out.println("Hora: 07:00 - Periodo: " + getPeriodo(7, 00));
        System.out.println("Hora: 07:29 - Periodo: " + getPeriodo(7, 29));
        System.out.println("Hora: 07:30 - Periodo: " + getPeriodo(7, 30));
        System.out.println("Hora: 09:59 - Periodo: " + getPeriodo(9, 59));
        System.out.println("Hora: 10:00 - Periodo: " + getPeriodo(10, 00));
        System.out.println("Hora: 11:59 - Periodo: " + getPeriodo(11, 59));
        System.out.println("Hora: 12:00 - Periodo: " + getPeriodo(12, 00));
        System.out.println("Hora: 12:59 - Periodo: " + getPeriodo(12, 59));
        System.out.println("Hora: 13:00 - Periodo: " + getPeriodo(13, 00));
        System.out.println("Hora: 15:59 - Periodo: " + getPeriodo(15, 59));
        System.out.println("Hora: 16:00 - Periodo: " + getPeriodo(16, 00));
        System.out.println("Hora: 18:29 - Periodo: " + getPeriodo(18, 29));
        System.out.println("Hora: 18:30 - Periodo: " + getPeriodo(18, 30));
        System.out.println("Hora: 19:00 - Periodo: " + getPeriodo(19, 00));
        System.out.println("Hora: 19:29 - Periodo: " + getPeriodo(19, 29));
        System.out.println("Hora: 19:30 - Periodo: " + getPeriodo(19, 30));
        System.out.println("Hora: 20:59 - Periodo: " + getPeriodo(20, 59));
        System.out.println("Hora: 21:00 - Periodo: " + getPeriodo(21, 00));
        System.out.println("Hora: 23:59 - Periodo: " + getPeriodo(23, 59));
    }

    static String getPeriodo(int hour, int min) {
        return (hour >= 21) ? "Night" :
        (hour >= 20) || (hour == 19 && min >= 30) ? "Evening" :
        (hour == 19 && min < 30) || (hour == 18 && min >= 30) ? "Dusk" :
        (hour == 18 && min < 30) || (hour >= 16) ? "Late Afternoon" :
        (hour >= 13) ? "Afternoon" :
        (hour == 12) ? "Midday" :
        (hour >= 10) ? "Late Morning" :
        (hour >= 8) || (hour == 7 && min >= 30) ? "Morning" :
        (hour == 7 && min < 30) || (hour == 6 && min >= 30) ? "Dawn" :
        (hour == 6 && min < 30) || (hour >= 4) ? "Early Morning" :
        (hour >= 1) ? "Night" :
        (hour == 0) ? "Midnight" : "Unknown Time";
    }
}
