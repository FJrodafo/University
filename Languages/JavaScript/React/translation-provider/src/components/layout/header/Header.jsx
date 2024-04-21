import React from 'react';
import { useTranslation } from './../../context/translation/Translation.jsx';

function Header() {
  const { t, toggleLanguage } = useTranslation();
  const handleToggleLanguage = () => { toggleLanguage() };

  return (
    <header>
      <h2>{t('header.title')}</h2>
      <p>{t('header.sentence')}</p>
      <p>{t('header.texts.nested.even_more')}</p>
      <p>{t('header.texts.word')}</p>
      <button onClick={handleToggleLanguage}>
        {t('translate')}
      </button>
    </header>
  );
};

export default Header;
