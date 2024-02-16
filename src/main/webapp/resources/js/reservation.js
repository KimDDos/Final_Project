const checkBoxes = document.querySelectorAll('#checkBox');
checkBoxes.forEach((checkBox, index) => {
    let isChecked = false;
    checkBox.addEventListener('click', () => {
        isChecked = !isChecked;
        checkBox.previousElementSibling.src = isChecked ? "/resources/img/circle-fill.svg" : "/resources/img/circle.svg";
    });
});