import React from 'react';
import { useTranslation } from './../../providers/translation/Translation.jsx';

function Header() {
  const { translations, toggleLanguage } = useTranslation();
  const handleToggleLanguage = () => { toggleLanguage() };
  // Check if translations are loaded, otherwise provide default values.
  if (!translations.header) return <header>Loading...</header>;

  return (
    <header>
      <h2>{translations.header.title}</h2>
      <p>{translations.header.sentence}</p>
      <p>{translations.header.texts.nested.even_more}</p>
      <p>{translations.header.texts.word}</p>
      <button onClick={handleToggleLanguage}>
        {translations.translate}
      </button>
    </header>
  );
};

export default Header;
