import React from 'react';
import { useTranslation } from 'react-i18next';

const Panaderia = () => {
    const { t } = useTranslation();
    return (
        <div>
            <h1>{t('titlePanaderia')}</h1>
        </div>
    );
};

export default Panaderia;
