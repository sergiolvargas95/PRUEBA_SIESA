const container = document.getElementById('container');
const fragment = document.createDocumentFragment();


for(let i = 1; i <= 100; i++) {
    if((i % 3 == 0) && (i % 5 != 0)) {
        const p = document.createElement('p');
        p.textContent = 'Fizz';
        fragment.appendChild(p);
    } else if((i % 5 == 0)  && (i % 3 != 0)) {
        const p = document.createElement('p');
        p.textContent = 'Buzz';
        fragment.appendChild(p);
    }else if(( i % 3 == 0) && ( i % 5 == 0)) {
        const p = document.createElement('p');
        p.textContent = 'FizzBuzz';
        fragment.appendChild(p);
    }else {
        const p = document.createElement('p');
        p.textContent = i;
        fragment.appendChild(p);
    }
}

container.appendChild(fragment)