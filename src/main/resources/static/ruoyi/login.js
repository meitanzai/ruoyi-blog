// 公钥加密(前后端公钥私钥保持一对)  密钥对生成 http://web.chacuo.net/netrsakeypair
const publicKey = 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCv06UX91BPfk7OhrgNOHZztpNWz7lDU+eerIKnjScR3bchhVZfc09P9lVulaKbhhfU+oyLWfHh6/25S7n7M9e5IlAIuNtqvO/3MzCRtsYfPO6EOemSPMM+17BiVviWfewp/XAqByV4KChqop3/X0qs9vmqrJRQs30W1kksimwwMQIDAQAB'

// 加密
function encrypt(txt) {
    const encryptor = new JSEncrypt()
    encryptor.setPublicKey(publicKey) // 设置公钥
    return encryptor.encrypt(txt) // 对数据进行加密
}

$(function() {
    validateKickout();
    validateRule();
    $('.imgcode').click(function() {
        var url = ctx + "captcha/captchaImage?type=" + captchaType + "&s=" + Math.random();
        $(".imgcode").attr("src", url);
    });
});

$.validator.setDefaults({
    submitHandler: function() {
        login();
    }
});

function login() {
    $.modal.loading($("#btnSubmit").data("loading"));
    var username = $.common.trim($("input[name='username']").val());
    var password = $.common.trim($("input[name='password']").val());
    var validateCode = $("input[name='validateCode']").val();
    var rememberMe = $("input[name='rememberme']").is(':checked');
    $.ajax({
        type: "post",
        url: ctx + "login",
        data: {
            "username": username,
            "password": encrypt(password),
            "validateCode": validateCode,
            "rememberMe": rememberMe,
            "ipAddr": Cookies.get("ip")
        },
        success: function(r) {
            if (r.code == web_status.SUCCESS) {
                location.href = ctx + 'index';
            } else {
            	$('.imgcode').click();
            	$(".code").val("");
            	$.modal.msg(r.msg);
            }
            $.modal.closeLoading();
        }
    });
}

function validateRule() {
    var icon = "<i class='fa fa-times-circle'></i> ";
    $("#signupForm").validate({
        rules: {
            username: {
                required: true
            },
            password: {
                required: true
            }
        },
        messages: {
            username: {
                required: icon + "请输入您的用户名",
            },
            password: {
                required: icon + "请输入您的密码",
            }
        }
    })
}

function validateKickout() {
    if (getParam("kickout") == 1) {
        layer.alert("<font color='red'>您已在别处登录，请您修改密码或重新登录</font>", {
            icon: 0,
            title: "系统提示"
        },
        function(index) {
            //关闭弹窗
            layer.close(index);
            if (top != self) {
                top.location = self.location;
            } else {
                var url = location.search;
                if (url) {
                    var oldUrl = window.location.href;
                    var newUrl = oldUrl.substring(0, oldUrl.indexOf('?'));
                    self.location = newUrl;
                }
            }
        });
    }
}

function getParam(paramName) {
    var reg = new RegExp("(^|&)" + paramName + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return decodeURI(r[2]);
    return null;
}
