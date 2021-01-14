// W8D4 HW: Intro JavaScript Problems (Part 2)


// Note: how to run this .js file: 
// - 1. cd to the folder that contains this file (ex. cd Desktop, if this file is on the Desktop)
// - 2. open Terminal + run: node w8d3_hw.js


// Phase I: Callbacks

// 1.1. titleize

let titleize = function(arr, callback) {

    let titleizedNamesArr = [];

    arr.map(function(ele) {
        titleizedNamesArr.push(`Mx. ${ele} Jingleheimer Schmidt`)
    });

    callback(titleizedNamesArr);
}

let callback1 = function(arr) {

    arr.forEach(function(ele) {
        console.log(ele);
    })
}

// Tests

// titleize(["King", "Queen", "Jack"], callback1);


// same as the above

// titleize(["Ace", "Deuces", "Hearts"], function(arr) {
//     arr.forEach(function (ele) {
//         console.log(ele);
//     })
// });




// Phase II: Constructors, Prototypes, and this

// Constructor Method

function Elephant(name, height, tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
}


// Prototype Functions

Elephant.prototype.trumpet = function() {
    console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
}

Elephant.prototype.grow = function() {
    this.height += 12;  
}

Elephant.prototype.addTrick = function(trick) {
    this.tricks.push(trick);
}

Elephant.prototype.play = function() {
    // gives back a random index in the "tricks" array
    trickIndex = Math.floor(Math.random() * this.tricks.length);

    console.log(`${this.name} is ${this.tricks[trickIndex]}!`);
}


// Tests

dumbo = new Elephant("Dumbo", 10, ["flying away", "eating all the peanuts"])

// dumbo.trumpet();

// dumbo.grow();
// console.log(dumbo.height);

// dumbo.addTrick("singing in the rain")
// console.log(dumbo.tricks);

// dumbo.play();



// Phase III: Function Invocation

Elephant.paradeHelper = function(elephant) {
    console.log(`${elephant.name} is trotting by!`);
}

// Test 1

// Elephant.paradeHelper(dumbo);


// Test 2

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

// herd.forEach(function(elephant) {
//     Elephant.paradeHelper(elephant);
// });


// Phase IV: Closures

// Note: super tricky - referenced Solution
// Note: ${order.slice(0, order.length - 8)} refers to:
// "I'd like cheesy scrambled eggs"
// - the "order.length - 8" gets rid of " please." -> can return just the above ^

function dinerBreakfast() {
    let order = "I'd like cheesy scrambled eggs please.";
    console.log(order);

    return function (food) {
        order = `${order.slice(0, order.length - 8)} and ${food} please.`;
        console.log(order);
    };
};

// Tests

// let bfastOrder = dinerBreakfast(); // "I'd like cheesy scrambled eggs please"
// bfastOrder("chocolate chip pancakes"); // "I'd like cheesy scrambled eggs and chocolate chip pancakes please."
// bfastOrder("grits"); // "I'd like cheesy scrambled eggs and chocolate chip pancakes and grits please."



