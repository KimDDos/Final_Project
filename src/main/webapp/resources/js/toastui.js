        const Editor = toastui.Editor;

        const editor = new Editor({
                el: document.querySelector('#editor'),
                height: "500px",
                initialEditType: 'markdown',
                previewStyle: 'vertical'
            });

        editor.value;
