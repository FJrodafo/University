package Introduccion_a_JAVA.Ejemplos;

public class Hexadecimal {
    public static void main(String[] args) {

        byte num1 = 0x01; // 1
        System.out.println(num1);

        byte num2 = 0x0f; // 15
        System.out.println(num2);

        byte num3 = 0x10; // 16
        System.out.println(num3);

        byte num4 = 0x11; // 17
        System.out.println(num4);

        byte num5 = 0x20; // 32
        System.out.println(num5);

        int num6 = 0xff; // 255
        System.out.println(num6);

        byte num7 = (byte) 0xff; // 0000 0001 = 1 --> 1111 1111 = -1
        System.out.println(num7);

        int num8 = 0x80; // 128
        System.out.println(num8);

        byte num9 = (byte) 0x80; // -128
        System.out.println(num9);

        byte num10 = (byte) 0x81; // -127
        System.out.println(num10);

        byte num11 = (byte) 0x82; // -126
        System.out.println(num11);

        int num12 = 0x82; // 130
        System.out.println(num12);

        int num13 = 0x80000000; // -2147483648
        System.out.println(num13);

        int num14 = 0xffffffff; // -1
        System.out.println(num14);

        byte num15 = 0x5f; // 95
        System.out.println(num15);

        short num16 = 0x5f; // 95
        System.out.println(num16);

        int num17 = 0x5f; // 95
        System.out.println(num17);

        long num18 = 0x5f; // 95
        System.out.println(num18);

        byte num19 = (byte) 0b11110000; // F0 = -16
        System.out.println(num19);

        byte num20 = (byte) 0b00001111; // 0F = 15
        System.out.println(num20);

        byte num21 = (byte) 0b11110001; // F1 = -15
        System.out.println(num21);
    }
}
