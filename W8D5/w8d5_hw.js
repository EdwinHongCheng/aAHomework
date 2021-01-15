// W8D5: Callbacks and Function Calls

// NOTE: open Google Console in Chrome: command + option + i


// 1. Simple Timeout

// Asynchronous Code
// - can do other things while this is still running)

// NOTE: the code works in Google Console (command + option + i)
// - BUT, it doesn't work in my Terminal (if I run: node w8d5_hw.js)

// window.setTimeout(function () {
//     alert('HAMMER TIME!');
// }, 5000);



// 2. Timeout Plus Closure

// Note: again, doesn't work in Node, but works in Google Console

// function hammerTime(time) { 
//     window.setTimeout(function () 
//     { alert(`${time} is HAMMER TIME!`); }, time); 
// }

// hammerTime(5000);




// 3. Some tea? Some biscuits?


// 3.1. Tea

// const readline = require('readline');

// const reader = readline.createInterface({
//     input: process.stdin,
//     output: process.stdout
// });

// function teaAndBiscuits() {
//     reader.question(
//         // 1st argument - a string
//         'Would you like some tea?', 

//         // 2nd argument - a callback function
//         function (res) { 
//             console.log(`You replied ${res}.`);

//             reader.close(); // adding this line, or else it'll keep running
//         }
//     );    
// }

// teaAndBiscuits();




// 3.2. Tea and Biscuits v2

// function teaAndBiscuits2() { 
//     reader.question(
//         'Would you like some tea?', 
//         function (res) { console.log(`You replied ${res}.`); 
        
//         reader.question(
//             'Would you like some biscuits?', 
//             function (res2) { console.log(`You replied ${res2}.`); 
            
//             const first = (res === 'yes') ? 'do' : 'don\'t'; 
//             const second = (res2 === 'yes') ? 'do' : 'don\'t'; 
            
//             console.log(`So you ${first} want tea and you ${second} want biscuits.`); 

//             reader.close(); 
//         }); 
//     }); 
// }
        
// teaAndBiscuits2();




// 4. Ways to Call a Function

function Cat() {
    this.name = 'Markov';
    this.age = 3;
}

function Dog() {
    this.name = 'Noodles';
    this.age = 4;
}

Dog.prototype.chase = function (cat) {
    console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat();
const Noodles = new Dog();


// Tests

Noodles.chase(Markov); 
Noodles.chase.call(Markov, Noodles); 
Noodles.chase.apply(Markov, [Noodles]);
