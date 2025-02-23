import React from 'react';
import { useTranslation } from 'react-i18next';

const Footer = () => {
    const { t } = useTranslation();
    return (
        <div>
            <h1>{t('titles.Footer')}</h1>
            <p>{t('texts.Footer')}
                <a href="https://fjrodafo.github.io" target="_blank" rel="noopener noreferrer">Francisco José Rodríguez Afonso.</a>
            </p>
        </div>
    );
};

export default Footer;
