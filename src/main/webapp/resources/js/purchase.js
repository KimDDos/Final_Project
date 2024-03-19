
$(function(){
    $("#purchase").click(function(){
    var rno = document.getElementById("rno").value;
var cno = document.getElementById("useCpNum").value;
var string = '';
console.log("CPNUM"+cno);
    if (cno != '')
{
string = '?rno='+rno + '&cno=' + cno;
}
else
{
string = '?rno='+rno + '&cno=' + 0;
}
console.log("/reservation/payment"+string);
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