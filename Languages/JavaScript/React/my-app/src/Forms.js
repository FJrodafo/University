import React from 'react';

class Forms extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            newName: ""
        };

        this.handleChange = this.handleChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleChange(event) {
        this.setState({
            newName: event.target.value
        });
    }

    handleSubmit(event) {
        event.preventDefault();
        this.props.names.push(this.state.newName)
        this.setState({
            newName: ""
        });
    }

    render() {
        const namesList = this.props.names.map((name) =>
            <li key={name}>{name}</li>
        );

        return (
            <div>
                <h1>Hello, Coders!</h1>
                <ul>{namesList}</ul>
                <form onSubmit={this.handleSubmit}>
                    <input type="text" value={this.state.newName} onChange={this.handleChange} />
                    <input type="submit" value="Add Name" />
                </form>
            </div>
        );
    }
}

export default Forms;
