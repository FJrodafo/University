import React, { useEffect } from 'react';
import './assets/styles/app.css';
import Header from './components/header/Header.jsx';
import Footer from './components/footer/Footer.jsx';
import { ThemeProvider } from './components/context/theme/Theme.jsx';

function App() {
  useEffect(() => {
    const savedTheme = localStorage.getItem('theme');
    document.body.setAttribute('data-theme', savedTheme || 'light');
  }, []);

  return (
    <>
      <ThemeProvider>
        <Header />
        <Footer />
      </ThemeProvider>
    </>
  );
};

export default App;
