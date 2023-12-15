document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('contactForm');

    form.addEventListener('submit', function (event) {
        event.preventDefault();

        // Validar el formulario antes de enviarlo (puedes implementar una validación más completa)
        if (validateForm()) {
            form.submit(); // Enviar el formulario si es válido
        }
    });

    function validateForm() {
        let isValid = true;

        // Verificar cada campo del formulario
        const fields = form.querySelectorAll('input, textarea');
        fields.forEach(function (field) {
            if (!field.value.trim()) {
                isValid = false;
                alert('Todos los campos son obligatorios');
            }
        });

        return isValid;
    }
});
