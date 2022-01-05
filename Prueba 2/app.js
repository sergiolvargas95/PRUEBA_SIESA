
const dividirValores = (value1, value2) => {
    let result = value1 / value2;
    return result;
}

const verifyNumbers = () => {
    let value1 = document.getElementById('value1').value;
    let value2 = document.getElementById('value2').value;
    if((value1 % 1 == 0) && (value2 % 1 == 0)) {
        let number = dividirValores(value1, value2);
        const H2 = document.createElement('h2');
        H2.textContent = number;
        result.appendChild(H2);
    } else {
        alert('Debes ingresar números enteros');
    }
}