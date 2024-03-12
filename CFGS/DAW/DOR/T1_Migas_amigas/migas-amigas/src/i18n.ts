import i18n from 'i18next';
import { initReactI18next } from 'react-i18next';

i18n.use(initReactI18next).init({
    lng: 'es',
    fallbackLng: 'es',
    interpolation: {
        escapeValue: false,
    },
    resources: {
        es: {
            translation: {
                titleApp: 'PROYECTO Migas amigas',
                titleFooter: 'Pié de página',
                titleHeader: 'Cabecera y barra de navegacion',
                navPrincipal: 'Principal',
                navPanaderia: 'Panadería',
                navPasteleriaBolleria: 'Pastelería y bollería',
                navEmpanadas: 'Empanadas',
                navContacto: 'Contacto',
                titleContacto: 'Esta es la página contacto',
                titleEmpanadas: 'Esta es la página empanadas',
                titleError404: 'Error 404 no encontrado',
                titlePanaderia: 'Esta es la página panaderia',
                titlePasteleriaBolleria: 'Esta es la página pastelería y bollería',
                titlePrincipal: 'Esta es la página principal',
            }
        },
        pt: {
            translation: {
                titleApp: 'PROJETO Migas amigas',
                titleFooter: 'Pé de página',
                titleHeader: 'Cabeçalho e barra de navegação',
                navPrincipal: 'Principal',
                navPanaderia: 'Padaria',
                navPasteleriaBolleria: 'Pastelaria',
                navEmpanadas: 'Empanadas',
                navContacto: 'Contato',
                titleContacto: 'Esta é a página de contato',
                titleEmpanadas: 'Esta é a página das empanadas',
                titleError404: 'Erro 404 não encontrado',
                titlePanaderia: 'Esta é a página da padaria',
                titlePasteleriaBolleria: 'Esta é a página de pastelaria',
                titlePrincipal: 'Esta é a página principal',
            }
        },
    },
});

export default i18n;
