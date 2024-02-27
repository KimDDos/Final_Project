// script.js
document.getElementById('reservationForm').addEventListener('submit', function(event) {
  event.preventDefault(); // 폼 기본 제출 동작 방지

  // 입력 값 검증 로직
  var item = document.getElementById('item').value;
  var date = document.getElementById('date').value;
  var time = document.getElementById('time').value;
  var name = document.getElementById('name').value;
  var contact = document.getElementById('contact').value;
  var email = document.getElementById('email').value;

  if (!item || !date || !time || !name || !contact || !email) {
    alert('모든 필드를 채워주세요.');
    return;
  }

  // 여기서 AJAX 요청을 사용하여 서버에 예약 데이터를 전송할 수 있습니다.
  // 예시: axios.post('/api/reservation', { item, date, time, name, contact, email })
  // .then(response => console.log(response))
  // .catch(error => console.error(error));

  alert('예약이 완료되었습니다.');
});

//캘린더부분
$(document).ready(function() {
  $('#date').datepicker({
    dateFormat: 'yy-mm-dd', // 날짜 형식 설정
    minDate: 0, // 오늘 날짜부터 선택 가능하도록 설정
    maxDate: '+1Y', // 오늘로부터 1년까지만 선택 가능하도록 설정
    showButtonPanel: true, // 오늘 날짜로 이동할 수 있는 버튼 패널 표시
    closeText: '닫기', // 닫기 버튼 텍스트
    currentText: '오늘', // 오늘 날짜로 이동 버튼 텍스트
    monthNames: ['1월','2월','3월','4월','5월','6월',
    '7월','8월','9월','10월','11월','12월'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    firstDay: 0, // 주의 시작 요일 설정 (0: 일요일)
  });
});