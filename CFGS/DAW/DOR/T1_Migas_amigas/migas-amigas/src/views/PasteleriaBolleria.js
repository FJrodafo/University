import React from 'react';
import { useTranslation } from 'react-i18next';

const PasteleriaBolleria = () => {
    const { t } = useTranslation();
    const productosPanaderia = t('productos.pasteleria', { returnObjects: true });

    return (
        <div>
            <h2>{t('titles.PasteleriaBolleria')}</h2>
            <div className="productos-container">
                {productosPanaderia.map((producto, index) => (
                    <div key={index} className="producto">
                        <img src={producto.imagen} alt={producto.nombre} />
                        <h3>{producto.nombre}</h3>
                        <p>{producto.descripcion}</p>
                        <p>{producto.elaboracion}</p>
                    </div>
                ))}
            </div>
        </div>
    );
};

export default PasteleriaBolleria;
