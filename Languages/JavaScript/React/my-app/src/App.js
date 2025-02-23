/*
// Forms
import React from 'react';
import Forms from './Forms';

function App() {
  return (
    <div className="App">
      <Forms names={['Alice', 'Bob', 'Charlie']} />
    </div>
  );
}

export default App;
*/

////////////////////////////////////////////////////////////////////////////////

/*
// Lists & Keys
import React from 'react';
import ListsAndKeys from './ListsAndKeys';

function App() {
  return (
    <div className="App">
      <ListsAndKeys names={['Alice', 'Bob', 'Charlie']} />
    </div>
  );
}

export default App;
*/

////////////////////////////////////////////////////////////////////////////////

/*
// Capture how many times the component has been clicked
import React from 'react';
import ClickEvent from './ClickEvent';

function App() {
  return (
    <div className="App">
      <ClickEvent />
    </div>
  );
}

export default App;
*/

////////////////////////////////////////////////////////////////////////////////

/*
// Properties (props) This allows us to pass data from parent components to child components
import React from 'react';
import HelloCoder from './HelloCoder';

function App() {
  return (
    <div className="App">
      <HelloCoder name="Coder" />
    </div>
  );
}

export default App;
*/

////////////////////////////////////////////////////////////////////////////////

/*
// Hello, World!
import React from 'react';
import HelloWorld from './HelloWorld';

function App() {
  return (
    <div className="App">
      <HelloWorld />
    </div>
  );
}

export default App;
*/

////////////////////////////////////////////////////////////////////////////////

// Default
import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
