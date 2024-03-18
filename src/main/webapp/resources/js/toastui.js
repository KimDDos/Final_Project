        const Editor = toastui.Editor;

        const editor = new Editor({
                el: document.querySelector('#editor'),
                height: "500px",
                initialEditType: 'markdown',
                previewStyle: 'vertical',
//start hooks
                hooks: {
            addImageBlobHook(blob, callback) {  // 이미지 업로드 로직 커스텀
                console.log(blob);
                console.log(callback);
            }
        }
//endhooks
            });
            

        editor.value;
