document.getElementById('memberRegisterBtn').addEventListener('click', () => {
    if(MemberRegisterValidate()){
        document.getElementById('regBtn').click();
    } 
})

let isDupleEmailResultSave = 0;
let isUserPwdCheckResult = 0;
// [START] User 회원가입 Validation Start
function MemberRegisterValidate(){
    // 리턴값 false가 비정상적일때
    // 리턴값 true가 정상적일때
    const userEmail = document.getElementById('userEmail').value;
    let userEmailPrev = document.getElementById("userEmailPrev");
    let userEmailNext = document.getElementById('emailSelect').value;
    let isDupleEmailResult = document.getElementById('isDupleEmailResult');
    let userPwdCheck = document.getElementById('userPwdCheck');
    let userPwd = document.getElementById('userPwd');
    let checkResult = document.getElementById('userPwdCheckeResultPrint');
    let userName = document.getElementById('userName');
    let userNickName = document.getElementById('userNickName');
    let userBirthDate = document.getElementById('datepicker');
    let userPhoneNum = document.getElementById('userPhoneNum');

    if(!isEmailLength(userEmail)){
        // 이메일 전체 길이 10 이상, 50이하 
        userEmailPrev.focus();
        memberRegSwalAlret("이메일을 10~50자 사이로만 작성해주세요.");
        return false;
    } else if(!isEmailOnlyNumAndEng(userEmail)){
        // 이메일 앞단 영어와 숫자만 넣었는지 확인
        userEmailPrev.focus();
        memberRegSwalAlret("이메일은 영어와 숫자로만 구성해주세요.");
        return false;
    } else if(userEmailNext == "이메일을 선택해주세요."){
        memberRegSwalAlret("이메일을 선택 해주세요.");
        return false;
    } else if(isDupleEmailResultSave == 0){
        // 중복체크 여부 확인
        userEmailPrev.focus();
        memberRegSwalAlret("이메일 중복체크를 해주세요.");
        return false;
    } else if(userPwdCheck.value == "" || userPwdCheck.value == null){
        userPwdCheck.focus();
        memberRegSwalAlret("비밀번호를 입력해주세요.");
        return false;
    } else if(userPwd.value == "" || userPwd.value == null){
        userPwd.focus();
        memberRegSwalAlret("비밀번호를 입력해주세요.");
        return false;
    } else if(isUserPwdCheckResult == 0){
        userPwd.focus();
        memberRegSwalAlret("비밀번호를 다시 확인해주세요.");
        return false;
    } else if(userPwdCheck.value != userPwd.value){
        userPwd.focus();
        memberRegSwalAlret("비밀번호를 일치하지 않습니다.");
        return false;
    } else if(userName.value === "" || userName.value === null){
        userName.focus();
        memberRegSwalAlret("이름을 입력해주세요.");
        return false;
    } else if(userNickName.value === "" || userNickName.value === null){
        userNickName.focus();
        memberRegSwalAlret("닉네임을 입력해주세요.");
        return false;
    } else if(userBirthDate.value === "" || userBirthDate.value === null){
        userBirthDate.focus();
        memberRegSwalAlret("생년월일을 입력해주세요.");
        return false;
        // 원래는 나이 체크도 해야되지만; 패스
    } else if(!isGenderChecked()){
        memberRegSwalAlret("성별을 꼭 체크해주세요.");
        return false;
    } else if(userPhoneNum.value === "" || userPhoneNum.value === null){
        userPhoneNum.focus();
        memberRegSwalAlret("전화번호를 입력해주세요.");
        return false;
    } else if(isDupleEmailResultSave == 1 || isUserPwdCheckResult == 1) {
        memberRegSwalAlret("이메일 또는 비밀번호 일치여부를 확인해주세요.");
        return false;
    }
    return true;  
}

function memberRegSwalAlret(text){
    Swal.fire({
        icon: 'error',
        title: '회원가입 실패',
        text: text
    });
}

function isEmailLength(value){
    return value.length >= 10 && value.length <= 50;
}
// 로그인시 활용하는 Login 정보 확인

function isEmailOnlyNumAndEng(userEmail){
    return /^[A-Za-z0-9][A-Za-z0-9]/.test(userEmail);
}

function strongPasswordExp(userPwd){
    return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(userPwd);
}
// strongPasswordExp(userPwd) : 8 글자 이상, 특수문자 '@$!%*#?&' 포함
// userPwd : user가 입력하는 Password

function isGenderChecked(){
    let userGender = document.getElementsByName('userGender');
    for(var radio of userGender){
        if(radio.checked){ return true; } 
    }
    return false;
}

// [END] User 회원가입 Validation

// 입력내용 체크후 실패시 Input 박스가 빨간색으로 변경되게 하는 부트스트랩 샘플
// class에 is-invalid 만 추가
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
    isUserPwdCheckResult = 1;
    if(strongPasswordExp(userPwd.value)){
        if(userPwd.value === userPwdCheck.value) {
           checkResult.innerText = "Password가 일치합니다.";
           checkResult.className = "badge text-bg-success";
           if(userPwd.classList.contains("is-invalid")){
               userPwd.classList.remove('is-invalid');
           }
           isUserPwdCheckResult = 2;
       } else {
           checkResult.innerText = "Password가 일치하지 않습니다.";
           checkResult.className = "badge text-bg-danger";
           userPwd.classList.add("is-invalid");
       }
    } else {
        console.log(strongPasswordExp(userPwd.value));
        checkResult.innerText = "10자 이상의 문자, 숫자, 특수문자로 조합해주세요.";
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
document.getElementById('isEmailDuplicateBtn').addEventListener('click', () => {
    const userEmail = document.getElementById('userEmail').value;
    let isDupleEmailResult = document.getElementById('isDupleEmailResult');
    let emailSelect = document.getElementById('emailSelect');
    isDupleEmailResultSave = 1;
    isDupleEmailFromServer(userEmail).then(result => {
        const userEmailNext = document.getElementById('emailSelect').value;
        if(userEmailNext === '이메일을 선택해주세요.'){
            const text = "이메일을 선택해주세요!"
            isDupleEmailResult.innerText = text;
            isDupleEmailResult.className = "badge text-bg-danger";
        }else if(result === '1'){
            const text = "중복된 이메일입니다. 다른 이메일을 입력해주세요."
            isDupleEmailResult.innerText = text;
            isDupleEmailResult.className = "badge text-bg-danger";
            userEmailPrev.classList.add("is-invalid");
        } else {
            const text = "회원가입이 가능한 이메일입니다."
            isDupleEmailResult.innerText = text;
            isDupleEmailResult.className = "badge text-bg-success";
            if(userEmailPrev.classList.contains("is-invalid")){
                userEmailPrev.classList.remove('is-invalid');
            }
            isDupleEmailResultSave = 2;
        }
    })
})

async function isDupleEmailFromServer(userEmail){
    try {
        const url = "/member/isEmail/"+userEmail;
        const resp = await fetch(url);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

// [END] Email 중복체크 비동기

// [START] 이메일 직접입력
function emailDirectInputActive() {
    let selectbox = document.getElementById('emailSelect');
    let inputField = document.getElementById('userEmailNext');

    // select 요소의 값을 확인하여 input 요소의 가시성을 조절
    if (selectbox.value === "input") {
        inputField.style.visibility = 'visible';
    } else {
        inputField.style.visibility = 'hidden';
    }
}
document.getElementById('emailSelect').addEventListener('change', emailDirectInputActive);
// [END] 이메일 직접입력

document.getElementById('emailSelect').addEventListener('change', emailPrevAndNextBind);
document.getElementById('userEmailPrev').addEventListener('keyup', emailPrevAndNextBind);
document.getElementById('userEmailNext').addEventListener('keyup', emailPrevAndNextBind);

function emailPrevAndNextBind(){
    let userEmailPrev = document.getElementById("userEmailPrev").value;
    let selectbox = document.getElementById('emailSelect');
    let userEmailNext;
    let userEmail = document.getElementById('userEmail');

     // selectbox에서 'input' 값을 가진 옵션 요소가 선택되었는지 확인
     let inputOption = selectbox.querySelector('option[value="input"]');

    if (inputOption && inputOption.selected) {
        // 'input' 값을 가진 옵션이 선택되었을 때
        userEmailNext = document.getElementById("userEmailNext").value;
    } else {
        // 'input' 값을 가진 옵션이 선택되지 않았을 때
        if(selectbox.value != "이메일을 선택해주세요."){
            userEmailNext = selectbox.value;
        } else {
            userEmailNext = "";
        }
    }
    userEmail.value = userEmailPrev + "@" +userEmailNext;
}