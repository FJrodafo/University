import React from 'react';
import { useTranslation } from 'react-i18next';

const Inicio = () => {
    const { t } = useTranslation();
    return (
        <div>
            <h2>{t('titles.Inicio')}</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Necessitatibus dicta veritatis tenetur optio nemo ipsam delectus nostrum, laborum consectetur temporibus enim adipisci doloribus velit possimus nam libero numquam atque illo!</p>
        </div>
    );
};

export default Inicio;
