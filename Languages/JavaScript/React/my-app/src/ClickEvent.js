import React from 'react';

class ClickEvent extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            clicks: 0
        };

        this.handleClick = this.handleClick.bind(this);
    }

    handleClick() {
        this.setState({
            clicks: this.state.clicks + 1
        });
    }

    render() {
        return (
            <div>
                <h1 onClick={this.handleClick}>Click Event!</h1>
                <p onClick={this.handleClick}>You have clicked this component {this.state.clicks} time/s.</p>
            </div>
        );
    }
}

export default ClickEvent;
