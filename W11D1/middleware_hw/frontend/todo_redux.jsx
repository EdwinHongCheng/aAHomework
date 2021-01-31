import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  
  // Note: changed "const store..." to "let store..."
  let store = configureStore(preloadedState);


  // Phase 1: Logging - Part 2
  // store.dispatch = addLoggingToDispatch(store);


  // Phase 2: Refactoring (without using Redux applyMiddleware) 
  // - Step 3
  // store = applyMiddlewares(store, addLoggingToDispatch);


  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});


// Phase 1: Logging - Part 1
// const addLoggingToDispatch = (store) => {

//   const OGDispatch = store.dispatch;

//   return (action) => {
//     // logging old state
//     console.log(store.getState());
//     console.log(action);

//     OGDispatch(action);

//     // logging new state
//     console.log(store.getState());
//   }
// }


// Phase 2: Refactoring (without Using Redux applyMiddleware)

// - Steps 1 + 2
// const addLoggingToDispatch = store => next => action => {
//   console.log(store.getState());
//   console.log(action);
//   next(action);
//   console.log(store.getState());
// };


// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach((middleware) => {
//     dispatch = middleware(store)(dispatch);
//   });
//   return Object.assign({}, store, { dispatch });
// };
