import { combineReducers } from 'redux';
import _ from "lodash";
const getSuccess = (state, payload) =>{
    let selected = payload.data[0].id
    return {...state,  products: payload.data, data_loaded: true, selected_category: selected, loader: false}
}

const getRejected = (state, payload) =>{
  let response = payload;
  return {...state, error: payload, data_loaded: false, selected_category: null, loader: false}
}
const getPending = (state, payload) =>{
  return {...state, loader: true}
}

const initialState = {
  products:[],
  loader: false,
}

const getProducts = (state = initialState, { type, payload }) => {
    let actions = {
        "GET_PRODUCTS_FULFILLED": getSuccess,
        "GET_PRODUCTS_REJECTED": getRejected,
        "GET_PRODUCTS_PENDING": getPending,
    }
    let _state = type in actions ? actions[type](state, payload) : state
    return _state;
}

export default combineReducers({
    productsReducer: getProducts
});
