$(function () {

    $("#setbtn").click(function (e) {
        $("#setpage").toggle()
        e.stopPropagation()
    });
    $("#setpage").click(function (e) {
        $("#setpage").hide()
    });
    $(document).click(function(e){
        if (!($("#setpage").is(e.target))){
            $("#setpage").hide();
        }
    })
    // // 关于隐私弹窗
    $("#aboutprivacy").mouseover(function () {
        $("#privacybtn").show();
    });
    $("#privacybtn").mouseover(function () {
        $("#privacybtn").show();
    });
    $("#aboutprivacy").mouseout(function () {
        $("#privacybtn").hide();
    });
    $("#privacybtn").mouseout(function () {
        $("#privacybtn").hide();
    });
    // 登出
    $("#signout").click(function () {
        $("#setpage").hide();
        $("#curtain").show();
        $("#signoutwin").show();
    });
    // 取消登出弹窗
    $("#cancelout").click(function () {
        $("#curtain").hide();
        $("#signoutwin").hide();

    });
})
// 导航栏被点击
function onclick01(index){
    var elementsByClassName = document.getElementsByClassName("navigation");
    for (var i=0;i<elementsByClassName.length;i++){
        if (index===i){
            document.getElementsByClassName("txtt")[i].style.color = "#637dff"
            document.getElementsByClassName("txtt")[i].style.fontWeight = "bolder"
            document.getElementsByClassName("txtd")[i].style.color = "#637dff"
            document.getElementsByClassName("txtd")[i].style.fontWeight = "bolder"
        }else{
            document.getElementsByClassName("txtt")[i].style.color = "#25262b"
            document.getElementsByClassName("txtt")[i].style.fontWeight = "normal"
            document.getElementsByClassName("txtd")[i].style.color = "#25262b"
            document.getElementsByClassName("txtd")[i].style.fontWeight = "normal"
        }

    }
}




