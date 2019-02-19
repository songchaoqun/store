<%--
  Created by IntelliJ IDEA.
  User: 庄冰倩
  Date: 2019/1/17
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- 引入easyui样式文件 -->
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/js/jquery-easyui-1.5/themes/default/easyui.css">
    <!-- 引入easyui图标样式文件 -->
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/js/jquery-easyui-1.5/themes/icon.css">
    <!-- 引入jquery js文件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.5/jquery.min.js"></script>
    <!-- 引入easyui的js文件 -->
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery-easyui-1.5/jquery.easyui.min.js"></script>
    <!-- 引入easyui支持中文js -->
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>

</head>
<body>
<!-- 定义表格 -->
<table id="myTable"></table>

</body>
<script>
    //初始化
    $(function () {
        initTable();
    })

    //表格
    function initTable() {
        $("#myTable").datagrid({
            url: "${pageContext.request.contextPath}/query",
            columns: [[
                {field: 'eid', title: '店铺Id'},
                {field: 'ename', title: '名称'},
                {
                    field: 'eis', title: '营业状态', formatter: function (value, row, index) {
                        return value == 1 ? "是" : value == 0 ? "否" : "";
                    }
                },
                {
                    field: 'tools', title: '操作', width: 100, align: 'center', formatter: function (value, row, index) {
                        if (row.eis == 0) {
                            var str = "<input type='button' value='订餐' onclick='openTan()'  >";
                        } else {
                            var str = "<input type='button' value='订餐' onclick='openDig(" + row.eid + ")'>"
                        }
                        return str;
                    }
                }
            ]],
            pagination: true,//开启分页
            rownumbers: true,		   //显示行号
        })
    }

    //未营业弹框
    function openTan() {
        $.messager.alert("提示", "该店铺未营业", "info");
        return;
    }

    //订餐
    function openDig(id) {

    }
</script>

</html>
