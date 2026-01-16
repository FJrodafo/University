## Diffie-Hellman

1. Parámetros públicos
    * Un número grande `p`
    * Un generador `g`
2. Secretos privados
    * Cliente elige un secreto `a`
    * Servidor elige un secreto `b`
3. Valores públicos
    * Cliente envía `A = gᵃ mod p`
    * Servidor envía `B = gᵇ mod p`
4. Cálculo de la clave
    * Cliente calcula `K = Bᵃ mod p`
    * Servidor calcula `K = Aᵇ mod p`
5. ¿Por qué la clave coincide?
    * Porque matemáticamente `(gᵇ)ᵃ = (gᵃ)ᵇ`
6. ¿Cómo sabes que A y B vienen realmente de la otra parte?
    * Diffie-Hellman no lo sabe...
    * Un atacante puede:
        * Interceptar A y B
        * Crear dos claves distintas
        * Hacerse pasar por cada lado (ataque Man-in-the-Middle)
7. ¿Cómo se soluciona en la práctica?
    * Se añade autenticación, normalmente con:
        * Firmas digitales
        * Certificados digitales
    * En HTTPS:
        * El servidor firma los valores de Diffie-Hellman
        * El cliente verifica la firma con el certificado
    * Así se asegura que:
        * Los valores no han sido modificados
        * La clave pertenece al servidor correcto
8. Resumen
    * Diffie-Hellman garantiza que ambas partes calculan la misma clave secreta, pero no verifica la identidad de los participantes; para asegurar que la clave es correcta y evitar ataques de intermediario, se combina con autenticación mediante firmas y certificados digitales.