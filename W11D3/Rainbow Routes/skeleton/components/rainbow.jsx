// HW - Phases 1 - 3
// Note: Phase 2 Links replaced by Phase 3 NavLinks
// - Result: the current link = bolded (using NavLinks)

import React from 'react';
import {
  Route,
  Link,
  NavLink
} from 'react-router-dom';

import Red from './red';
import Green from './green';
import Blue from './blue';
import Violet from './violet';

class Rainbow extends React.Component {
  render() {
    return (
      <div>


        {/* Phase 1 */}
        <div id="rainbow">

          <Route path="/red" component={Red} />
          <Route path="/green" component={Green} />
          <Route path="/blue" component={Blue} />
          <Route path="/violet" component={Violet} />
        </div>


        {/* Phase 2 */}
        <h1>Rainbow Router!</h1>

        {/* <Link to='/red' >Red</Link>
        <Link to='/green' >Green</Link>
        <Link to='/blue' >Blue</Link>
        <Link to='/violet' >Violet</Link> */}


        {/* Phase 3 */}

        <NavLink to='/red' >Red</NavLink>
        <NavLink to='/green' >Green</NavLink>
        <NavLink to='/blue' >Blue</NavLink>
        <NavLink to='/violet' >Violet</NavLink>

      </div>
    );
  }
};

export default Rainbow;
