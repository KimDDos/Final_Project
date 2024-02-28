window.onload=function(){
  checkmonth();
}

function checkmonth() {
    const dest = document.querySelector('.calendar');
    const year = parseInt(document.frm.year.value);
    const month = parseInt(document.frm.month.value);
    const startDay = new Date(year, month - 1, 1);
    const endDay = new Date(year, month, 0);
    const daysInMonth = endDay.getDate();
    const weekStart = startDay.getDay();

    let str = `
        <table class='table'>
            <tr>
                <th colspan='7'>${year}년 ${month}월</th>
            </tr>
            <tr>
                <th class='red'>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th class='blue'>토</th>
            </tr>
            <tr>`;

    for (let i = 0; i < weekStart; i++) {
        str += "<td></td>";
    }

    for (let i = 1; i <= daysInMonth; i++) {
        const currentDay = new Date(year, month - 1, i);
        const dayOfWeek = currentDay.getDay();
        let fontColor = "";
        if (dayOfWeek === 0) { // Sunday
            fontColor = "red";
        } else if (dayOfWeek === 6) { // Saturday
            fontColor = "blue";
        }

        if ((i + weekStart - 1) % 7 === 0) {
            str += "</tr><tr>";
        }
        str += `<td>
        <a href='/member/calendarRegister?date=${year}-${month < 10 ? '0' : ''}${month}-${i < 10 ? '0' : ''}${i}'>
        <button class='calendar_btn' style="color: ${fontColor}">${i}</button>
        </a>
        </td>`;
    }

    str += "</tr></table>";

    dest.innerHTML = str;
};
