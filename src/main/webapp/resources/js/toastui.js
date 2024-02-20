const editor = new toastui.Editor({
    el: document.querySelector('#noticeContent'), // 에디터를 적용할 요소 (컨테이너)
    height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
    initialEditType: 'wysiwyg',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
    initialValue: '내용을 입력해 주세요.',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
    previewStyle: 'tab'                // 마크다운 프리뷰 스타일 (tab || vertical)
});

async function savePost(){
    if(editor.getwysiwyg().length < 1){
        alert('내용을 입력해 주세요.');
        throw new Error('content is required!!!');
    }
    const params = {
        content: editor.getHTML()
    }
}