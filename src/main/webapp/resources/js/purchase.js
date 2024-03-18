var rno = document.getElementById("rno").value;
var cno = document.getElementById("useCpNum").value;
var string;
if (cno != '')
{
string = '?rno='+rno + '&cno=' + cno;
}
else
{
string = '?rno='+rno;
}

$(function(){
    $("#purchase").click(function(){
        $.ajax({
            url:'/reservation/payment'+string,
            dataType:'json',
            success:function(data){
            alert(data.tid);
                var box = data.next_redirect_pc_url;
                window.open(box,"_self");
            } ,
            error:function(error){
                alert(error);
            }
        })
    })
})