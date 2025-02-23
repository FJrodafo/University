import logo from './logo.svg';
import './App.css';
import { useTranslation } from 'react-i18next';

function App() {
  const { t, i18n } = useTranslation();

  const languages = [
    { code: 'en', name: 'English' },
    { code: 'es', name: 'Spanish' },
  ]

  const toggleLanguage = () => {
    const newLanguage = i18n.language === 'en' ? 'es' : 'en';
    i18n.changeLanguage(newLanguage);
    localStorage.setItem('language', newLanguage);
  };

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        {languages.map((language) => (
          <button
            onClick={() => {
              i18n.changeLanguage(language.code)
              localStorage.setItem('language', language.code);
            }}
            key={language.code}
          >
            {language.name}
          </button>
        ))}
        <button onClick={toggleLanguage}>
          {t('translate')}
        </button>
        <p>
          {t('header.info1')} <code>src/App.js</code> {t('header.info2')}
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          {t("learn_react")}
        </a>
      </header>
    </div>
  );
}

export default App;
