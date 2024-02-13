const checkmonth = function () {
    let dest = document.getElementsByClassName('calendar');

    let year = parseInt(document.frm.year.value);
    let month = parseInt(document.frm.month.value);


    let startDay = new Date(year, month - 1, 1);
    let endDay = new Date(year, month, 1 - 1);

    let weekstart = 0;
    let weekend = 0;

    let weekendDay = 0;

    weekstart = startDay.getDay();
    weekend = endDay.getDay();
    weekendDay = endDay.getDate();

    let str = "";

    str += "<table width='800' border='1'>";

    str += "<tr>";

    str += "<td colspan='7'>" + year + "년 " + month + "월</td>";

    str += "</tr>";

    for (let i = 0; i < weekstart; i++) {
        str += "<td></td>";
    }

    for (let i = 1, n = weekstart; i < weekendDay; i++) {
        if (n % 7 == 1) str += "<tr>";
        str += "<td>" + i + "</td>";
        if (n % 7 == 0) str += "</tr>";
    }

    for (let i = weekend; i <= 6; i++) {
        str += "<td></td>";
    }

    str+="</tr>";

    str +="</table>";

    dest[0].innerHTML = str;

}