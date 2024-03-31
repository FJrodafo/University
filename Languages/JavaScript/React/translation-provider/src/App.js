import './App.css';
import Header from './components/header/Header.jsx';
import Footer from './components/footer/Footer.jsx';
import { TranslationProvider } from './translation/Translation.jsx';

function App() {
  return (
    <>
      <TranslationProvider>
        <Header />
        <Footer />
      </TranslationProvider>
    </>
  );
};

export default App;
