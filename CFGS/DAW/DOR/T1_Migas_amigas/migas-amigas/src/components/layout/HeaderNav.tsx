import React from 'react';
import { useTranslation } from 'react-i18next';
import { LANGUAGES } from './../../constants/Langs.ts';
import { NavLink } from 'react-router-dom';

const HeaderNav = () => {
    const { i18n, t } = useTranslation();
    const onChangeLang = (e: React.ChangeEvent<HTMLSelectElement>) => {
        const lang_code = e.target.value;
        i18n.changeLanguage(lang_code);
    };
    return (
        <div>
            <h1>{t('titles.Header')}</h1>
            <select defaultValue={i18n.language} onChange={onChangeLang}>{LANGUAGES.map(({ code, label }) => (
                <option key={code} value={code}>
                    {label}
                </option>))}
            </select>
            <ul>
                <li><NavLink to='/'>{t('nav.Inicio')}</NavLink></li>
                <li><NavLink to='/Panaderia'>{t('nav.Panaderia')}</NavLink></li>
                <li><NavLink to='/PasteleriaBolleria'>{t('nav.PasteleriaBolleria')}</NavLink></li>
                <li><NavLink to='/Empanadas'>{t('nav.Empanadas')}</NavLink></li>
                <li><NavLink to='/Contacto'>{t('nav.Contacto')}</NavLink></li>
            </ul>
        </div>
    );
}

export default HeaderNav;
