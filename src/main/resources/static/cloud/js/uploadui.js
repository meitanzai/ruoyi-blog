layui.use(['upload', 'element', 'layer'], function(){
    var $ = layui.jquery
        ,upload = layui.upload
        ,element = layui.element
        ,layer = layui.layer;

    //常规使用 - 普通图片上传
    var uploadInst = upload.render({
        elem: '#test1'
        ,url: '/user/uploadavatar' //此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
        ,field: 'avatar'
        ,method: 'post'
        ,before: function(obj){
            //预读本地文件示例，不支持ie8
            obj.preview(function(index, file, result){
                $('#demo1').attr('src', result); //图片链接（base64）
            });

            element.progress('demo', '0%'); //进度条复位
            layer.msg('上传中', {icon: 16, time: 0});
        }
        ,done: function(res){
            //如果上传失败
            if(res.code > 0){
                return layer.msg('上传失败');
            }
            //上传成功的一些操作
            //……
            $('#demoText').html(''); //置空上传失败的状态
        }
        ,error: function(){
            //演示失败状态，并实现重传
            var demoText = $('#demoText');
            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
            demoText.find('.demo-reload').on('click', function(){
                uploadInst.upload();
            });
        }
        //进度条
        ,progress: function(n, elem, e){
            element.progress('demo', n + '%'); //可配合 layui 进度条元素使用
            if(n == 100){
                layer.msg('上传完毕', {icon: 1});
            }
        }
    });
// =============================================================================
    //多文件列表
    var uploadListIns = upload.render({
        elem: '#testList'
        ,elemList: $('#demoList') //列表元素对象
        ,url: '/cloud/file/uploadFiles' //此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
        ,field: 'files'
        ,accept: 'file'
        ,method: 'post'
        ,multiple: true
        ,number: 6
        ,auto: false
        ,bindAction: '#testListAction'
        ,choose: function(obj){
            var that = this;
            var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
            //读取本地文件
            obj.preview(function(index, file, result){
                var tr = $(['<tr id="upload-'+ index +'">'
                    ,'<td>'+ file.name +'</td>'
                    ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
                    ,'<td><div class="layui-progress" lay-filter="progress-demo-'+ index +'"><div class="layui-progress-bar" lay-percent=""></div></div></td>'
                    ,'<td>'
                    ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
                    ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
                    ,'</td>'
                    ,'</tr>'].join(''));

                //单个重传
                tr.find('.demo-reload').on('click', function(){
                    obj.upload(index, file);
                });

                //删除
                tr.find('.demo-delete').on('click', function(){
                    delete files[index]; //删除对应的文件
                    tr.remove();
                    uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                });

                that.elemList.append(tr);
                element.render('progress'); //渲染新加的进度条组件
            });
        }
        ,done: function(res, index, upload){ //成功的回调
            var that = this;
            if(res.code === 0){ //上传成功
                var tr = that.elemList.find('tr#upload-'+ index)
                    ,tds = tr.children();
                tds.eq(3).html('success'); //清空操作
                delete this.files[index]; //删除文件队列已经上传成功的文件
                return;
            }else{
                layer.msg(res.msg)
            }
            this.error(index, upload);
        }
        ,allDone: function(obj){ //多文件上传完毕后的状态回调
            console.log(obj)
        }
        ,error: function(index, upload){ //错误回调
            var that = this;
            var tr = that.elemList.find('tr#upload-'+ index)
                ,tds = tr.children();
            tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
            // layer.msg("请检查空间是否已满")
        }
        ,progress: function(n, elem, e, index){ //注意：index 参数为 layui 2.6.6 新增
            element.progress('progress-demo-'+ index, n + '%'); //执行进度条。n 即为返回的进度百分比
        }
    });

});
