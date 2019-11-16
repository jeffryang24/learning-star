import React, { Component } from 'react';

class Liquid extends Component {
    constructor(props) {
        super(props);
        this.state = {
          currentTemp: 60
        };
    
        this.setTemperature = this.setTemperature.bind(this);
    }
    
    getInitialState() {
        return {
          currentTemp: 60
        };
    }
    
    setTemperature(event) {
        this.setState({currentTemp: event.target.value});
    }

    render() {
        var stateOfMatter;

        if (this.state.currentTemp <= this.props.config.freezing) {
        stateOfMatter = 'Solid';
        } else if (this.state.currentTemp >= this.props.config.boiling) {
        stateOfMatter = 'Gas';
        } else {
        stateOfMatter = 'Liquid';
        }

        return (
            <div>
                <input type="text" name="txtTemp" id="txtTemp" value={this.state.currentTemp} onChange={this.setTemperature}/>
                <p>
                At {this.state.currentTemp} F, {this.props.config.name} is considered to be a {stateOfMatter}
                </p>
            </div>
        );
    }
}

export default Liquid;