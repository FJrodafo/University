import i18n from 'i18next';
import { initReactI18next } from 'react-i18next';
import en from './i18n/en/translation.json';
import es from './i18n/es/translation.json';

const savedLanguage = localStorage.getItem('language') || 'en';

i18n.use(initReactI18next).init({
    lng: savedLanguage,
    fallbackLng: 'en',
    interpolation: { escapeValue: false },
    resources: {
        en: {
            translation: en,
        },
        es: {
            translation: es,
        },
    },
});

export default i18n;
