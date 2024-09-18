const display = document.getElementById('display');
let expression = '';

document.querySelectorAll('button').forEach(button => {
  button.addEventListener('click', () => {
    const value = button.value;

    if (value === '=') {
      try {
        display.value = eval(expression);
        expression = display.value;
      } catch (error) {
        display.value = 'Error';
        expression = '';
      }
    } else if (value === 'C') {
      display.value = '';
      expression = '';
    } else {
      expression += value;
      display.value = expression;
    }
  });
});