// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React, { Component } from 'react'
import {
    Router,
    // BrowserRouter as Router,
    Route
  } from 'react-router-dom'

import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { connect, Provider } from 'react-redux';
import store from "./store"
import history from "./utils/history";
import './scss/style.scss';



export default class App extends Component {
  constructor(props){
    super(props);
    this.state = {
    }
  }

  render() {
    console.log("bonjour")
    return (
      <h1> Hello </h1>
    )
  }
}

const mapStateToProps = (state) => ({
  ...state
});
const mapDispatchToProps = (dispatch) => ({
});
const Main = connect(mapStateToProps, mapDispatchToProps)(App)
const AppContainer = ()=>{
	return (
	  <Provider store={store}>
        <Main />
	  </Provider>
	)
}

document.addEventListener('DOMContentLoaded', () => {
    const app = document.querySelector('#front_app')
  ReactDOM.render(<AppContainer name="React" />,app)
})
