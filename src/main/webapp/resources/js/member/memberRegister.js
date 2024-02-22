document.getElementById('isEmailDuplicateBtn').addEventListener('click', () => {
    console.log("isEmailDuplicateBtn 버튼 클릭함");
    const userEmail = document.getElementById('userEmail').value;
    console.log(userEmail);
})

document.getElementById('memberRegisterBtn').addEventListener('click', () => {

})


// [START] User 회원가입 Validation Start
function MemberRegisterValidate(){

}

function isEmailLength(value){
    return value.length >= 10 && value.length <= 20;
}
// 로그인시 활용하는 Login 정보 확인

function isEmailOnlyNumAndEng(userEmail){
    return /^[A-Za-z0-9][A-Za-z0-9]/.test(userEmail);
}

function strongPasswordExp(userPwd){
    return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{10,}$/.test(userPwd);
}
// strongPasswordExp(userPwd) : 10 글자 이상, 특수문자 '@$!%*#?&' 포함
// userPwd : user가 입력하는 Password

// [END] User 회원가입 Validation

// 입력내용 체크후 실패시 Input 박스가 빨간색으로 변경되게 하는 부트스트랩 샘플
// class에 is-invalid 만 추가하면 됨 ㅋ
// <form class="form-floating">
//  <input type="email" class="form-control is-invalid" id="floatingInputInvalid" placeholder="name@example.com" value="test@example.com">
//  <label for="floatingInputInvalid">Invalid input</label>
// </form>
//

// [START] password 중복 확인 
document.getElementById('userPwd').addEventListener('keyup', ()=>{
    let userPwdCheck = document.getElementById('userPwdCheck');
    let userPwd = document.getElementById('userPwd');
    let checkResult = document.getElementById('userPwdCheckeResultPrint');

    if(userPwd.value === userPwdCheck.value) {
        checkResult.innerText = "Password가 일치합니다.";
        checkResult.className = "badge text-bg-success";
        if(userPwd.classList.contains("is-invalid")){
            userPwd.classList.remove('is-invalid');
        }
    } else if(false){
        // 정규식 적용
    } else {
        checkResult.innerText = "Password가 일치하지 않습니다.";
        checkResult.className = "badge text-bg-danger";
        userPwd.classList.add("is-invalid");
    }
})
// [END] password 중복 확인 


// [start] Check box 하나만 설정되게
// element 는 this, 자기 자신을 뜻하는 요소임
function checkOnlyOne(element){
    const checkboxes = document.getElementsByName('isTrainer');

    checkboxes.forEach((cb) => {
        cb.checked = false;
    })
    element.checked = true;
}
// [END] Check box 하나만 설정되게

// [START] Email 중복체크 비동기



// [END] Email 중복체크 비동기