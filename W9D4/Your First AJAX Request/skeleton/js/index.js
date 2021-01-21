console.log("Hello from the JavaScript console!");

// Your AJAX request here

$.ajax({
    type: 'GET',
    url: 'http://api.openweathermap.org/data/2.5/weather' +
        '?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b',
    success(data) {
        console.log("We have your weather!")
        console.log(data);
    },
    error() {
        console.error("An error occurred.");
    },
});


// Add another console log here, outside your AJAX request

console.log("The AJAX has been dispatched. Mission complete.")


// Answers to Questions on aAO:

// 1. When does the request get sent?
// Answer: lines 6-8 (I think)

// 2. When does the response come back?
// Answer: after line 21

// 3. What's the current weather in New York?
// Answer: Clear, as of 1/20/21 at 9:47 PM EST.

// 4. Did the page refresh?
// Answer: No

// 5. How could we use different HTTP methods in our request?
// Answer: Not sure.
