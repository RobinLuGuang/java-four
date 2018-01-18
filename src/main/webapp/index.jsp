<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <!-- Bootstrap 插件 css -->
    <link href="js/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <!-- Bootstrap 核心css -->
    <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap TreeView css -->
    <link href="js/bootstrap-treeview/dist/bootstrap-treeview.min.css" rel="stylesheet">

    <!-- Bootstrap addTabs css -->
    <link href="js/bootStrap-addTabs/bootstrap.addtabs.css" rel="stylesheet">

    <!-- Bootstrap table css -->
    <link href="js/bootstrap-table/dist/bootstrap-table.css" rel="stylesheet">
    <!-- bootstrap-datetimepicker css -->
    <link href="js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">

    <!-- bootstrap-dialog css -->
    <link href="js/bootstrap-dialog/dist/css/bootstrap-dialog.css" rel="stylesheet">
    <!-- bootstrap-fileinput css -->
    <link href="js/bootstrap-fileinput/css/fileinput.css" rel="stylesheet">

</head>
<body>
<div class="container-fluid">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <nav class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">切换导航</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">烙印</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="#">链接</a>
                        </li>
                        <li>
                            <a href="#">链接</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">下拉<strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">动作</a>
                                </li>
                                <li>
                                    <a href="#">又一个动作</a>
                                </li>
                                <li>
                                    <a href="#">别的东西在这里</a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a href="#">分离的链接</a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a href="#">一个分离的链接</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control">
                        </div> <button type="submit" class="btn btn-default">提交</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#">链接</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">下拉<strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">动作</a>
                                </li>
                                <li>
                                    <a href="#">又一个动作</a>
                                </li>
                                <li>
                                    <a href="#">别的东西在这里</a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a href="#">分离的链接</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-2 column">
            <!--树 -->
            <div id="tree">
            </div>
        </div>
        <div class="col-md-9 column">
            <!-- 选项卡  tabs -->
            <ul id="myTab" class="nav nav-tabs">
                <li >
                    <a  data-toggle="tab"> 首页</a>
                </li>
            </ul>
            <!--想要打开tab页内容，需要把对应的ul和要打开的内容tab放在一个div里  -->
            <div class="tab-content"></div>

            <div class="col-md-12 column">


            </div>
        </div>
    </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap/js/bootstrap.min.js"></script>
<script src="js/bootstrap-treeview/dist/bootstrap-treeview.min.js"></script>
<script src="js/bootStrap-addTabs/bootstrap.addtabs.js"></script>
<script src="js/bootstrap-table/dist/bootstrap-table.js"></script>
<script src="js/bootstrap-table/dist/locale/bootstrap-table-zh-CN.js"></script>
<script src="js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="js/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="js/bootstrap-dialog/dist/js/bootstrap-dialog.js"></script>
<script src="js/bootstrap-fileinput/js/fileinput.js"></script>
<script src="js/bootstrap-fileinput/js/locales/zh.js"></script>

<script type="text/javascript">
    function getTreeData(){
        var tree_data = "";
        $.ajax({
            url:"/queryTree",
            type:"post",
            dataType:"json",
            async:false,
            success:function(data){
                tree_data = data;
            },
            error:function(){
                alert("查询出错");
            }
        });
        return tree_data;
    }


    $(function(){
        $('#tree').treeview(
            {
                data:getTreeData(),
                /*     onNodeCollapsed:function(event,node){
                            alert("折叠了");
                        },
                       onNodeExpanded :function(event,node){
                           alert("打开了");
                       }, */
                onNodeSelected:function(event,node){
                    console.info(node)
                    console.info(event)
                    if(node.href != null && node.href != ""){
                        $.ajax({
                            url:node.href,
                            type:"post",
                            success:function(data){
//                         				添加选项卡面板
                                $.addtabs.add({
                                    id:node.id,
                                    title:node.text,
                                    content:data,
                                })
                            }
                        })
                    }
                }
            });
    })
</script>
</body>
</html>