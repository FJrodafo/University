// Imports the necessary functions and component from React to create a context, use the context hook, and utilize state and effect hooks.
import React, { createContext, useContext, useState, useEffect } from 'react';

// Creates an empty theme context.
const ThemeContext = createContext();

// Defines a custom hook called useTheme that uses the theme context. This hook will be used to access the current theme and the theme toggle function from any child component of ThemeProvider.
const useTheme = () => useContext(ThemeContext);

// Defines the ThemeProvider component which will be the provider of the theme context for the entire application. It takes a children prop, which are the child components that will be wrapped by this context provider.
const ThemeProvider = ({ children }) => {
  // Defines a state called theme that stores the current theme. It initializes with the value stored in local storage (if present) or with 'light' as the default value. setTheme is a function to update the theme state.
  const [theme, setTheme] = useState(localStorage.getItem('theme') || 'light');

  // Uses a React effect that runs when the value of theme changes. In this effect, it saves the current theme to local storage.
  useEffect(() => {
    // Saves the current theme to local storage, ensuring it persists even after page reload.
    localStorage.setItem('theme', theme);
  }, [theme]);

  // Defines a toggleTheme function that switches between light and dark themes. It updates the theme state with the new theme and also sets the data-theme attribute on the body element to reflect the theme change.
  const toggleTheme = () => {
    const newTheme = theme === 'light' ? 'dark' : 'light';
    setTheme(newTheme);
    document.body.setAttribute('data-theme', newTheme);
  };

  return (
    // Wraps the child components (children) with the ThemeContext provider. Provides the current theme and the toggleTheme function as context values so they are available to child components using the useTheme hook.
    <ThemeContext.Provider value={{ theme, toggleTheme }}>
      {children} {/* Renders the child components within the context provider. */}
    </ThemeContext.Provider>
  );
};

// Exports the useTheme hook and the ThemeProvider component so they can be used in other files of the application.
export { useTheme, ThemeProvider };
