// Giphys Search Presentation (Phase 2)

import React from 'react';

function GiphysIndexItem({ giphy }) {
    return (
        <li className="giphy-li">
            <img src={giphy.images.fixed_height.url} />
        </li>
    );
}

export default GiphysIndexItem;