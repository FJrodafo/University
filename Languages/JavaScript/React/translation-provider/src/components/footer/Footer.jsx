import React from 'react';
import { useTranslation } from './../../providers/translation/Translation.jsx';

function Footer() {
  const { translations } = useTranslation();
  // Check if translations are loaded, otherwise provide default values.
  if (!translations.footer) return '...';

  return (
    <footer>
      <h2>{translations.footer.title}</h2>
      <p>{translations.footer.texts.language}</p>
      <p>{translations.footer.texts.copyright}</p>
    </footer>
  );
};

export default Footer;
