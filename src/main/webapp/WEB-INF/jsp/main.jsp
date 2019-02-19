<%@page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>

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
    <!-- 引入工具树js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.5/util-js.js"></script>

</head>
<body>
<!-- 定义layout布局 -->
<!-- fit:true  自适应父容器 -->
<div class="easyui-layout" data-options="fit:true">
    <!-- 上：北 -->
    <div data-options="region:'north',title:'店铺订餐',height:100,collapsible:false">
        当前余额为： <span id="money">${user[0].userMoney }</span>
    </div>
    <!-- 左：西 -->
    <div data-options="region:'west',width:200,title:'导航',split:true,iconCls:'icon-search'">
        <div class="easyui-accordion" data-options="fit:true,selected:1">

            <ul class="easyui-tree" id="Tong"></ul>


        </div>
    </div>
    <!-- 中：中 -->
    <div data-options="region:'center',title:'列表'">
        <!-- 定义选项卡 -->
        <div class="easyui-tabs" data-options="fit:true" id="myTabs">

            <div data-options="title:'首页'">
                欢迎您
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    //异步树
    //对象.组件名({})
    $("#Tong").tree({
        url: "${pageContext.request.contextPath}/queryTree",
        parentField: "pid",
        onClick: function (node) {
            //alert(node.url)
            if (node.url != null) {
                //找选项卡是否已经存在
                if ($("#myTabs").tabs("exists", node.text)) {
                    //存在,选中之前的选项卡
                    $("#myTabs").tabs("select", node.text);
                } else {
                    //不存在
                    //动态添加选项卡
                    $("#myTabs").tabs("add", {
                        title: node.text,
                        closable: true,
                        //href:"<%=request.getContextPath() %>"+node.url, //引入body中间的内容
                        content: createJsp(node.url),
                        tools: [{
                            iconCls: 'icon-mini-refresh',
                            handler: function () {
                                //alert("刷新");
                                $("#myTabs").tabs("update", {
                                    tab: $("#myTabs").tabs("getSelected"),//获取选中的面板
                                    options: {
                                        content: createJsp(node.url)
                                    }
                                })
                            }
                        }]//添加工具
                    })
                }
            }


        }
    })

    function createJsp(url) {
        return "<iframe frameborder='0' src='${pageContext.request.contextPath}/" + url + "' style='width:100%;height:100%' scrolling='auto'></iframe>";
    }


    //查询余额
    $(function () {

        $.ajax({
            url: "${pageContext.request.contextPath}/user/queryUser.do",
            success: function () {

            },
            error: function () {
            }
        })


    })

</script>
</html>