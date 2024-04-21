import React from 'react';
import { useTranslation } from './../../context/translation/Translation.jsx';

function Footer() {
  const { t } = useTranslation();

  return (
    <footer>
      <h2>{t('footer.title')}</h2>
      <p>{t('footer.texts.language')}</p>
      <p>{t('footer.texts.copyright')}</p>
    </footer>
  );
};

export default Footer;
