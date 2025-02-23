// Imports the necessary functions and component from React to create a context, use the context hook, and utilize state and effect hooks.
import React, { createContext, useContext, useState, useEffect } from 'react';

// Creates an empty translation context.
const TranslationContext = createContext();

// Defines a custom hook called useTranslation that uses the translation context. This hook will be used to access translations and the language change function from any child component of TranslationProvider.
const useTranslation = () => useContext(TranslationContext);

// Defines the TranslationProvider component which will be the provider of the translation context for the entire application. It takes a children prop, which are the child components that will be wrapped by this context provider.
const TranslationProvider = ({ children }) => {
  // Defines a state called language that stores the current language. It initializes with the value stored in local storage (if present) or with 'en' (English) as the default value. setLanguage is a function to update the language state.
  const [language, setLanguage] = useState(localStorage.getItem('language') || 'en');
  // Defines a state called translations that stores the loaded translations. It initializes with an empty object and setTranslations is a function to update the translations state.
  const [translations, setTranslations] = useState({});

  // Uses a React effect that runs when the value of language changes. In this effect, it saves the current language to local storage and loads the translation file corresponding to the new language.
  useEffect(() => {
    // Saves the current language to local storage, ensuring it persists even after page reload.
    localStorage.setItem('language', language);

    // Defines an asynchronous function loadTranslations that loads the translations corresponding to the current language. It uses import to dynamically load the translation file from the specified location.
    const loadTranslations = async () => {
      // Uses the import function to dynamically load the translation file corresponding to the current language. The file path is dynamically constructed using the value of language.
      const translationData = await import(`./../../../assets/translations/${language}/translation.json`);

      // Updates the translations state with the loaded translations. translationData.default contains the translations object exported from the JSON file.
      setTranslations(translationData.default);
    };

    // Calls the loadTranslations function to load the translations when the TranslationProvider component mounts or when the language changes.
    loadTranslations();
  }, [language]);

  // Defines a toggleLanguage function that switches the language between English and Spanish (from 'en' to 'es' and vice versa). It updates the language state with the new language.
  const toggleLanguage = () => {
    const newLanguage = language === 'en' ? 'es' : 'en';
    setLanguage(newLanguage);
  };

  // Defines the t function which takes a key as input and returns the translation for that key.
  const t = (key) => {
    // Split the key based on '.' to access nested translations
    const keys = key.split('.');

    let translation = translations;

    // Loop through the keys to access nested translations
    for (const k of keys) {
      translation = translation[k];

      // If translation is not found, return the key itself
      if (!translation) return key;
    }
    return translation;
  };

  return (
    // Wraps the child components (children) with the TranslationContext provider. Provides the t function and the toggleLanguage function as context values so they are available to child components using the useTranslation hook.
    <TranslationContext.Provider value={{ t, toggleLanguage }}>
      {children} {/* Renders the child components within the context provider. */}
    </TranslationContext.Provider>
  );
};

// Exports the useTranslation hook and the TranslationProvider component so they can be used in other files of the application.
export { useTranslation, TranslationProvider };
