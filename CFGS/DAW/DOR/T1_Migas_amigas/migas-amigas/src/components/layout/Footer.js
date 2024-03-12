import React from 'react';
import { useTranslation } from 'react-i18next';

const Footer = () => {
    const { t } = useTranslation();
    return (
        <div>
            <h1>{t('titleFooter')}</h1>
        </div>
    );
};

export default Footer;
