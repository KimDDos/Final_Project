let checkBoxes = document.querySelectorAll('#checkBox');
let checklist = [];
for (let i =0; i<checkBoxes.length;i++)
{
    checklist[i] = 0;
    console.log(checklist);
}
checkBoxes.forEach((element,index)=> {
    element.addEventListener('click',(e)=>{
        console.log('click' + ' ' + index);
        if (checklist[index] == 0) 
        {
            checklist[index] = 1;
            e.target.previousElementSibling.src = "/resources/img/circle-fill.svg";
        }
        else if (checklist[index] == 1) 
        {
            checklist[index] = 0;
            e.target.previousElementSibling.src = "/resources/img/circle.svg";
        }
    })
});