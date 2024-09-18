function fibonacci(n){
    if(n<=1){
        return n;
    } else{
        return fibonacci(n-1) + fibonacci(n-2);
    }
}

function GenerateSeries() {
    const series = parseInt(document.getElementById("series").value);
    const numbers = [];

    for (let i=0; i < series; i++){
        numbers.push(fibonacci(i))
    }
    document.getElementById("result").textContent = numbers.join(", ");
}