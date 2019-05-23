<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
</head>
<body class="layui-layout-body" style="background-color: #F2F2F2;">
<div class="layui-layout layui-layout-admin" style="">
    <center>
        <form class="layui-form">
            <div class="layui-card layui-main" style="width: 500px; height: 100%; margin-top: 2%; padding:10px">
                <div class="layui-card-header">用户注册</div>
                <div class="layui-card-body">
                    <br />
                    <div class="layui-form-item" style="width: 400px;">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-block">
                            <input type="text" lay-verify="required" id="userName" name="userName" lay-verify="title" autocomplete="off" placeholder="请输入用户名" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item" style="width: 400px;">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-block">
                            <input type="password" lay-verify="required|pass" id="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item" style="width: 400px;">
                        <label class="layui-form-label">重复密码</label>
                        <div class="layui-input-block">
                            <input type="password" lay-verify="required|repass|pass"  id="rePassword" name="rePassword" placeholder="请输入密码" autocomplete="off" class="layui-input">
                        </div>
                        <span style="color: #e73d4a;"id="passwordMessage"></span>
                    </div>
                    <div class="layui-form-item " style="width: 400px;">
                        <label class="layui-form-label">性别</label>
                        <div class="layui-input-block" style="text-align: left">
                            <input type="radio" name="sex" value="0" title="男">
                            <input type="radio" name="sex" value="1" title="女" >
                        </div>
                    </div>
                    <div class="layui-form-item" style="width: 400px;">
                        <label class="layui-form-label">手机号</label>
                        <div class="layui-input-block">
                                <input type="tel" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item" style="width: 400px;">
                        <label class="layui-form-label">邮箱</label>
                        <div class="layui-input-block">
                            <input type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <br/>
                <div class="layui-form-item">
                    <button type="button" class="layui-btn" lay-submit="" lay-filter="userInsert">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </center>
</div>

<script src="../layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.use(['element','layer','form'],function(){
        var $=layui.$,
            form = layui.form,
            element = layui.element,
            layer = layui.layer;
        form.verify({
           pass: [/(.+){6,12}$/, '密码必须6到12位'],
           repass: function(value){
            var repassvalue = $('#password').val();
            if(value != repassvalue){
                return '两次输入的密码不一致!';
            }
           }
        });
        //监听提交
        form.on('submit(userInsert)', function(data){
            $.ajax({
                type:"POST",
                url:"/user/InsertUser",
                data:JSON.stringify(data.field),
                dataType:"json",
                contentType: "application/json;charset-UTF-8",
                success:function(data){
                    if(data.success){
                        window.location = '/';
                    }
                },
                error:function(jqXHR){
                aler("发生错误："+ jqXHR.status);
                }
            });

            return false;
        });
    });
</script>

</body>
</html>
