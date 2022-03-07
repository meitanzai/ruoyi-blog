$(function () {

    // 打开搜索框
    $("#layui-icon-search").click(function (e) {
        $("#search-win").toggle()
        $("#sortlist").hide();
        e.stopPropagation()
    });
    // 排序
    $("#div01").click(function (e) {
        $("#sortlist").toggle()
        $("#search-win").hide();
        e.stopPropagation()
    });
    $(document).click(function (e) {
        if (!($("#sortlist").is(e.target))) {
            $("#sortlist").hide();
        }
    });
    // 上传文件按钮打开上传弹窗
    $("#layui-icon-add-1").click(function (e) {
        $("#curtain").show()
        $("#uploadfiles").show()
        $("#search-win").hide();
        $("#sortlist").hide();
        e.stopPropagation()
    });
    $("#add-folder01").click(function (e) {
        $("#curtain").show()
        $("#uploadfiles").show()
        $("#search-win").hide();
        $("#sortlist").hide();
        e.stopPropagation()
    });
    //关闭上传文件弹窗在下面
    //==================================
    // 关闭搜索框
    $("#layui-icon-close").click(function () {
        $("#search-win").hide()
    });
    // 关闭详细信息弹窗
    $("#layui-icon-close02").click(function () {
        $("#curtain").hide()
        $("#lookinfo").hide()
    });
    // 关闭分享弹窗
    $("#layui-icon-close03").click(function () {
        $("#curtain").hide()
        $("#sharefiles").hide()
        var id = $("#hidetext1").text();
        $.ajax({
            type: "post",
            url: "/cloud/file/setShare",    //请求发送到dataActiont处
            data: {"id": id, "isShare": 1},
            success: function (data) {
                console.log(data)
                if (data > 0) {
                    window.location.href = "/cloud/file/findAllFile";
                }
            }
        })
    });
    // 关闭右键菜单
    $(".files").mouseleave(function () {
        $(".rightsub-list").hide();
    });
})

window.onload = function () {
    // 关闭上传文件弹窗
    document.getElementById("closeupload").onclick = function () {
        document.getElementById("uploadfiles").style.display = "none"
        document.getElementById("curtain").style.display = "none"
        window.location.href = "/cloud/file/findAllFile";
    };
    //;layui操作结果反馈
    var layer = layui.layer;
    var chooseones = document.getElementsByClassName("chooseone")
    var files = document.getElementsByClassName("files");
    var rightsub = document.getElementsByClassName("rightsub");
    var setfavorites = document.getElementsByClassName("setfavorites");
    var publicstatis = document.getElementsByClassName("publicstatis");
    var favoi = document.getElementById("favoi");
    for (var i = 0; i < files.length; i++) {
        // 鼠标右击文件弹出框
        files[i].oncontextmenu = function () {
            this.children[0].style.display = "block";
        }
        files[i].onmouseover = function () {
            if (!(this.children[1].children[0].checked)) {
                this.style.backgroundColor = "#eeeeee";
                this.children[1].style.display = "block";
                this.children[2].style.display = "block";
            }
        }
        files[i].onmouseout = function () {
            if (!(this.children[1].children[0].checked)) {
                this.style.backgroundColor = "#ffffff";
                this.children[1].style.display = "none";
                this.children[2].style.display = "none";
            }
        }
    }
    for (var i = 0; i < rightsub.length; i++) {
        rightsub[i].onclick = function () {
            this.parentNode.children[0].style.display = "block";
        }
    }


    // 下载所有选择的文件
    document.getElementById("downloadall").onclick = function () {
        var ids = new Array();
        for (let i = 0; i < chooseones.length; i++) {
            if (chooseones[i].checked) {
                ids.push(chooseones[i].nextElementSibling.value);
            }
        }
        if (ids.length === 0) {
            return false;
        }
        window.location.href = "/cloud/file/downloadFileList?ids=" + ids;
        layer.msg("下载准备中...");
    };
    // 收藏单个文件（除去收藏页面，其他页面共享）
    for (var i = 0; i < setfavorites.length; i++) {
        setfavorites[i].onclick = function () {
            var isCollect = 0;
            if (this.innerText === "收藏") {
                isCollect = 1;
            }
            var id = this.nextElementSibling.value;
            var ftxt = this;
            $.ajax({
                type: "post",
                url: "/cloud/file/setFavorite",
                data: {"isCollect": isCollect, "id": id},
                success: function (data) {
                    if (data === 1) {
                        ftxt.style.color = "#FF6F66"
                        ftxt.innerHTML = "取消收藏"
                        layer.msg("收藏成功！可前往收藏夹查看")
                    } else if (data === 2) {
                        ftxt.style.color = "#000000"
                        ftxt.innerHTML = "收藏";
                        layer.msg("取消收藏成功")
                    } else if (data === 3) {
                        layer.msg("服务器异常，暂不可收藏")
                    } else {
                        layer.msg("服务器异常，取消失败")
                    }
                    var m = 0;
                    var k = 0;
                    for (var j = 0; j < chooseones.length; j++) {
                        if (chooseones[j].checked) {
                            m++;
                            if (setfavorites[j].innerText === "取消收藏") {
                                k++;
                            }
                        }
                    }
                    if (m === k) {
                        favoi.style.color = "#F8CC2A"
                    } else {
                        favoi.style.color = "#C6C6C7"
                    }
                }
            })

        }
    }
    // 批量收藏
    document.getElementById("favoriteall").onclick = function () {
        var ids = new Array();
        var favorites = new Array();
        for (let i = 0; i < chooseones.length; i++) {
            if (chooseones[i].checked) {
                favorites.push(setfavorites[i])
                ids.push(chooseones[i].nextElementSibling.value);
            }
        }
        var bool = false;
        for (let i = 0; i < favorites.length; i++) {
            if (favorites[i].innerText === "收藏") {
                bool = true;
                break
            }
        }
        var isCollect = 0;
        if (bool) {
            isCollect = 1;
        }
        $.ajax({
            type: "post",
            url: "/cloud/file/setFavorites",
            traditional: true,
            data: {"isCollect": isCollect, "ids": ids},
            success: function (data) {
                if (data === 1) {
                    for (let i = 0; i < favorites.length; i++) {
                        favoi.style.color = "#F8CC2A"
                        favorites[i].style.color = "#FF6F66"
                        favorites[i].innerHTML = "取消收藏";
                    }
                    layer.msg("收藏成功！可前往收藏夹查看")
                } else if (data === 2) {
                    for (let i = 0; i < favorites.length; i++) {
                        favoi.style.color = "#C6C6C7"
                        favorites[i].style.color = "#000000"
                        favorites[i].innerHTML = "收藏";
                    }
                    layer.msg("取消收藏成功")
                } else {
                    layer.msg("页面出错")
                }
            }
        })
    };

    // 批量删除
    // 删除单击提示
    document.getElementById("moveinrecycle").onclick = function () {
        layer.msg("请双击图标移除")
    };
    document.getElementById("moveinrecycle").ondblclick = function () {
        var ids = new Array();
        var fileList = new Array();
        for (let i = 0; i < chooseones.length; i++) {
            if (chooseones[i].checked) {
                ids.push(chooseones[i].nextElementSibling.value);
                fileList.push(chooseones[i])
            }
        }
        $.ajax({
            type: "post",
            url: "/cloud/file/deleteRecycle",
            traditional: true,
            data: {"ids": ids},
            success: function (data) {
                console.log(data)
                if (data > 0) {
                    layer.msg("删除成功")
                } else {
                    layer.msg("服务器异常，删除失败")
                }
                document.getElementById("downlist").style.display = "none";
                window.location.href = "/cloud/file/findAllFile";

            }
        })
    };
    // 批量公开
    document.getElementById("setpublic").onclick = function () {
        var pubi = document.getElementById("pubi");
        var ids = new Array();
        var publics = new Array();
        for (let i = 0; i < chooseones.length; i++) {
            if (chooseones[i].checked) {
                publics.push(publicstatis[i])
                ids.push(chooseones[i].nextElementSibling.value);
            }
        }
        var bool = false;
        for (var i = 0; i < publics.length; i++) {
            if (publics[i].value === "0") {
                bool = true;
                break
            }
        }
        var ispublic = 0;
        if (bool) {
            ispublic = 1;
        }
        $.ajax({
            type: "post",
            url: "/cloud/file/setPublics",
            traditional: true,
            data: {"isPublic": ispublic, "ids": ids},
            success: function (data) {
                if (data === 1) {
                    for (let i = 0; i < publics.length; i++) {
                        publics[i].value = "1"
                    }
                    pubi.style.color = "#3882F3"
                    layer.msg("已公开，可前往共享文件查看")
                } else if (data === 2) {
                    for (let i = 0; i < publics.length; i++) {
                        publics[i].value = "0"
                    }
                    pubi.style.color = "#C6C6C7"
                    layer.msg("已关闭公开")
                } else {
                    layer.msg("页面出错")
                }
            }
        })
    };

}

// 全选
function allchoose() {
    var allchoose = document.getElementById("allchoose");
    var chooseones = document.getElementsByClassName("chooseone");
    var setfavorites = document.getElementsByClassName("setfavorites");
    var publicstatis = document.getElementsByClassName("publicstatis");
    var j = 0;
    var k = 0;
    if (allchoose.checked) {
        for (var i = 0; i < chooseones.length; i++) {
            chooseones[i].checked = true
            document.getElementsByClassName("leftsub")[i].style.display = "block";
            document.getElementsByClassName("files")[i].style.backgroundColor = "#ecefff"
            document.getElementById("downlist").style.display = "block"
            if (setfavorites[i].innerText === "取消收藏") {
                j++;
            }
            if (publicstatis[i].value === "1") {
                k++;
            }
        }
    } else {
        for (var i = 0; i < chooseones.length; i++) {
            chooseones[i].checked = false
            document.getElementsByClassName("leftsub")[i].style.display = "none";
            document.getElementsByClassName("files")[i].style.backgroundColor = "#ffffff"
            document.getElementById("downlist").style.display = "none"
        }
    }
    if (j === chooseones.length) {
        document.getElementById("favoi").style.color = "#F8CC2A";
    } else {
        document.getElementById("favoi").style.color = "#C6C6C7";
    }
    if (k === chooseones.length) {
        document.getElementById("pubi").style.color = "#3882F3";
    } else {
        document.getElementById("pubi").style.color = "#C6C6C7";
    }
}

// 选中一个
function chooseone() {
    var chooseones = document.getElementsByClassName("chooseone")
    var setfavorites = document.getElementsByClassName("setfavorites")
    var publicstatis = document.getElementsByClassName("publicstatis")
    var j = 0;
    var k = 0;
    var m = 0;
    var n = 0;
    for (var i = 0; i < chooseones.length; i++) {
        if (chooseones[i].checked) {
            document.getElementById("downlist").style.display = "block"
            document.getElementsByClassName("leftsub")[i].style.display = "block";
            document.getElementsByClassName("rightsub")[i].style.display = "none";
            document.getElementsByClassName("files")[i].style.backgroundColor = "#ecefff"
            j++
            if (setfavorites[i].innerText === "取消收藏") {
                m++;
            }
            if (publicstatis[i].value === "1") {
                n++;
            }
        } else {
            document.getElementsByClassName("leftsub")[i].style.display = "none";
            document.getElementsByClassName("files")[i].style.backgroundColor = "#ffffff"
            k++;
        }
        if (m === j) {
            document.getElementById("favoi").style.color = "#F8CC2A";
        } else {
            document.getElementById("favoi").style.color = "#C6C6C7";
        }
        if (n === j) {
            document.getElementById("pubi").style.color = "#3882F3";
        } else {
            document.getElementById("pubi").style.color = "#C6C6C7";
        }
    }
    if (k === chooseones.length) {
        document.getElementById("downlist").style.display = "none"
    }
    if (j === chooseones.length) {
        document.getElementById("allchoose").checked = true
    } else {
        document.getElementById("allchoose").checked = false
    }
}

// 取消所有选择(底部弹出框)
function closeallchoose() {
    document.getElementById("allchoose").checked = false
    var chooseone = document.getElementsByClassName("chooseone")
    for (var i = 0; i < chooseone.length; i++) {
        chooseone[i].checked = false;
        document.getElementsByClassName("leftsub")[i].style.display = "none";
        document.getElementsByClassName("files")[i].style.backgroundColor = "#ffffff"
    }
    document.getElementById("downlist").style.display = "none"
}

var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0, pos);

// 分享弹出窗口(除相册页面外其他页面共享)
function sharefile(avatar, name, id) {
    document.getElementById("avatar2").src = "/cloud/icon/" + avatar + ".png";
    document.getElementById("filename2").innerText = name;
    document.getElementById("linkid").innerText = localhostPaht + "/cloud/file/shareDownload?fileId=" + id;
    document.getElementById("hidetext1").innerText = id;

    var elementsByClassName = document.getElementsByClassName("rightsub-list");
    for (let i = 0; i < elementsByClassName.length; i++) {
        elementsByClassName[i].style.display = "none"
    }
    document.getElementById("curtain").style.display = "block";
    document.getElementById("sharefiles").style.display = "block";
}

// 详细信息弹窗
function detailsdata(avatar, name, size, path, ctime, stime, dcount) {
    debugger;
    document.getElementById("avatar1").src = "/cloud/icon/" + avatar + ".png";
    document.getElementById("filename").innerText = name;
    document.getElementById("filename1").innerText = name;
    if (size < 1024) {
        document.getElementById("filesize1").innerText = size + "KB";
    } else if (size >= 1024 && size < 1048576) {
        document.getElementById("filesize1").innerText = (size / 1024).toFixed(2) + "MB";
    } else {
        document.getElementById("filesize1").innerText = (size / 1024 / 1024).toFixed(2) + "GB";
    }
    document.getElementById("filepath1").innerText = path;
    document.getElementById("uploadtime1").innerText = ctime;
    document.getElementById("changetime1").innerText = stime;
    document.getElementById("downcounts1").innerText = dcount + "次";

    var elementsByClassName = document.getElementsByClassName("rightsub-list");
    for (let i = 0; i < elementsByClassName.length; i++) {
        elementsByClassName[i].style.display = "none"
    }
    document.getElementById("curtain").style.display = "block";
    document.getElementById("lookinfo").style.display = "block";
}

// 复制连接到粘贴板
function copylink() {
    var link = document.getElementById("linkid").innerText;
    var hidetext = document.getElementById("hidetext");
    hidetext.value = link;
    hidetext.select();
    document.execCommand("copy")
    var layer = layui.layer;
    layer.msg("口令已复制，分享给好友吧");
}

// 提示框
function onclick02(index) {
    var elementsByClassName = document.getElementsByClassName("tip-list");
    var searchinput = document.getElementById("search-input")
    var tiplist = ["图片:", "视频:", "音频:", "压缩文件:", "文档:"]
    for (var i = 0; i < elementsByClassName.length; i++) {
        if (index === i) {
            searchinput.value = tiplist[i];
            searchinput.focus()
            document.getElementById("tip-frame").style.display = "none";
            document.getElementById("search-win").style.height = "80px";
            break;
        }
    }
}

function oninput01(x) {
    x.value = x.value.trim()
    var searchinput = document.getElementById("search-input")
    var frame = document.getElementById("tip-frame")
    var win = document.getElementById("search-win")
    if (searchinput.value.length > 0) {
        frame.style.display = "none";
        win.style.height = "80px";
    } else {
        frame.style.display = "block";
        win.style.height = "272px";
    }
}

// 排序
// ====================================================================
// 排序选择
function choosechecked(index) {
    document.getElementsByClassName("mycheckeds")[index].checked = true;
    if (index === 0) {
        document.getElementById("sortstatus").innerText = "按名称排序"
    } else if (index === 1) {
        document.getElementById("sortstatus").innerText = "按上传时间排序"
    } else if (index === 2) {
        document.getElementById("sortstatus").innerText = "按修改时间排序"
    } else if (index === 3) {
        document.getElementById("sortstatus").innerText = "按文件大小排序"
    } else if (index === 4) {
        document.getElementById("sortstatus").innerText = "按下载次数排序"
    } else {
        var i = null
    }
    document.getElementById("sortlist").style.display = "none";

}

// ====================================================================
//关闭默认右键菜单
document.oncontextmenu = function (e) {
    e.preventDefault()
}
// ============================================

