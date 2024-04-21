import React from 'react';
import './../../../assets/styles/header.css';
import { useTheme } from './../../context/theme/Theme.jsx';

function Header() {
  const { theme, toggleTheme } = useTheme();
  const handleToggleTheme = () => { toggleTheme() };

  return (
    <header>
      <h2>Header</h2>
      <p className='text'>Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima illum, obcaecati laborum unde voluptas non? Repellat error natus placeat distinctio tempore, expedita libero quaerat recusandae quasi fugit. Facilis, eos error?</p>
      <button onClick={handleToggleTheme}>
        {theme === 'light' ? 'Dark' : 'Light'}
      </button>
    </header>
  );
};

export default Header;
