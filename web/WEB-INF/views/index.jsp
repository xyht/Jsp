<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import=" java.awt.*"%>
<%
    String[][] str = new String[6][5];
    str = (String[][]) request.getAttribute("str");
%>
<%
    int width=Toolkit.getDefaultToolkit().getScreenSize().width;
    int height=Toolkit.getDefaultToolkit().getScreenSize().height;
    System.out.println(width);
%>

<html>
    <!--头部信息-->
    <head>

        <meta http-equiv="content-type" content="text/html;charset=utf-8" />
        <title>Jsp期末作业</title>


        <link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="static/css/admin_modex.css" rel="stylesheet" type="text/css">
        <link href="static/css/bootstrap.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="static/css/public.css" />
        <link rel="stylesheet" type="text/css" href="static/css/zsstyle.css" />

        <script src="static/js/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="static/js/jquery.min.js" type="text/javascript"></script>
        <script src="static/js/bootstrap.min.js" type="text/javascript"></script>

        <script src="static/js/echarts.min.js" type="text/javascript"></script>
        <script src="static/js/sectionscroll.js" type="text/javascript"></script>
        <script src="static/js/jquery.mousewheel.min.js" type="text/javascript"></script>

        <style>
            @media screen and (min-width: 900px) {
                .center-liubai{height: 700px;}
                .doin{width: 100%}
                body{margin: 0 0;padding: 0 0;}
                html{margin: 0 0;padding: 0 0;}
            }
            @media screen and (max-width: 1200px) {
                .center-liubai{height: 475px;}
            }
        </style>
        <script language="JavaScript">
            window.onload=function() {
                var w = screen.width;
                var h = screen.height;
                if(w<800) {
                    $(document).ready(function () {
                        $(".container-fluid").attr("class", "body"); //改成BBB
                    });
                }
            }
        </script>
        <script type="text/javascript">
            $(function() {
                $(window).resize(function() {
                    imgWH();
                }).resize();
                function imgWH() {
                    var i = 0,
                        imgpnglength = $('.imgpng').length;
                    for(i=0; i < imgpnglength; i++) {
                        var imgpng = $('.imgpng').eq(i),
                            imgpngW = imgpng.width(),
                            maximgpngW = imgpng.attr("width");
                        if(imgpngW >=　maximgpngW){
                            imgpng.attr('width', maximgpngW);
                        } else {
                            imgpng.attr('width', imgpngW);
                        }
                    }
                    var imgtopW = $('.imgtop').width(),
                        imgtopH = $('.imgtop').height();
                    $('.gem-back').css({width:imgtopW*0.375,height:imgtopH*0.19,marginTop:imgtopH*0.259});
                }
            });
        </script>
    </head>
    <body class="container-fluid" id="body">
            <div id="register" class="modal fade tangchuang" tabindex="-1" >
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body">
                                <button class="close" data-dismiss="modal">
                                    <span>&times;</span>
                                </button>
                            </div>
                            <div class="modal-title">
                                <h1 class="text-center">注册</h1>
                            </div>
                            <div class="modal-body">
                                <form class="form-group" action="ShoppingServlet" method="post">
                                        <div class="form-group">
                                            <label for="">用户名</label>
                                            <input name="name" class="form-control" type="text" placeholder="6-15位字母或数字">
                                        </div>
                                        <div class="form-group">
                                            <label for="">密码</label>
                                            <input id="password1" name="password" class="form-control" type="password" placeholder="至少6位字母或数字">
                                        </div>
                                        <div class="form-group">
                                            <label for="">再次输入密码</label>
                                            <input id="password2" class="form-control" type="password" placeholder="至少6位字母或数字">
                                        </div>
                                        <div class="form-group">
                                            <label for="">邮箱</label>
                                            <input name="email" class="form-control" type="email" placeholder="例如:123@123.com">
                                        </div>
                                        <div class="text-right">
                                            <button class="btn btn-primary" type="submit" id="sublime1">提交</button>
                                            <button class="btn btn-danger" data-dismiss="modal">取消</button>
                                        </div>
                                        <a href="" data-toggle="modal" data-dismiss="modal" data-target="#login">已有账号？点我登录</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 登录窗口 -->
                <div id="login" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body">
                                <button class="close" data-dismiss="modal">
                                    <span>&times;</span>
                                </button>
                            </div>
                            <div class="modal-title">
                                <h1 class="text-center">登录</h1>
                            </div>
                            <div class="modal-body">
                                <form class="form-group" action="Login" method="post">
                                    <div class="form-group">
                                        <label for="">用户名</label>
                                        <input name="id" class="form-control" type="text" placeholder="">
                                    </div>
                                    <div class="form-group">
                                        <label for="">密码</label>
                                        <input name="pass" class="form-control" type="password" placeholder="">
                                    </div>
                                    <div class="text-right">
                                        <button class="btn btn-primary" type="submit">登录</button>
                                        <button class="btn btn-danger" data-dismiss="modal">取消</button>
                                    </div>
                                    <a href="" data-toggle="modal" data-dismiss="modal" data-target="#register">还没有账号？点我注册</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 注册登陆弹出窗口结束 -->
        <!--头部开始-->
        <section id="section1" class="top section">
            
            <!--导航开始-->
            <div class="dr" >
                <div class="col-lg-2"></div>
                <p class="p1 col-sm-2" >LOGO</p>
                <ul>
                    <li class="li1"><a href="#">首页</a></li>
                    <li class="li1"><a href="#">关于</a></li>
                    <li class="li1"><a href="#">服务</a></li>
                    <li class="li1"><a href="#">优势</a></li>
                    <li class="li1"><a href="#">案例</a></li>
                    <li class="li1"><a href="#">动态</a></li>
                    <li class="li1"><a href="#">历程</a></li>
                    <li class="li1"><a href="#">联系</a></li>
                    <li class="li1"><a href="#">其他</a></li>
                    <div class="index" id="logins">
                        <li class="li2"><a href="#register" data-toggle="modal" data-target="#register" >注册</a></li>
                        <p>|</p>
                        <li class="li3"><a href="#login" data-toggle="modal" data-target="#login" >登陆</a></li>
                    </div>
                    <div class="admin" id="user">
                        <p class="p34" id="names"></p>
                    </div>
                </ul>
            </div>

            <div id="carousel-example-generic" class="carousel slide lbt" data-ride="carousel">
                <!-- Indicators -->
                <ul class="carousel-indicators">
                  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                  <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                  <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ul>
              
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                  <div class="item active">
                        <img class="imgs" src="static/img/top_bg1.png" alt="...">
                        <div class="carousel-caption">
                        </div>
                  </div>
                  <div class="item">
                        <img class="imgs" src="static/img/top_bg2.png" alt="...">
                        <div class="carousel-caption">
                        </div>
                  </div>
                  <div class="item">
                        <img class="imgs" src="static/img/top_bg3.png" alt="...">
                        <div class="carousel-caption">
                        </div>
                      </div>
                </div>
              
                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <!--导航结束-->
        </section>
        <div class="clear"></div>


        <!--七年互金积累-->
        <section id="section2" class="center-liubai section">

        </section>
        <div class="clear"></div>

            <!--七年互金积累-->
            <section id="section3" class="center-age section">
                <div class="liubai2"></div>
                <div class="big-font">
                    <p class="p2">七年互金积累</p>
                    <p class="p3">让您运筹帷幄</p>
                    <div class="clear"></div>
                    <p class="p4">为互联网企业提供最优的idea</p>
                    <p class="p5"> AND有效的数字化解决方案</p>
                </div>
                <div class="clear"></div>
                <!--第一类图标-->
                <div class="tubiao">
                    <div class="one">
                        <div class="index">
                            <div class="liubai4"></div>
                            <div class="photo"></div>
                            <p class="p6">互联网金融+电商</p>
                        </div>
                        <div class="admin">
                            <div class="liubai3"></div>
                            <div class="photo"></div>
                            <p class="p7">互联网金融+电商</p>
                            <p class="p8">金融网贷系统</p>
                            <p class="p8">基金存管/销售系统</p>
                            <p class="p8">供应链金融系统</p>
                            <p class="p8">产品+股权众筹系统</p>
                            <p class="p8">电商+金融系统</p>
                        </div>
                    </div>
                    <div class="two">
                        <div class="index">
                            <div class="liubai4"></div>
                            <div class="photo"></div>
                            <p class="p6">移动应用研发</p>
                        </div>
                        <div class="admin">
                            <div class="liubai3"></div>
                            <div class="photo"></div>
                            <p class="p7">移动应用研发</p>
                            <p class="p8">APP研发</p>
                            <p class="p8">安卓/ios研发</p>
                            <p class="p8">手机应用研发</p>
                            <p class="p8">ipsd应用研发</p>
                            <p class="p8">微信站研发</p>
                        </div>
                    </div>
                    <div class="three">
                        <div class="index">
                            <div class="liubai4"></div>
                            <div class="photo"></div>
                            <p class="p6">数字化营销</p>
                        </div>
                        <div class="admin">
                            <div class="liubai3"></div>
                            <div class="photo"></div>
                            <p class="p7">数字化营销</p>
                            <p class="p8">品牌推广传播</p>
                            <p class="p8">电台/电视/报纸/杂志/网络</p>
                            <p class="p8">多种媒体资源整合</p>
                            <p class="p8">全国2000家媒体</p>
                            <p class="p8">微信公众号推广</p>
                            <p class="p8">百度SEO推广</p>
                        </div>
                    </div>
                    <div class="four">
                        <div class="index">
                            <div class="liubai4"></div>
                            <div class="photo"></div>
                            <p class="p6">互联网金融+电商</p>
                        </div>
                        <div class="admin">
                            <div class="liubai3"></div>
                            <div class="photo"></div>
                            <p class="p7">互联网金融+电商</p>
                            <p class="p8">金融网贷系统</p>
                            <p class="p8">基金存管/销售系统</p>
                            <p class="p8">供应链金融系统</p>
                            <p class="p8">产品+股权众筹系统</p>
                            <p class="p8">电商+金融系统</p>
                        </div>
                    </div>
                    <div class="five">
                        <div class="index">
                            <div class="liubai4"></div>
                            <div class="photo"></div>
                            <p class="p6">互联网金融+电商</p>
                        </div>
                        <div class="admin">
                            <div class="liubai3"></div>
                            <div class="photo"></div>
                            <p class="p7">互联网金融+电商</p>
                            <p class="p8">金融网贷系统</p>
                            <p class="p8">基金存管/销售系统</p>
                            <p class="p8">供应链金融系统</p>
                            <p class="p8">产品+股权众筹系统</p>
                            <p class="p8">电商+金融系统</p>
                        </div>
                    </div>
                    <div class="six">
                        <div class="index">
                            <div class="liubai4"></div>
                            <div class="photo"></div>
                            <p class="p6">移动应用研发</p>
                        </div>
                        <div class="admin">
                            <div class="liubai3"></div>
                            <div class="photo"></div>
                            <p class="p7">移动应用研发</p>
                            <p class="p8">APP研发</p>
                            <p class="p8">安卓/ios研发</p>
                            <p class="p8">手机应用研发</p>
                            <p class="p8">ipsd应用研发</p>
                            <p class="p8">微信站研发</p>
                        </div>
                    </div>
                    <div class="senven">
                        <div class="index">
                            <div class="liubai4"></div>
                            <div class="photo"></div>
                            <p class="p6">数字化营销</p>
                        </div>
                        <div class="admin">
                            <div class="liubai3"></div>
                            <div class="photo"></div>
                            <p class="p7">数字化营销</p>
                            <p class="p8">品牌推广传播</p>
                            <p class="p8">电台/电视/报纸/杂志/网络</p>
                            <p class="p8">多种媒体资源整合</p>
                            <p class="p8">全国2000家媒体</p>
                            <p class="p8">微信公众号推广</p>
                            <p class="p8">百度SEO推广</p>
                        </div>
                    </div>
                    <div class="eight">
                        <div class="index">
                            <div class="liubai4"></div>
                            <div class="photo"></div>
                            <p class="p6">互联网金融+电商</p>
                        </div>
                        <div class="admin">
                            <div class="liubai3"></div>
                            <div class="photo"></div>
                            <p class="p7">互联网金融+电商</p>
                            <p class="p8">金融网贷系统</p>
                            <p class="p8">基金存管/销售系统</p>
                            <p class="p8">供应链金融系统</p>
                            <p class="p8">产品+股权众筹系统</p>
                            <p class="p8">电商+金融系统</p>
                        </div>
                    </div>
                </div>
            </section>
            <div class="clear"></div>
        <!--十大产品系列-->
        <section id="section4" class="center-big section">
            <div class="liubai2"></div>
            <div class="big-font">
                <p class="p2">10</p>
                <p class="p3">十大产品体系</p>
                <div class="clear"></div>
                <p class="p4">精准定位</p>
                <p class="p5">多维度解析</p>
            </div>
            <div class="clear"></div>
            <div class="tb">
                <div class="t1">
                    <div class="photo"></div>
                    <p class="p9">P2P网贷系统</p>
                </div>
                <div class="t2">
                    <div class="photo"></div>
                    <p class="p9">网贷基金存管系统</p>
                </div>
                <div class="t3">
                    <div class="photo"></div>
                    <p class="p9">众筹系统</p>
                </div>
                <div class="t4">
                    <div class="photo"></div>
                    <p class="p9">股票资管系统</p>
                </div>
                <div class="t5">
                    <div class="photo"></div>
                    <p class="p9">供应链金融系统</p>
                </div>
                <div class="t6">
                    <div class="photo"></div>
                    <p class="p9">电子基金销售系统</p>
                </div>
                <div class="t7">
                    <div class="photo"></div>
                    <p class="p9">金融理财超市系统</p>
                </div>
                <div class="t8">
                    <div class="photo"></div>
                    <p class="p9">消费金融系统</p>
                </div>
                <div class="t9">
                    <div class="photo"></div>
                    <p class="p9">推广利器-贷易推</p>
                </div>
                <div class="t10">
                    <div class="photo"></div>
                    <p class="p9">旅游</p>
                </div>
            </div>
        </section>
        <div class="clear"></div>

        <!--为什么选择我们-->
        <section id="section5" class="center-why section">
            <div class="liubai2"></div>
            <div class="big-font">
                <p class="p2">选择</p>
                <p class="p3">为什么选择我们</p>
                <div class="clear"></div>
                <p class="p4">精英研发团队倾力打造</p>
                <p class="p5">为宁提供最佳互联网金融方案</p>
            </div>
            <div class="clear"></div>
            <div class="tp">
                <div class="tp1">
                    <img class="imga" src="static/img/center_tp1.png">
                    <div class="tp1-1"></div>
                </div>
                <div class="tp2">
                    <img class="imga" src="static/img/center_tp2.png">
                    <div class="tp2-1">
                        <div class="ttt">
                            <p class="p10">网贷软件行业</p>
                            <p class="p10">最具影响力品牌</p>
                        </div>
                        <div class="ppp">
                            <p class="p11">七年沉淀，绿麻雀获得</p>
                            <p class="p11"><2014年度尊华奖></p>
                        </div>
                    </div>
                </div>
                <div class="tp2">
                    <img class="imga" src="static/img/center_tp3.png">
                    <div class="tp2-1">
                            <div class="ttt">
                                    <p class="p10">网贷软件行业</p>
                                    <p class="p10">最具影响力品牌</p>
                                </div>
                                <div class="ppp">
                                    <p class="p11">七年沉淀，绿麻雀获得</p>
                                    <p class="p11"><2014年度尊华奖></p>
                                </div>
                    </div>
                </div>
                <div class="tp2">
                    <img class="imga" src="static/img/center_tp4.png">
                    <div class="tp2-1">
                            <div class="ttt">
                                    <p class="p10">网贷软件行业</p>
                                    <p class="p10">最具影响力品牌</p>
                                </div>
                                <div class="ppp">
                                    <p class="p11">七年沉淀，绿麻雀获得</p>
                                    <p class="p11"><2014年度尊华奖></p>
                                </div>
                    </div>
                </div>
                <div class="tp2">
                    <img class="imga" src="static/img/center_tp2.png">
                    <div class="tp2-1">
                            <div class="ttt">
                                    <p class="p10">网贷软件行业</p>
                                    <p class="p10">最具影响力品牌</p>
                                </div>
                                <div class="ppp">
                                    <p class="p11">七年沉淀，绿麻雀获得</p>
                                    <p class="p11"><2014年度尊华奖></p>
                                </div>
                    </div>
                </div>
                <div class="tp2">
                    <img class="imga" src="static/img/center_tp5.png">
                    <div class="tp2-1">
                            <div class="ttt">
                                    <p class="p10">网贷软件行业</p>
                                    <p class="p10">最具影响力品牌</p>
                                </div>
                                <div class="ppp">
                                    <p class="p11">七年沉淀，绿麻雀获得</p>
                                    <p class="p11"><2014年度尊华奖></p>
                                </div>
                    </div>
                </div>
                <div class="tp2">
                    <img class="imga" src="static/img/center_tp6.png">
                    <div class="tp2-1">
                            <div class="ttt">
                                    <p class="p10">网贷软件行业</p>
                                    <p class="p10">最具影响力品牌</p>
                                </div>
                                <div class="ppp">
                                    <p class="p11">七年沉淀，绿麻雀获得</p>
                                    <p class="p11"><2014年度尊华奖></p>
                                </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="clear"></div>

        <!--精英-->
        <section id="section6" class="center-jy section">
            <div class="liubai2"></div>


            <div class="bt">
                <p class="p1">7</p>
                <p class="p2">为什么选择我们</p>
                <p class="p3">100</p>
                <p class="p4">资深设计师工程师</p>
                <p class="p5">360</p>
                <p class="p30">金融系统全案分析</p>
                <div class="clear"></div>
                <p class="p31">专注互金研发,</p>
                <p class="p32">服务超1000家金融企业</p>
                <p class="p31">为客户提供一对一技术研发/</p>
                <p class="p32">/UI定制服务</p>
                <p class="p31">市场推广/定位分析</p>
                <p class="p32">需求分析部门设置</p>
            </div>

             <!--
            <div class="liubai5"></div>
            <div class="big-font">
                <p class="p2">7</p>
                <p class="p3">为什么选择我们</p>
                <div class="clear"></div>
                <p class="p4">专注互金研发</p>
                <p class="p5">服务超1000家金融企业</p>
            </div>
            <div class="big-font">
                <p class="p2">100</p>
                <p class="p3">资深设计师工程师</p>
                <div class="clear"></div>
                <p class="p4">为客户提供一对一技术研发</p>
                <p class="p5">UI定制服务</p>
            </div>
            <div class="big-font">
                <p class="p2">360</p>
                <p class="p3">金融系统全案分析</p>
                <div class="clear"></div>
                <p class="p4">市场推广/定位分析</p>
                <p class="p5">需求分析部门设置</p>
            </div>
            <div class="clear"></div>
            -->


            <div class="nr">
                <div class="liubai6"></div>
                <div class="one">
                    <img src="static/img/people1.png">
                    <p class="p12">RUSSELCROWE</p>
                    <p class="p13">我想所的话我想所的</p>
                    <p class="p13">话我想所的话我想所的话</p>
                    <p class="p13">我想所的话我想</p>
                    <p class="p13">所的话我想</p>
                    <p class="p13">所的话我想所的话</p>
                    <a href="#" class="a1">私信</a>
                </div>
                <div class="one">
                    <img src="static/img/people2.png">
                    <p class="p12">RUSSELCROWE</p>
                    <p class="p13">我想所的话我想所的</p>
                    <p class="p13">话我想所的话我想所的话</p>
                    <p class="p13">我想所的话我想</p>
                    <p class="p13">所的话我想</p>
                    <p class="p13">所的话我想所的话</p>
                    <a href="#" class="a1">私信</a>
                </div>
                <div class="one">
                    <img src="static/img/people3.png">
                    <p class="p12">RUSSELCROWE</p>
                    <p class="p13">我想所的话我想所的</p>
                    <p class="p13">话我想所的话我想所的话</p>
                    <p class="p13">我想所的话我想</p>
                    <p class="p13">所的话我想</p>
                    <p class="p13">所的话我想所的话</p>
                    <a href="#" class="a1">私信</a>
                </div>
                <div class="one">
                    <img src="static/img/people4.png">
                    <p class="p12">RUSSELCROWE</p>
                    <p class="p13">我想所的话我想所的</p>
                    <p class="p13">话我想所的话我想所的话</p>
                    <p class="p13">我想所的话我想</p>
                    <p class="p13">所的话我想</p>
                    <p class="p13">所的话我想所的话</p>
                    <a href="#" class="a1">私信</a>
                </div>
                <div class="one">
                    <img src="static/img/people5.png">
                    <p class="p12">RUSSELCROWE</p>
                    <p class="p13">我想所的话我想所的</p>
                    <p class="p13">话我想所的话我想所的话</p>
                    <p class="p13">我想所的话我想</p>
                    <p class="p13">所的话我想</p>
                    <p class="p13">所的话我想所的话</p>
                    <a href="#" class="a1">私信</a>
                </div>
            </div>
        </section>
        <div class="clear"></div>

         <!--新闻动态-->
         <section id="section7" class="center-new section">
            <div class="liubai2"></div>
            <div class="big-font">
                <p class="p2">NEWS</p>
                <p class="p3">新闻动态</p>
                <div class="clear"></div>
                <p class="p4">洞晓行业热点</p>
                <p class="p5">为您提供最新的互联网资讯信息</p>
            </div>
            <div class="clear"></div>
            <div class="nr">
                <div class="liubai7"></div>
                <div class="one">
                    <p class="p14">行业新闻</p>
                    <p class="p15">NEWS</p>
                </div>
                <div class="two"></div>
                <div class="three">
                    <div class="logo"></div>
                    <p class="p16" >公司新闻</p>
                    <p class="p17">NEWS</p>
                </div>
                <div class="four">
                    <div class="f1" id="f1">
                        <div class="index" id="f1i">
                            <div class="data">
                                <div class="tb1">
                                    <p class="p21"><%=str[5][0]%></p>
                                    <p class="p22">/<%=str[5][1]%></p>
                                </div>
                                <div class="tb2">
                                    <a class="a4">同样也在做着这些看起来很微小却能温暖且感动全世界的事</a>
                                </div>
                            </div>
                        </div>
                        <div class="admin" id="f1a">
                            <div class="time">
                                <div class="day">
                                    <p class="p18"><%=str[5][0]%></p>
                                </div>
                                <div class="hour">
                                    <p class="p19">/<%=str[5][1]%></p>
                                    <p class="p20"><%=str[5][2]%></p>
                                </div>
                            </div>
                            <div class="title">
                                <a class="a2"><%=str[5][3]%></a>
                                <div class="clear"></div>
                                <a class="a3"><%=str[5][4]%></a>
                            </div>
                        </div>
                    </div>
                    <div class="f2" id="f2">
                        <div class="index" id="f2i">
                                <div class="data">
                                        <div class="tb1">
                                            <p class="p21"><%=str[4][0]%></p>
                                            <p class="p22">/<%=str[4][1]%></p>
                                        </div>
                                        <div class="tb2">
                                            <a class="a4">同样也在做着这些看起来很微小却能温暖且感动全世界的事</a>
                                        </div>
                                    </div>
                        </div>
                        <div class="admin" id="f2a">
                                <div class="time">
                                        <div class="day">
                                            <p class="p18"><%=str[4][0]%></p>
                                        </div>
                                        <div class="hour">
                                            <p class="p19">/<%=str[4][1]%></p>
                                            <p class="p20"><%=str[4][2]%></p>
                                        </div>
                                    </div>
                                    <div class="title">
                                        <a class="a2"><%=str[4][3]%></a>
                                        <div class="clear"></div>
                                        <a class="a3"><%=str[4][4]%></a>
                                    </div>
                        </div>
                    </div>
                    <div class="f2" id="f3">
                        <div class="index" id="f3i">
                                <div class="data">
                                        <div class="tb1">
                                            <p class="p21"><%=str[3][0]%></p>
                                            <p class="p22"><%=str[3][1]%></p>
                                        </div>
                                        <div class="tb2">
                                            <a class="a4">同样也在做着这些看起来很微小却能温暖且感动全世界的事</a>
                                        </div>
                                    </div>
                        </div>
                        <div class="admin" id="f3a">
                                <div class="time">
                                        <div class="day">
                                            <p class="p18"><%=str[3][0]%></p>
                                        </div>
                                        <div class="hour">
                                            <p class="p19">/<%=str[3][1]%></p>
                                            <p class="p20"><%=str[3][2]%></p>
                                        </div>
                                    </div>
                                    <div class="title">
                                        <a class="a2"><%=str[3][3]%></a>
                                        <div class="clear"></div>
                                        <a class="a3"><%=str[3][4]%></a>
                                    </div>
                        </div>
                    </div>
                    <div class="f2" id="f4">
                        <div class="index" id="f4i">
                                <div class="data">
                                        <div class="tb1">
                                            <p class="p21"><%=str[2][0]%></p>
                                            <p class="p22">/<%=str[2][1]%></p>
                                        </div>
                                        <div class="tb2">
                                            <a class="a4">同样也在做着这些看起来很微小却能温暖且感动全世界的事</a>
                                        </div>
                                    </div>
                        </div>
                        <div class="admin" id="f4a">
                                <div class="time">
                                        <div class="day">
                                            <p class="p18"><%=str[2][0]%></p>
                                        </div>
                                        <div class="hour">
                                            <p class="p19">/<%=str[2][1]%></p>
                                            <p class="p20"><%=str[2][2]%></p>
                                        </div>
                                    </div>
                                    <div class="title">
                                        <a class="a2"><%=str[2][3]%></a>
                                        <div class="clear"></div>
                                        <a class="a3"><%=str[2][4]%></a>
                                    </div>
                        </div>
                    </div>
                    <div class="f2" id="f5">
                        <div class="index" id="f5i">
                                <div class="data">
                                        <div class="tb1">
                                            <p class="p21"><%=str[1][0]%></p>
                                            <p class="p22">/<%=str[1][1]%></p>
                                        </div>
                                        <div class="tb2">
                                            <a class="a4">同样也在做着这些看起来很微小却能温暖且感动全世界的事</a>
                                        </div>
                                    </div>
                        </div>
                        <div class="admin" id="f5a">
                                <div class="time">
                                        <div class="day">
                                            <p class="p18"><%=str[1][0]%></p>
                                        </div>
                                        <div class="hour">
                                            <p class="p19">/<%=str[1][1]%></p>
                                            <p class="p20"><%=str[1][2]%></p>
                                        </div>
                                    </div>
                                    <div class="title">
                                        <a class="a2"><%=str[1][3]%></a>
                                        <div class="clear"></div>
                                        <a class="a3"><%=str[1][4]%></a>
                                    </div>
                        </div>
                    </div>
                    <div class="f2" id="f6">
                        <div class="index" id="f6i">
                                <div class="data">
                                        <div class="tb1">
                                            <p class="p21"><%=str[0][0]%></p>
                                            <p class="p22">/<%=str[0][1]%></p>
                                        </div>
                                        <div class="tb2">
                                            <a class="a4">同样也在做着这些看起来很微小却能温暖且感动全世界的事</a>
                                        </div>
                                    </div>
                        </div>
                        <div class="admin" id="f6a">
                                <div class="time">
                                        <div class="day">
                                            <p class="p18"><%=str[0][0]%></p>
                                        </div>
                                        <div class="hour">
                                            <p class="p19">/<%=str[0][1]%></p>
                                            <p class="p20"><%=str[0][2]%></p>
                                        </div>
                                    </div>
                                    <div class="title">
                                        <a class="a2"><%=str[0][3]%></a>
                                        <div class="clear"></div>
                                        <a class="a3"><%=str[0][4]%></a>
                                    </div>
                        </div>
                    </div>
                </div>
                <div class="five">
                    <div class="photo"></div>
                    <div class="lianjie">
                        <div class="liubai8"></div>
                        <div class="yinsuo">
                            <p>01</p>
                        </div>
                        <a>【神马】今天广州街头惊现的5米大猴...... </a>
                        <div class="clear"></div>
                        <div class="yinsuo">
                            <p>02</p>
                        </div>
                        <a>【神马】今天广州街头惊现的5米大猴...... </a>
                        <div class="clear"></div>
                        <div class="yinsuo">
                            <p>03</p>
                        </div>
                        <a>【神马】今天广州街头惊现的5米大猴...... </a>
                        <div class="clear"></div>
                        <div class="yinsuo">
                            <p>04</p>
                        </div>
                        <a>【神马】今天广州街头惊现的5米大猴...... </a>
                    </div>
                </div>
            </div>
        </section>
         <div class="clear"></div>

        <!--客户案例-->
        <section id="section8" class="center-khal section">
            <div class="liubai2"></div>
            <div class="big-font">
                <p class="p2">CASES</p>
                <p class="p3">客户案例</p>
                <div class="clear"></div>
                <p class="p4">实现自身价值</p>
                <p class="p5"> 从零起步到行业领先携手成功客户</p>
            </div>
            <div class="liubai2"></div>
            <div class="clear"></div>
            <div class="nr">
                <div class="photo">
                    <img class="imga" src="static/img/khal1.png">
                    <div class="tp2-1"></div>
                </div>
                <div class="photo">
                        <img class="imga" src="static/img/khal1.png">
                        <div class="tp2-1"></div>
                </div>
                <div class="photo">
                        <img class="imga" src="static/img/khal1.png">
                        <div class="tp2-1"></div>
                </div>
                <div class="photo">
                        <img class="imga" src="static/img/khal1.png">
                        <div class="tp2-1"></div>
                </div>
                <div class="photo">
                        <img class="imga" src="static/img/khal1.png">
                        <div class="tp2-1"></div>
                </div>
                <div class="photo">
                        <img class="imga" src="static/img/khal1.png">
                        <div class="tp2-1"></div>
                </div>
                <div class="photo">
                        <img class="imga" src="static/img/khal1.png">
                        <div class="tp2-1"></div>
                </div>
                <div class="photo">
                        <img class="imga" src="static/img/khal1.png">
                        <div class="tp2-1"></div>
                </div>
                
            </div>
        </section>
        <div class="clear"></div>

        <!--底部地图-->
        <section id="section9" class="bottom section">
            <div class="nr">
                <div class="liubai9"></div>
                <p class="p23">联系我们</p>
                <p class="p24">售前工程师随时待命</p>
                <p class="p25">让我们为您提供金融解决方案</p>
                <div class="one">
                    <p class="p26">北京公司</p>
                    <p class="p27">XXXXXXXXXXXXXXXXXXXXXXX<br>XXXXXXXXXXXXXXXXXXX</p>
                    <p class="p28">xxx-xxx-xxxx</p>
                </div>
                <div class="one">
                    <p class="p26">上海公司</p>
                    <p class="p27">XXXXXXXXXXXXXXXXXXXXXXX<br>XXXXXXXXXXXXXXXXXXX</p>
                    <p class="p28">xxx-xxx-xxxx</p>
                </div>
                <div class="one">
                    <p class="p26">重庆公司</p>
                    <p class="p27">XXXXXXXXXXXXXXXXXXXXXXX<br>XXXXXXXXXXXXXXXXXXX</p>
                    <p class="p28">xxx-xxx-xxxx</p>
                </div>
                <div class="one">
                    <p class="p26">山东公司</p>
                    <p class="p27">XXXXXXXXXXXXXXXXXXXXXXX<br>XXXXXXXXXXXXXXXXXXX</p>
                    <p class="p28">xxx-xxx-xxxx</p>
                </div>

                <div class="liubai10"></div>
                <div class="lianjie">
                    <a href="#">关于绿麻雀</a>
                    <P>|</P>
                    <a href="#">联系我们</a>
                    <P>|</P>
                    <a href="#">常见问题</a>
                    <P>|</P>
                    <a href="#">公司招聘</a>
                    <P>|</P>
                    <a href="#">网站统计</a>
                </div>
            </div>
            <div class="zuihou">
                <div class="lb">
                    <ul>
                        <li>合作伙伴</li>
                        <li>掌帮网</li>
                        <li>财融天下</li>
                        <li>双乾支付</li>
                        <li>汇付天下</li>
                        <li>环迅支付</li>
                        <li>国付宝</li>
                        <li>非付</li>
                        <li>网贷点评网</li>
                        <li>360互联网完全</li>
                        <div class="clear"></div>
                        <li>Copyright 绿麻雀p2p网贷系统. 版权所有 绿麻雀(北京)科技有限公司</li>
                    </ul>
                </div>
            </div>
        </section>

        <script type="text/javascript">
                var h=window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
                $(window).scroll(function(){
                    var Yoffset=window.pageYOffset || document.documentElement.scrollTop;
                    if (Yoffset> 2* h) {
                        $("#arrow_up").fadeIn(100);
                    }else{
                        $("#arrow_up").fadeOut(100);
                    }
                });
                $("#arrow_up").bind("click",function(e){
                    e.preventDefault();
                    $("body").animate({"scrollTop":"0"},1000);

                });
            </script>
        <script type="text/javascript">
            $("#f2").hover(function(){
                $("#f1a").hide();
                $("#f1i").show();
                $("#f2i").hide();
                $("#f2a").show();
                $("#f1").css("height","40px")
                $("#f2").css("height","100px")
            },function(){
                $("#f1a").show();
                $("#f1i").hide();
                $("#f2i").show();
                $("#f2a").hide();
                $("#f1").css("height","100px")
                $("#f2").css("height","40px")
            });

            $("#f3").hover(function(){
                $("#f1a").hide();
                $("#f1i").show();
                $("#f3i").hide();
                $("#f3a").show();
                $("#f1").css("height","40px")
                $("#f3").css("height","100px")
            },function(){
                $("#f1a").show();
                $("#f1i").hide();
                $("#f3i").show();
                $("#f3a").hide();
                $("#f1").css("height","100px")
                $("#f3").css("height","40px")
            });

            $("#f4").hover(function(){
                $("#f1a").hide();
                $("#f1i").show();
                $("#f4i").hide();
                $("#f4a").show();
                $("#f1").css("height","40px")
                $("#f4").css("height","100px")
            },function(){
                $("#f1a").show();
                $("#f1i").hide();
                $("#f4i").show();
                $("#f4a").hide();
                $("#f1").css("height","100px")
                $("#f4").css("height","40px")
            });

            $("#f5").hover(function(){
                $("#f1a").hide();
                $("#f1i").show();
                $("#f5i").hide();
                $("#f5a").show();
                $("#f1").css("height","40px")
                $("#f5").css("height","100px")
            },function(){
                $("#f1a").show();
                $("#f1i").hide();
                $("#f5i").show();
                $("#f5a").hide();
                $("#f1").css("height","100px")
                $("#f5").css("height","40px")
            });

            $("#f6").hover(function(){
                $("#f1a").hide();
                $("#f1i").show();
                $("#f6i").hide();
                $("#f6a").show();
                $("#f1").css("height","40px")
                $("#f6").css("height","100px")
            },function(){
                $("#f1a").show();
                $("#f1i").hide();
                $("#f6i").show();
                $("#f6a").hide();
                $("#f1").css("height","100px");
                $("#f6").css("height","40px");
            });

            $(function()
            <%
                Boolean flag= (Boolean) request.getAttribute("flag");
                String name = (String) request.getAttribute("name");
                String id = (String) request.getAttribute("id");
                System.out.println(flag);
            %>
            {   var flag = <%=flag%>;
                var name = <%=name%>;
                var id = <%=id%>
                if(flag){
                    if(id)
                        alert("您的id是"+id);
                    $("#logins").hide();
                    $("#user").show();
                    $("#names").text("尊敬的 "+name+" 您好");

                }else{
                    if(flag!=null)
                        alert("密码错误或者尚未注册！");
                }
            });
            
            $("#sublime1").click(function () {
                var ps1 = $("#password1").val();
                var ps2 = $("#password2").val();
                if(ps1!=ps2){
                    alert("两次密码不同！")
                }
            })
        </script>

    </body>
