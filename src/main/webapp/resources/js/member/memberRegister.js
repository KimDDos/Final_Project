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



// [start] Check box 하나만 설정되게
function checkOnlyOne(){

    
}


// [END] Check box 하나만 설정되게