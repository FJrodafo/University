import React from 'react';
import { useTranslation } from 'react-i18next';

const Error404 = () => {
    const { t } = useTranslation();
    return (
        <div>
            <h1>{t('titleError404')}</h1>
        </div>
    );
};

export default Error404;
