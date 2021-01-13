// W8D3 HW: Intro to JS Homework


// Note: how to run this .js file: 
// - 1. cd to the folder that contains this file (ex. cd Desktop, if this file is on the Desktop)
// - 2. open Terminal + run: node w8d3_hw.js


// Phase I - JS Fundamentals


// 1.1. Mystery Scoping with var, let, const


// 1.
function mysteryScoping1() {
    var x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x); // sub-scope has access to variable "x", 
                        // -> can reassign a new value to "x"
    }
    console.log(x);
}

// mysteryScoping1(); // in block, in block


// 2.
function mysteryScoping2() {
    const x = 'out of block';
    if (true) {
        const x = 'in block'; // constants are blocked scoped, 
                              // -> so constant "x" inside the block =/= constant "x" outside
        console.log(x);
    }
    console.log(x);
}

// mysteryScoping2(); // in block, out of block


// 3. Commented Out b/c Syntax Error

// function mysteryScoping3() {
//     const x = 'out of block';
//     if (true) {
//         var x = 'in block'; // outside this bloc, constant "x" = already declared
//         console.log(x);     // -> constants CANNOT BE REDECLARED (even in sub-blocks, I guess)
//     }                       // Note: constant "x" = 1st declared in the outside block
//     console.log(x);         // -> which means it's accessible (and already declared) in the inside block, too
// }

// mysteryScoping3(); // Line 48 - SyntaxError: Identifier 'x' has already been declared


// 4.
function mysteryScoping4() {
    let x = 'out of block'; // let "x" -> "x" is block-scoped
    if (true) {
        let x = 'in block'; // "x" inside the block is a new "x", different from the ouside
        console.log(x);
    }
    console.log(x);
}

// mysteryScoping4(); // in block, out of block


// 5. Commented Out b/c Syntax Error

// function mysteryScoping5() {
//     let x = 'out of block';
//     if (true) {
//         let x = 'in block'; // Note: this is okay, b/c "x" inside is a different  + whole new variable
//         console.log(x);
//     }
//     let x = 'out of block again'; // can't redeclare the SAME let variable "x"
//     console.log(x);
// }

// mysteryScoping5(); // Line 78 - SyntaxError: Identifier 'x' has already been declared



// 1.2. madLib

function madLib(verb, adjective, noun) {
    return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}.`;
}

// Test
// console.log(madLib('make', 'best', 'guac')); // "We shall MAKE the BEST GUAC."



// 1.3. isSubstring

function isSubstring(searchString, subString) {
    return searchString.includes(subString);
}

// Tests
// console.log(isSubstring("time to program", "time")); // true
// console.log(isSubstring("Jump for joy", "joys")); // false



// Phase II - JS Looping Constructs


// 2.1. fizzBuzz

// Note: for "array.forEach(el => ..." - refer to the aAO reading below:
// https://open.appacademy.io/learn/swe-in-person/javascript/es6-arrow-functions


function fizzBuzz(array) {

    const fizzBuzzArr = [];

    array.forEach(function(ele) {
        if ((ele % 3 === 0) ^ (ele % 5 === 0)) {
            fizzBuzzArr.push(ele);
        }
    });

    return fizzBuzzArr;
}

// Test
// console.log(fizzBuzz([30, 3, 5, 7, 15]));



// 2.2. isPrime

function isPrime(n) {
    if (n < 2) { 
        return false; 
    }

    for (let i = 2; i < n; i++) {
        if (n % i === 0) {
            return false;
        }
    }

    return true;
}

// Tests
// console.log(isPrime(2)); // true
// console.log(isPrime(10)); // false
// console.log(isPrime(15485863)); // true
// console.log(isPrime(3548563)); // false


// 2.3. sumOfNPrimes

// Note: uses "isPrime" above as a helper method

function sumOfNPrimes(n) {
    let sum = 0;
    let countPrimes = 0;
    let i = 2;

    while (countPrimes < n) {
        if (isPrime(i)) {
            sum += i;
            countPrimes++;
        }
        i++;
    }

    return sum;
}

// Tests
// console.log(sumOfNPrimes(0)); // 0
// console.log(sumOfNPrimes(1)); // 2
// console.log(sumOfNPrimes(4)); // 17
