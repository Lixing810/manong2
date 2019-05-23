<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css" type="text/css"  media="all">
</head>
<body class="layui-layout-body" style="background-color: #F2F2F2;">
<div class="layui-layout layui-layout-admin" style="">
    <center>
        <form class="layui-form">
            <div style="margin-top: 5%;font-size: 25px;">码农商城</div>
            <div class="layui-card layui-main" style="width: 500px; height: 300px; margin-top: 5%; padding:10px">
                <div class="layui-card-header">用户登录</div>
                <div class="layui-card-body">
                    <br />
                    <form class="layui-form">
                        <div class="layui-form-item" style="width: 400px;">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" lay-verify="required" id="userName" name="userName" lay-verify="title" autocomplete="off" placeholder="请输入用户名" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item" style="width: 400px;">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="password" id="password" name="password" lay-verify="required"  placeholder="请输入密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </form>
                </div>
                <br/>
                <div>
                    <button type="button" class="layui-btn layui-btn-normal" lay-submit="" lay-filter="btnLogin">登录</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
                <div  style="margin-left: 65%;margin-top: 5%;"><a href="${pageContext.request.contextPath}/registered" >没有账号？现在注册</a></div>
            </div>
        </form>
    </center>
</div>

<script src="../layui/layui.js" charset="utf-8"></script>
<script src="../zTree_v3/js/jquery-3.3.1.js" charset="utf-8"></script>
<script src="../js/cookie/jquery.cookie.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.use(['element','layer','form'],function(){
        var $=layui.$,
            layer = layui.layer,
            form = layui.form;
        form.on('submit(btnLogin)', function(data){
            $.ajax({
                type:"POST",
                url:"/user/selectUser",
                data:{"userName":data.field.userName},
                success:function(res){
                    if (res!=""){
                        if (res.password==data.field.password) {
                           if (res.isLogin==0){
                               console.info(JSON.stringify(res))
                               console.info(res)
                               $.cookie("user", JSON.stringify(res), {"expires": 20 * 365});
                              // $.ajax({
                              //   type:"POST",
                              //   url:"/user/changeLoginStatus",
                              //   data:{"isLogin":1,"id":res.id},
                              //   success:function(res){
                              //       layer.msg(res)
                              //       window.location = '/manager';
                              //   },
                              //   error:function(jqXHR){
                              //       layer.msg("系统错误，请联系管理员")
                              //   }
                              //  });
                           }else {
                            layer.msg("该账户已在别处登录，请联系管理员")
                            }
                        }else {
                            layer.msg("密码错误，请重新输入")
                        }
                    }else {
                        layer.msg("没有该账号，请注册")
                    }
                },
                error:function(jqXHR){
                    layer.msg("系统错误，请联系管理员")
                }
            });
            return false;
        });

    });
</script>

</body>
</html>
