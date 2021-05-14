import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import registerServiceWorker from './registerServiceWorker';
import Liquid from './Liquid';

var water = {
    name: 'water',
    freezing: 32,
    boiling: 212
};

var ethanol = {
    name: 'ethanol',
    freezing: -173.2,
    boiling: 173.1
}

ReactDOM.render(<App />, document.getElementById('root'));
ReactDOM.render(<Liquid config={water} />, document.getElementById('water'));
ReactDOM.render(<Liquid config={ethanol} />, document.getElementById('ethanol'));
registerServiceWorker();
