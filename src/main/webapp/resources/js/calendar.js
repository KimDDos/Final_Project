const checkmonth = function () {
    let dest = document.getElementsByClassName('calendar');

    let year = parseInt(document.frm.year.value); // 페이지에서 선택한 년도
    let month = parseInt(document.frm.month.value); // 페이지에서 선택한 달

    let startDay; // 달력 시작일자의 정보, 형식 : Sat Jan 01 2022 00:00:00 GMT+0900 (한국 표준시).
    let endDay; // 달력 마지막일자의 정보, 형식 동일 


    //시작일자 지정,페이지에서 선택한 년도,일자 기준 1일로 설정.ex) 2024년, 2월 선택시 (2023 02 01).
    startDay = new Date(year, month - 1, 1);
    //마지막일자 지정,페이지에서 선택한 년도,일자 기준 마지막일로 설정.ex) 2024년, 2월 선택시 (2023 02 29).
    //마지막 일자를 구할때 1-1을 하는데 왜 이것이 작동하는지는 모르겠음..
    endDay = new Date(year, month, 1 - 1);

    //각각 달력의 시작 위치,끝 위치, 달의 마지막 일자를 포함.
    let weekstart = 0;
    let weekend = 0;
    let weekendDay = 0;

    weekstart = startDay.getDay();
    weekend = endDay.getDay();
    weekendDay = endDay.getDate();

    //테이블 생성 구문
    let str = "";

    str += "<table class='table' width='800' border='1'>";
    str += "<tr>";
    str += "<td colspan='7'>" + year + "년 " + month + "월</td>";
    str += "</tr>";

    str += "<tr>";
    //빈공간 몇칸인지 저장할 변수.
    let adjust = 0;

    //달력의 빈 공간을 생성.(선택한 월에 해당하는 일자가 아닌 칸을 비워두기 위한 구문.)
    for (let i = 1; i < weekstart; i++, adjust++) {
        console.log("WEEK ADJUST");
        str += "<td><button class='calendar_btn_hidden'></button></td>";
    }

    //1주~6주까지 달력을 출력. 시작지점은 빈 공간 다음칸, 반복 횟수는 42-빈공간 갯수.
    if (startDay.getDay() != 0) {
        for (let i = adjust, n = weekstart, idx = 1; i < 42 - adjust; i++, n++) {
            if (n % 7 == 1) str += "<tr>";
            console.log(i + " " + weekendDay + " " + startDay.getDay());
            if (i <= weekendDay + adjust && i >= startDay.getDay()) {
                str += `<td border='1' style='text-align: center'><a href='/member/calendarRegister?date=${year}-${month < 10 ? '0' : ''}${month}-${idx < 10 ? '0' : ''}${idx}'><button class='calendar_btn'>` + idx + "</button></a></td>";
                idx++;
            }
            else str += "<td border='1' width='100px' height='100px' style='text-align: center'><button class='calendar_btn_hidden'></button></td>";
            if (n % 7 == 0) {
                str += "</tr>";
            }
        }
    }
    else if (startDay.getDay() == 0) {
        weekendDay -= 1;
        for (let i = adjust, n = weekstart, idx = 1; i < 42 - adjust; i++, n++) {
            console.log(idx);
            if (i >= 7) {
                if (n % 7 == 0) str += "<tr>";
            }
            else {
                if (i == 0) str += "<tr>";
            }
            console.log(i + " " + weekendDay + " " + startDay.getDay());
            if (i <= weekendDay + adjust && i >= startDay.getDay()) {
                str += `<td border='1' style='text-align: center'><a href='/member/calendarRegister?date=${year}-${month < 10 ? '0' : ''}${month}-${idx < 10 ? '0' : ''}${idx}'><button class='calendar_btn'>` + idx + "</button></a></td>";
                idx++;
            }
            else str += "<td border='1' width='100px' height='100px' style='text-align: center'><button class='calendar_btn_hidden'></button></td>";
            if (i > 7) {
                if ((n + 1) % 7 == 0) {
                    str += "</tr>"
                    console.log("개행");
                }
            }
            else {
                if (i == 6) {
                    console.log("개행");
                    str += "</tr>";
                }
            }
        }
    }

    str += "</tr>";

    str += "</table>";

    dest[0].innerHTML = str;

}
