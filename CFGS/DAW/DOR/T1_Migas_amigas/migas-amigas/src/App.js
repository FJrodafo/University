import './App.css';
import { useTranslation } from 'react-i18next';
import MisRutas from './router/MisRutas.js';

function App() {
    const { t } = useTranslation();
    return (
        <div>
            <h1>{t('titles.App')}</h1>
            <MisRutas />
        </div>
    );
}

export default App;
