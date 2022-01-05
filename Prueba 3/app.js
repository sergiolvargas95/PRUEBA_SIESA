let numb = Number(prompt("Ingresar un numero"));
const container = document.getElementById('container');

const perfectNumber = numb => {
    if(typeof numb !== 'number') {
        throw TypeError('Por favor ingresa un número');
    }

    if(!Number.isInteger(numb)) {
        throw TypeError('Por favor ingresa un número Entero');
    }

    if(numb <= 0) {
        throw Error('Por favor ingresa un número positivo');
    }

    let counter = 0;
    for(let i = 1; i <= numb/2; i++ ) {
        if(numb%1 == 0) {
            counter += i;
        }
    }
    return counter != 0 && counter == numb;
}

let result = perfectNumber(numb);
if(result) {
    const H2 = document.createElement('h2');
    H2.textContent = 'Tu número es perfecto 😄👍';
    container.appendChild(H2);
} else {
    const H2 = document.createElement('h2');
    H2.textContent = 'Tu número no es perfecto ☹';
    container.appendChild(H2);
}