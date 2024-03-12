import React from 'react';
import { useTranslation } from 'react-i18next';

const Principal = () => {
    const { t } = useTranslation();
    return (
        <div>
            <h1>{t('titlePrincipal')}</h1>
        </div>
    );
};

export default Principal;
