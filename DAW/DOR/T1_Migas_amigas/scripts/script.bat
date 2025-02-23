:: Creando el proyecto
npx create-react-app migas-amigas
cd migas-amigas

:: Instalando dependencias
npm install i18next react-i18next react-router-dom
git add -A && git commit -m "Install dependencies"

:: Limpiando el proyecto
del src\setupTests.js src\App.test.js src\reportWebVitals.js src\logo.svg
git add -A && git commit -m "Remove files"

:: Creando estructura de carpetas y ficheros
mkdir src\components src\components\layout src\constants src\router src\views
type NUL > src\i18n.ts
type NUL > src\components\layout\Footer.js
type NUL > src\components\layout\HeaderNav.tsx
type NUL > src\constants\Langs.ts
type NUL > src\router\MisRutas.js
type NUL > src\views\Contacto.js
type NUL > src\views\Empanadas.js
type NUL > src\views\Error404.js
type NUL > src\views\Inicio.js
type NUL > src\views\Panaderia.js
type NUL > src\views\PasteleriaBolleria.js
git add -A && git commit -m "Create folder and file structure"

:: Actualizando App.js
echo import './App.css';^
    import { useTranslation } from 'react-i18next';^
    import MisRutas from './router/MisRutas.js';^
    ^
    function App() {^
        const { t } = useTranslation();^
        return (^
            <div>^
                <h1>{t('titleApp')}</h1>^
                <MisRutas />^
            </div>^
        );^
    }^
    ^
    export default App; > src\App.js
git add -A && git commit -m "Update App.js"

:: Actualizando i18n.ts
echo import i18n from 'i18next';^
    import { initReactI18next } from 'react-i18next';^
    ^
    i18n.use(initReactI18next).init({^
        lng: 'es',^
        fallbackLng: 'es',^
        interpolation: {^
            escapeValue: false,^
        },^
        resources: {^
            es: {^
                translation: {^
                    titleApp: 'PROYECTO Migas amigas',^
                    titleFooter: 'Pié de página',^
                    titleHeader: 'Cabecera y barra de navegacion',^
                    navInicio: 'Inicio',^
                    navPanaderia: 'Panadería',^
                    navPasteleriaBolleria: 'Pastelería y bollería',^
                    navEmpanadas: 'Empanadas',^
                    navContacto: 'Contacto',^
                    titleContacto: 'Esta es la página contacto',^
                    titleEmpanadas: 'Esta es la página empanadas',^
                    titleError404: 'Error 404 no encontrado',^
                    titlePanaderia: 'Esta es la página panaderia',^
                    titlePasteleriaBolleria: 'Esta es la página pastelería y bollería',^
                    titleInicio: 'Esta es la página principal',^
                }^
            },^
            pt: {^
                translation: {^
                    titleApp: 'PROJETO Migas amigas',^
                    titleFooter: 'Pé de página',^
                    titleHeader: 'Cabeçalho e barra de navegação',^
                    navInicio: 'Início',^
                    navPanaderia: 'Padaria',^
                    navPasteleriaBolleria: 'Pastelaria',^
                    navEmpanadas: 'Empanadas',^
                    navContacto: 'Contato',^
                    titleContacto: 'Esta é a página de contato',^
                    titleEmpanadas: 'Esta é a página das empanadas',^
                    titleError404: 'Erro 404 não encontrado',^
                    titlePanaderia: 'Esta é a página da padaria',^
                    titlePasteleriaBolleria: 'Esta é a página de pastelaria',^
                    titleInicio: 'Esta é a página principal',^
                }^
            },^
        },^
    });^
    ^
    export default i18n; > src\i18n.ts
git add -A && git commit -m "Update i18n.ts"

:: Actualizando index.js
echo import React from 'react';^
    import ReactDOM from 'react-dom/client';^
    import './i18n.ts';^
    import './index.css';^
    import App from './App';^
    ^
    const container = document.getElementById('root');^
    const root = ReactDOM.createRoot(container);^
    root.render(<App />); > src\index.js
git add -A && git commit -m "Update index.js"

:: Actualizando Footer.js
echo import React from 'react';^
    import { useTranslation } from 'react-i18next';^
    ^
    const Footer = () => {^
        const { t } = useTranslation();^
        return (^
            <div>^
                <h1>{t('titleFooter')}</h1>^
            </div>^
        );^
    };^
    ^
    export default Footer; > src\components\layout\Footer.js
git add -A && git commit -m "Update Footer.js"

:: Actualizando HeaderNav.tsx
echo import React from 'react';^
    import { useTranslation } from 'react-i18next';^
    import { LANGUAGES } from './../../constants/Langs.ts';^
    import { NavLink } from 'react-router-dom';^
    ^
    const HeaderNav = () => {^
        const { i18n, t } = useTranslation();^
        const onChangeLang = (e: React.ChangeEvent<HTMLSelectElement>) => {^
            const lang_code = e.target.value;^
            i18n.changeLanguage(lang_code);^
        };^
        return (^
            <div>^
                <h1>{t('titleHeader')}</h1>^
                <select defaultValue={i18n.language} onChange={onChangeLang}>^
                    {LANGUAGES.map(({ code, label }) => (^
                        <option key={code} value={code}>^
                            {label}^
                        </option>^
                    ))}^
                </select>^
                <ul>^
                    <li><NavLink to='/'>{t('navInicio')}</NavLink></li>^
                    <li><NavLink to='/Panaderia'>{t('navPanaderia')}</NavLink></li>^
                    <li><NavLink to='/PasteleriaBolleria'>{t('navPasteleriaBolleria')}</NavLink></li>^
                    <li><NavLink to='/Empanadas'>{t('navEmpanadas')}</NavLink></li>^
                    <li><NavLink to='/Contacto'>{t('navContacto')}</NavLink></li>^
                </ul>^
            </div>^
        );^
    }^
    ^
    export default HeaderNav; > src\components\layout\HeaderNav.tsx
git add -A && git commit -m "Update HeaderNav.tsx"

:: Actualizando Langs.ts
echo export const LANGUAGES = [^
    { label: 'Spanish', code: 'es' },^
    { label: 'Portuguese', code: 'pt' },^
]; > src\constants\Langs.ts
git add -A && git commit -m "Update Langs.ts"

:: Actualizando MisRutas.js
echo import React from 'react';^
    import { Routes, Route, BrowserRouter } from 'react-router-dom';^
    import Inicio from '../views/Inicio.js';^
    import Panaderia from '../views/Panaderia.js';^
    import PasteleriaBolleria from '../views/PasteleriaBolleria.js';^
    import Empanadas from '../views/Empanadas.js';^
    import Contacto from '../views/Contacto.js';^
    import Error404 from '../views/Error404.js';^
    import HeaderNav from '../components/layout/HeaderNav.tsx';^
    import Footer from '../components/layout/Footer.js';^
    ^
    const MisRutas = () => {^
        return (^
            <BrowserRouter>^
                {/* Header y navegacion */}^
                <HeaderNav />^
                <hr />^
                {/* Contenido central */}^
                <Routes>^
                    <Route path='/' element={<Inicio />} />^
                    <Route path='/Inicio' element={<Inicio />} />^
                    <Route path='/Panaderia' element={<Panaderia />} />^
                    <Route path='/PasteleriaBolleria' element={<PasteleriaBolleria />} />^
                    <Route path='/Empanadas' element={<Empanadas />} />^
                    <Route path='/Contacto' element={<Contacto />} />^
                    <Route path='*' element={<Error404 />} />^
                </Routes>^
                {/* Footer */}^
                <hr />^
                <Footer />^
            </BrowserRouter>^
        );^
    };^
    ^
    export default MisRutas; > src\router\MisRutas.js
git add -A && git commit -m "Update MisRutas.js"

:: Actualizando Contacto.js
echo import React from 'react';^
    import { useTranslation } from 'react-i18next';^
    ^
    const Contacto = () => {^
        const { t } = useTranslation();^
        return (^
            <div>^
                <h1>{t('titleContacto')}</h1>^
            </div>^
        );^
    };^
    ^
    export default Contacto; > src\views\Contacto.js
git add -A && git commit -m "Update Contacto.js"

:: Actualizando Empanadas.js
echo import React from 'react';^
    import { useTranslation } from 'react-i18next';^
    ^
    const Empanadas = () => {^
        const { t } = useTranslation();^
        return (^
            <div>^
                <h1>{t('titleEmpanadas')}</h1>^
            </div>^
        );^
    };^
    ^
    export default Empanadas; > src\views\Empanadas.js
git add -A && git commit -m "Update Empanadas.js"

:: Actualizando Error404.js
echo import React from 'react';^
    import { useTranslation } from 'react-i18next';^
    ^
    const Error404 = () => {^
        const { t } = useTranslation();^
        return (^
            <div>^
                <h1>{t('titleError404')}</h1>^
            </div>^
        );^
    };^
    ^
    export default Error404; > src\views\Error404.js
git add -A && git commit -m "Update Error404.js"

:: Actualizando Inicio.js
echo import React from 'react';^
    import { useTranslation } from 'react-i18next';^
    ^
    const Inicio = () => {^
        const { t } = useTranslation();^
        return (^
            <div>^
                <h1>{t('titleInicio')}</h1>^
            </div>^
        );^
    };^
    ^
    export default Inicio; > src\views\Inicio.js
git add -A && git commit -m "Update Inicio.js"

:: Actualizando Panaderia.js
echo import React from 'react';^
    import { useTranslation } from 'react-i18next';^
    ^
    const Panaderia = () => {^
        const { t } = useTranslation();^
        return (^
            <div>^
                <h1>{t('titlePanaderia')}</h1>^
            </div>^
        );^
    };^
    ^
    export default Panaderia; > src\views\Panaderia.js
git add -A && git commit -m "Update Panaderia.js"

:: Actualizando PasteleriaBolleria.js
echo import React from 'react';^
    import { useTranslation } from 'react-i18next';^
    ^
    const PasteleriaBolleria = () => {^
        const { t } = useTranslation();^
        return (^
            <div>^
                <h1>{t('titlePasteleriaBolleria')}</h1>^
            </div>^
        );^
    };^
    ^
    export default PasteleriaBolleria; > src\views\PasteleriaBolleria.js
git add -A && git commit -m "Update PasteleriaBolleria.js"

:: Ejecutando el proyecto
npm start
