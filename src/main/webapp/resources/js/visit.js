// 함수: 쿠키 가져오기
function getCookie(name) {
    var cookieArr = document.cookie.split("; ");
    for (var i = 0; i < cookieArr.length; i++) {
        var cookiePair = cookieArr[i].split("=");
        if (name === cookiePair[0]) {
            return decodeURIComponent(cookiePair[1]);
        }
    }
    return null;
}

// 함수: 방문자 수 증가
function incrementVisitCounter() {
    var visits = getCookie("visits");
    if (visits) {
        visits = parseInt(visits) + 1;
    } else {
        visits = 1;
    }
    document.cookie = "visits=" + visits + ";expires=Fri, 31 Dec 9999 23:59:59 GMT";
    document.getElementById("visitCount").textContent = "방문자 수: " + visits;
}

// 문서 로드 시 방문자 수 표시
window.onload = function() {
    incrementVisitCounter();
};
