import React from 'react';
import { useTranslation } from 'react-i18next';

const Empanadas = () => {
    const { t } = useTranslation();
    const productosPanaderia = t('productos.empanadas', { returnObjects: true });

    return (
        <div>
            <h2>{t('titles.Empanadas')}</h2>
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

export default Empanadas;
