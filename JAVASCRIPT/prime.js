function primeFactors(n) {
    let factors = [];
    let divisor = 2;

    while (n >= 2) {
        if (n % divisor === 0) {
            factors.push(divisor);
            n = n / divisor;
        } else {
            divisor++;
        }
    }

    return factors;
}

let n = 100;  // Example number, you can change this to any natural number
let factorsArray = primeFactors(n);

// Create an array with specific positions for prime factors
let positionsArray = new Array(n).fill(null);  // Array filled with 'null' values

for (let i = 0; i < factorsArray.length; i++) {
    positionsArray[i] = factorsArray[i];  // You can modify the position logic here if needed
}

console.log("Prime factors:", factorsArray);
console.log("Array with prime factors at specific positions:", positionsArray);