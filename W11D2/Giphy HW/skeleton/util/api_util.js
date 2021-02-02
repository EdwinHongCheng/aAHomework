// API Util

export const fetchSearchGiphys = searchTerm => (
    $.ajax({
        method: 'GET',
        url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=Y6fVW5RL3YMLSuaECtjqRGYFYGsRWr6m&limit=2`
    })
);