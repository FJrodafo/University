import React from 'react';
import { useTranslation } from 'react-i18next';

const Error404 = () => {
    const { t } = useTranslation();
    return (
        <div>
            <h2>{t('titles.Error404')}</h2>
            <img src="/not_found.png" alt={t('titles.Error404')} />
        </div>
    );
};

export default Error404;
