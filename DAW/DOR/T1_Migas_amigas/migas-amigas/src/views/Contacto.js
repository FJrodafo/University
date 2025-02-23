import React from 'react';
import { useTranslation } from 'react-i18next';

const Contacto = () => {
    const { t } = useTranslation();
    const contactoInfo = {
        direccion: "C. las Cabezas, 7, 38400 Puerto de la Cruz, Santa Cruz de Tenerife",
        telefono: "922 38 01 12",
    };

    return (
        <div>
            <h1>{t('titles.Contacto')}</h1>
            <p><strong>{t('texts.Direccion')}:</strong> {contactoInfo.direccion}</p>
            <p><strong>{t('texts.Telefono')}:</strong> {contactoInfo.telefono}</p>
            <iframe
                title="Mapa de ubicación"
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1754.6179118160214!2d-16.551430305005688!3d28.412140255627644!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xc6a7fecebf92cdd%3A0x97e763bf7638fd44!2sIES%20Puerto%20de%20la%20Cruz!5e0!3m2!1sen!2ses!4v1710509226752!5m2!1sen!2ses"
                width="600"
                height="450"
                style={{ border: 0 }}
                loading="lazy"
            />
        </div>
    );
};

export default Contacto;
