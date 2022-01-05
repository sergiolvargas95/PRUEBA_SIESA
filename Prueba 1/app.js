const container = document.getElementById('container');

function metodoQueHaceAlgo(valor) {
    if(valor < 3) {
        return valor;
    }
    return metodoQueHaceAlgo(valor - 1)*metodoQueHaceAlgo(valor-2)
}

let result = metodoQueHaceAlgo(5);
const H2 = document.createElement('h2');
H2.textContent = `El resultado es ${result}`;
container.appendChild(H2);
