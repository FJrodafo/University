import React from 'react';
import { useTranslation } from 'react-i18next';

const PasteleriaBolleria = () => {
    const { t } = useTranslation();
    return (
        <div>
            <h1>{t('titlePasteleriaBolleria')}</h1>
        </div>
    );
};

export default PasteleriaBolleria;
