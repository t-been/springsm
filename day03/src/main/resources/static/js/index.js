let js4 = {
    data:null,
    init:function(){
        $('#btn_get').click(()=>{
            this.getdata();
        });
    },
    getdata:function(){
        let datas = [
            {'id':'id01','name':'james1','age':10},
            {'id':'id02','name':'james2','age':20},
            {'id':'id03','name':'james3','age':30},
            {'id':'id04','name':'james4','age':40},
            {'id':'id05','name':'james5','age':50}
        ];
        this.display(datas);
    },
    display:function(datas){
        let result = '';
        $(datas).each(function(index, data){
            result += '<tr>';
            result += '<td>'+ data.id +'</td>';
            result += '<td>'+ data.name +'</td>';
            result += '<td>'+ data.age +'</td>';
            result += '</tr>';
        });
        $('#cdata > tbody').html(result);
    }
};

let js5 = {
    init:function(){
        $('#login_form > button').click(()=>{
            this.check();
        });
    },
    check:function(){
        let id = $('#id').val();
        let pwd = $('#pwd').val();
        if(id == '' || id == null){
            alert('Id is Mandatory');
            $('#id').focus();
            return;
        }
        if(pwd == '' || pwd == null){
            alert('Pwd is Mandatory');
            $('#pwd').focus();
            return;
        }
        this.send();
    },
    send:function(){
        // method, action
        $('#login_form').attr('method','post');

        $('#login_form').attr('action','/loginimpl');
        $('#login_form').submit();
    }
};

let js6 = {
    init: function() {
        $('#signup_form > button').click(() => {
            this.check();
        });
    },
    check: function() {
        let id = $('#id').val();
        let pwd = $('#pwd').val();
        let confirmPwd = $('#confirmPwd').val();
        let name = $('#name').val();
        let email = $('#email').val();

        // 이메일 정규표현식 (email 형식 확인)
        let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

        // ID 필수 체크
        if (id == '' || id == null) {
            alert('ID를 입력하세요.');
            $('#id').focus();
            return;
        }
        let idPattern = /^[a-zA-Z]+$/;
        if (!idPattern.test(id)) {
            $('#id')[0].setCustomValidity('ID는 영어만 입력하실 수 있습니다.');
            $('#id')[0].reportValidity(); // 브라우저의 오류 메시지를 표시
            $('#id').focus();
            return;
        } else {
            $('#id')[0].setCustomValidity(''); // 유효한 경우 오류 메시지 해제
        }
        // 비밀번호 필수 체크
        if (pwd == '' || pwd == null) {
            alert('비밀번호를 입력하세요');
            $('#pwd').focus();
            return;
        }
        // 비밀번호 확인 필수 체크
        if (confirmPwd == '' || confirmPwd == null) {
            alert('비밀번호를 다시 입력하세요.');
            $('#confirmPwd').focus();
            return;
        }
        // 비밀번호 일치 확인
        if (pwd !== confirmPwd) {
            $('#confirmPwd')[0].setCustomValidity('비밀번호가 일치하지 않습니다.');
            $('#confirmPwd')[0].reportValidity(); // 브라우저에 오류 표시
            $('#confirmPwd').focus();
            return;
        } else {
            $('#confirmPwd')[0].setCustomValidity(''); // 비밀번호 일치 시 오류 해제
        }
        // 이름 필수 체크
        if (name == '' || name == null) {
            alert('이름을 입력하세요.');
            $('#name').focus();
            return;
        }
        // 이메일 필수 및 형식 체크
        if (email == '' || email == null) {
            alert('이메일을 입력하세요.');
            $('#email').focus();
            return;
        }
        if (!emailPattern.test(email)) {
            $('#email')[0].setCustomValidity('올바른 이메일 형식이 아닙니다.');
            $('#email')[0].reportValidity(); // 브라우저에 오류 표시
            $('#email').focus();
            return;
        } else {
            $('#email')[0].setCustomValidity(''); // 유효한 이메일일 경우 오류 해제
        }

        // 모든 검증 완료 시 서버에 폼 전송
        this.send();
    },
    send: function() {
        // 폼의 method와 action 설정 후 제출
        $('#signup_form').attr('method', 'post');
        $('#signup_form').attr('action', '/signupimpl'); // 회원가입 처리 경로
        $('#signup_form').submit();
    }
};

$(document).ready(function() {
    js6.init();
});

