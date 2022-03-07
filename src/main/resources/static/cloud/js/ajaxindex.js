var curWwwPath=window.document.location.href;
var pathName=window.document.location.pathname;
var pos=curWwwPath.indexOf(pathName);
var localhostPaht=curWwwPath.substring(0,pos);
$(document).ready(function() {
    $.ajax({
        type: "get",
        async: true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
        url: "/cloud/file/userInfo",    //请求发送到dataActiont处
        data: {},
        success: function (data) {
            console.log(data)
            $("#avatar").attr("src",data.avatar);
            $("#avatar1").attr("src",data.avatar);
            $("#usespace").text(data.usedSpaceToString);
            $("#space").text(data.totalSpace+"GB");
            $("#nickname").text(data.userName);
            $("#nickname1").text(data.userName);
            $("#percentage").text(data.percentage);
            $("#usepoint").css('width',data.percentage)
        }
    })
});
