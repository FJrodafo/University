import Header from './components/layout/header/Header.jsx';
import Footer from './components/layout/footer/Footer.jsx';
import { TranslationProvider } from './components/context/translation/Translation.jsx';

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
