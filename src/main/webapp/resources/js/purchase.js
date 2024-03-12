var rno = document.getElementById("rno").value;

$(function(){
    $("#purchase").click(function(){
        $.ajax({
            url:'/reservation/payment?rno='+rno,
            dataType:'json',
            success:function(data){
            alert(data.tid);
                var box = data.next_redirect_pc_url;
                window.open(box);
            } ,
            error:function(error){
                alert(error);
            }
        })
    })
})