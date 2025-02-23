import React from 'react';

class ListsAndKeys extends React.Component {
    render() {
        const namesList = this.props.names.map((name) =>
            <li key={name}>{name}</li>
        );

        return (
            <div>
                <h1>Hello, Coders!</h1>
                <ul>{namesList}</ul>
            </div>
        );
    }
}

export default ListsAndKeys;
