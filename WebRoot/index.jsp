<%@ page language="java" import="java.util.*,com.zcx.bean.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>众彩行</title>
    	<meta name="description" content="">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/templatemo_misc.css">
        <link rel="stylesheet" href="css/templatemo_style.css">

        <script src="js/modernizr-2.6.1-respond-1.1.0.min.js"></script>
    </head>
    <body>

        <div class="site-main" id="sTop">
            <div class="site-header">
               <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="social-icons"><%User user = (User)request.getSession().getAttribute("user"); %>
                            <!--icon-1 -->
                            	<c:if test="${!empty user}">
                            		<c:if test="${user.user_store!=0}">
                                		<li><a rel="nofollow" href="GetStoreByIdServlet?store_id=${user.user_store}" class="fa fa-home" title="我的商店"></a></li>
                                	</c:if>
                                	<c:if test="${user.user_store==0}">
                                		<li><a rel="nofollow" href="register_store.jsp" class="fa fa-home" title="注册商店"></a></li>
                                	</c:if>
                                </c:if>
                                <c:if test="${empty user}">
                                	<li><a rel="nofollow" href="login.jsp" class="fa fa-home" title="点击登录"></a></li>
                                </c:if>   
                            <!--icon-2 -->
                             	<c:if test="${!empty user}">
                                	<li><a href="GetCartByUserServlet?user_id=${user.user_id}" class="fa fa-shopping-cart"  title="购物车"></a></li>
                                </c:if>
                                <c:if test="${empty user}">
                                	<li><a href="login.jsp" class="fa fa-shopping-cart"  title="点击登录"></a></li>
                                </c:if>
                            	
                            <!--icon-3 -->
                               	<c:if test="${!empty user}">
                                	<li><a href="upload_user_head.jsp" class="fa fa-gears"  title="修改信息"></a></li>
                                </c:if>
                                <c:if test="${empty user}">
                                	<li><a href="login.jsp" class="fa fa-star"  title="点击登录"></a></li>
                                </c:if>  
                            <!--icon-4 -->     
                               
                                	<li><a href="GetRandomArticleServlet" class="fa fa-comments"  title="进入社区"></a></li>
                             
                            <!--icon-5 -->     
                                
                               	<c:if test="${!empty user}">
                                	<li><a href="LogoutServlet" class="fa fa-ban"  title="点击登出"></a></li>
                                </c:if> 
                               
                                
                            </ul>
                        </div> <!-- /.col-md-12 -->
                    </div> <!-- /.row -->
                </div> <!-- /.container -->
                <div class="main-header">
                    <div class="container">
                        <div id="menu-wrapper">
                            <div class="row">
                                <div class="logo-wrapper col-md-4 col-sm-2 col-xs-8">
                                    <h1>
                                        <a href="index.jsp">众彩行</a>
                                    </h1>
                                </div> <!-- /.logo-wrapper -->
                                <div class="col-md-8 col-sm-10 col-xs-4 main-menu text-right">
                                    <ul class="menu-first hidden-sm hidden-xs">
                                        <li class="active"><a href="#">主题</a></li>
                                        <li><a href="#portfolio">推荐</a></li>
                                        <li><a href="#services">分类</a></li>
                                        <li><a href="#our-team">旺铺</a></li>
                                        <li>
                                        	<form action="SearchServlet" method="post">
                                            	 <input type="search" placeholder="商家、商品">
												<input type="submit" hidden="true">
                                          </form>
                                        </li>
                                        <c:if test="${!empty user}">
                                        	<li>
                                        		<a href="#">
                                        			<img src="${user.user_head}" alt="${user.user_name}" class="img-circle user_head">
                                        		</a>
                                        	</li>
                                         </c:if>
                                         <c:if test="${empty user}">
                                         	<li>
                                         		<a href="login.jsp">
                                         			<img  src="img/head/default.png" alt="No Loging" class="img-circle user_head">
                                         		</a>
                                        	</li>
                                        </c:if>
                                    </ul>
                                    <a href="#" class="toggle-menu visible-sm visible-xs"><i class="fa fa-bars"></i></a>
                                </div> <!-- /.main-menu -->
                            </div> <!-- /.row -->
                        </div> <!-- /#menu-wrapper -->
                        <div class="menu-responsive hidden-md hidden-lg">
                            <ul>
                                <li class="active"><a href="index.jsp">主页</a></li>
                                <li><a href="#portfolio">推荐</a></li>
                                <li><a href="#services">分类</a></li>
                                <li><a href="#our-team">旺铺</a></li>
                                <li>
                                	<form action="SearchServlet" method="post">
                                        <input type="search" placeholder="商家、商品">
										<input type="submit" hidden="true">
                                    </form>
                                </li>
                                <c:if test="${!empty user}">
                                      <li><a href="#">
                                        	<img src="${user.user_head}" alt="${user.user_name}" class="img-circle user_head_mobile"></a>
                                      </li>
                                </c:if>
                                <c:if test="${empty user}">
                                      <li><a href="login.jsp">
                                        	<img  src="img/head/default.png" alt="No Loging" class="img-circle user_head_mobile"></a>
                                      </li>
                                </c:if>
                            </ul>
                        </div> <!-- /.menu-responsive -->
                    </div> <!-- /.container -->
                </div> <!-- /.main-header -->
            </div> <!-- /.site-header -->
            <div class="site-slider">
                <div class="slider">
                    <div class="flexslider">
                        <ul class="slides">
                            <li>
                                <div class="overlay"></div>
                                <img src="img/slide1.jpg" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2><c:if test="${!empty user}">${user.user_head}</c:if></h2>
                                    <p>Let us design your website</p>
                                    <a href="GetGoodsByIdServlet?goods_id=65" class="slider-btn">Responsive Template</a>
                                </div>
                            </li>
                            <li>
                                <div class="overlay"></div>
                                <img src="img/slide2.png" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>Responsive Template</h2>
                                    <p>Download and use it for your website</p>
                                    <a href="GetGoodsByIdServlet?goods_id=66" class="slider-btn">Go to Portfolio</a>
                                </div>
                            </li>
                            <li>
                                <div class="overlay"></div>
                                <img src="img/slide3.jpg" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>Professional Quality</h2>
                                    <p>New standard of web design and coding</p>
                                    <a href="GetGoodsByIdServlet?goods_id=72" class="slider-btn">Mobile Website</a>
                                </div>
                            </li>
                        </ul>
                    </div> <!-- /.flexslider -->
                </div> <!-- /.slider -->
            </div> <!-- /.site-slider -->
        </div> <!-- /.site-main -->


        <div class="content-section" id="portfolio">
            <div class="container">
                <div class="row">
                    <div class="heading-section col-md-12 text-center">
                        <h2>每日推荐</h2>
                        <p>WE SELECTED THE FINEST GOODS FOR YOU</div> <!-- /.heading-section -->
                </div> <!-- /.row -->
                <div class="row">
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="img/goods/16141222065125.jpg" alt="">
                            
                            <div class="portfolio-overlay">
                                <h3>甘肃潘苹果</h3>
                                <p>以“潘”之姓 冠苹果之名 无污染自然熟不打蜡</p>
                                <a href="GetGoodsByIdServlet?goods_id=67" data-rel="lightbox" class="expand">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="img/goods/16141222065237.jpg" alt="">
                            <div class="portfolio-overlay">
                                <h3>农夫山泉17.5度橙</h3>
                                <p>预售商品 第二批新鲜采摘后预计12月12日左右开始发货 不是好橙不出街 请亲耐心等待</p>
                                <a href="GetGoodsByIdServlet?goods_id=68" data-rel="lightbox" class="expand">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="img/goods/16141222065401.jpg" alt="">
                            <div class="portfolio-overlay">
                                <h3>泰国金枕头冷冻榴莲</h3>
                                <p>新鲜金枕头榴莲果肉，-45℃ 直接冷冻，无需食品添加剂，纯澈果味，让您安心享用</p>
                                <a href="GetGoodsByIdServlet?goods_id=69" data-rel="lightbox" class="expand">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="img/goods/16141222065437.jpg" alt="">
                           
                            <div class="portfolio-overlay">
                              <h3>云南蒙自特级甜石榴</h3>
                                <p>肥沃沙质土壤孕育果实汁多味甜，皮薄好剥，肉厚籽软，清甜好滋味</p>
                                <a href="GetGoodsByIdServlet?goods_id=70" data-rel="lightbox" class="expand">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="img/goods/16141222065525.jpg" alt="">
                            <div class="portfolio-overlay">
                                <h3>美国autumnred恐龙蛋</h3>
                                <p>【新品种首发 今年最后一批 肉质粉嫩】错过等明年</p>
                                <a href="GetGoodsByIdServlet?goods_id=71" data-rel="lightbox" class="expand">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="img/goods/16141222065607.jpg" alt="">
                            <div class="portfolio-overlay">
                                <h3>墨西哥牛油果，鳄梨</h3>
                                <p>【宝宝和孕妇的日常必备辅食】清淡的油脂香味 营养丰盛</p>
                                <a href="GetGoodsByIdServlet?goods_id=72" data-rel="lightbox" class="expand">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="img/goods/16141222065645.jpg" alt="">
                            <div class="portfolio-overlay">
                                <h3>菇 娘</h3>
                                <p>美味无需多言</p>
                                <a href="GetGoodsByIdServlet?goods_id=73" data-rel="lightbox" class="expand">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="img/goods/16141222065724.jpg" alt="">
                            <div class="portfolio-overlay">
                                <h3>美国无籽黑提</h3>
                                <p>脆嫩果肉与纯澈果汁交错，甜蜜滋味在舌尖起舞，带来美味沁心享受</p>
                                <a href="GetGoodsByIdServlet?goods_id=74" data-rel="lightbox" class="expand">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#portfolio -->


 <div class="content-section" id="services">
            <div class="container">
                <div class="row">
                    <div class="heading-section col-md-12 text-center">
                        <h2>分类筛选</h2>
                        <p>All the things you want in here</p>
                    </div> <!-- /.heading-section -->
                </div> <!-- /.row -->
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-1">
                            <div class="service-icon">
                            	
                                <i class="fa fa-file-code-o">浆果/仁果</i><!--分类图标-->
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                           			
                                <div class="inner-service">
                                <h3>浆果类</h3>
					        	<ul>                                
					            	<li><a href="#">草&nbsp;&nbsp;&nbsp;莓</a></li>
					                <li><a href="#">蓝&nbsp;&nbsp;&nbsp;莓</a></li>
					                <li><a href="#">黑&nbsp;&nbsp;&nbsp;莓</a></li>
					                <li><a href="#">桑&nbsp;&nbsp;&nbsp;葚</a></li>
					                <li><a href="#">葡&nbsp;&nbsp;&nbsp;萄</a></li>
					                <li><a href="#">青&nbsp;&nbsp;&nbsp;提</a></li>
					                <li><a href="#">红&nbsp;&nbsp;&nbsp;提</a></li>                                          
					            	<li><a href="#">覆盆子</a></li>                                         
					            	<li><a href="#">马奶子</a></li>                                         
					                <li><a href="#">全&nbsp;&nbsp;&nbsp;部</a></li>                                 
					        	</ul>
                  

								<h3>仁果类</h3>
					        	<ul>                                       
					        		<li><a href="#">苹&nbsp;&nbsp;&nbsp;果</a></li>                        
					            	<li><a href="#">蛇&nbsp;&nbsp;&nbsp;果</a></li>
					                <li><a href="#">沙&nbsp;&nbsp;&nbsp;果</a></li>
					                <li><a href="#">柿&nbsp;&nbsp;&nbsp;子</a></li>
					                <li><a href="#">山&nbsp;&nbsp;&nbsp;竹</a></li>
					                <li><a href="#">枇&nbsp;&nbsp;&nbsp;杷</a></li>
					                <li><a href="#">杨&nbsp;&nbsp;&nbsp;桃</a></li>
					                <li><a href="#">山&nbsp;&nbsp;&nbsp;楂</a></li>
					                <li><a href="#">白&nbsp;&nbsp;&nbsp;果</a></li>                          
					            	<li><a href="#">圣女果</a></li>                                       
					            	<li><a href="#">无花果</a></li>
					                <li><a href="#">罗汉果</a></li>
					                <li><a href="#">火龙果</a></li>
					                <li><a href="#">猕猴桃</a></li>
					                <li><a href="#">海棠果</a></li>                                  
					                <li><a href="#">全&nbsp;&nbsp;&nbsp;部</a></li>                                 
					        	</ul>
                                </div>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-2">
                            <div class="service-icon">
                                <i class="fa fa-paper-plane-o">核果/柑橘</i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                                
                                <div class="inner-service">
                                <h3>核果类</h3> 
					         	<ul>                             
					        		<li><a href="#">油&nbsp;&nbsp;&nbsp;桃</a></li>                                        
					            	<li><a href="#">李&nbsp;&nbsp;&nbsp;子</a></li>
					                <li><a href="#">樱&nbsp;&nbsp;&nbsp;桃</a></li>
					                <li><a href="#">梅&nbsp;&nbsp;&nbsp;子</a></li>
					                <li><a href="#">杨&nbsp;&nbsp;&nbsp;梅</a></li>
					                <li><a href="#">大&nbsp;&nbsp;&nbsp;枣</a></li>
					                <li><a href="#">蜜&nbsp;&nbsp;&nbsp;枣</a></li>
					                <li><a href="#">橄&nbsp;&nbsp;&nbsp;榄</a></li>                                       
					            	<li><a href="#">橄&nbsp;&nbsp;&nbsp;榄</a></li>
					                <li><a href="#">荔&nbsp;&nbsp;&nbsp;枝</a></li>
					                <li><a href="#">龙&nbsp;&nbsp;&nbsp;眼</a></li>
					                <li><a href="#">槟&nbsp;&nbsp;&nbsp;榔</a></li>
					                <li><a href="#">全&nbsp;&nbsp;&nbsp;部</a></li>                                 
					       	 	 </ul>
							 	 <h3>柑橘类</h3>
					       		 <ul>                                  
					        		<li><a href="#">蜜&nbsp;&nbsp;&nbsp;橘</a></li>                                         
					            	<li><a href="#">金&nbsp;&nbsp;&nbsp;橘</a></li>
					                <li><a href="#">蜜&nbsp;&nbsp;&nbsp;柑</a></li>
					                <li><a href="#">甜&nbsp;&nbsp;&nbsp;橙</a></li>
					                <li><a href="#">西&nbsp;&nbsp;&nbsp;柚</a></li>
					                <li><a href="#">柚&nbsp;&nbsp;&nbsp;子</a></li>
					                <li><a href="#">柠&nbsp;&nbsp;&nbsp;檬</a></li>
					                <li><a href="#">文&nbsp;&nbsp;&nbsp;旦</a></li>                                          
					            	<li><a href="#">莱&nbsp;&nbsp;&nbsp;姆</a></li>
					                <li><a href="#">砂糖橘</a></li>
					                <li><a href="#">葡萄柚</a></li>               
					        	</ul>
                                </div>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                                       <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-3">
                            <div class="service-icon">
                            	
                                <i class="fa fa-file-code-o">叶菜/果菜</i><!--分类图标-->
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                           			
                                <div class="inner-service">
                                 <h3>叶菜类</h3>
                                     <ul>
                                         <li><a href="#">白&nbsp;&nbsp;&nbsp;菜</a></li>
                                         <li><a href="#">青&nbsp;&nbsp;&nbsp;菜</a></li>
                                         <li><a href="#">韭&nbsp;&nbsp;&nbsp;菜</a></li>
                                         <li><a href="#">包&nbsp;&nbsp;&nbsp;菜</a></li>
                                         <li><a href="#">芹&nbsp;&nbsp;&nbsp;菜</a></li>
                                         <li><a href="#">蒜&nbsp;&nbsp;&nbsp;苗</a></li>
                                         <li><a href="#">香&nbsp;&nbsp;&nbsp;菜</a></li>
                                         <li><a href="#">菠&nbsp;&nbsp;&nbsp;菜</a></li>
                                         <li><a href="#">海&nbsp;&nbsp;&nbsp;带</a></li>
                                         <li><a href="#">油麦菜</a></li>
                                         <li><a href="#">黄秋葵</a></li>
                                         <li><a href="#">空心菜</a></li>
                                         <li><a href="#">马齿苋</a></li>
                                         <li><a href="#">龙须菜</a></li>
                                         <li><a href="#">全&nbsp;&nbsp;&nbsp;部</a></li>
                                     </ul>
                                 
                                 <h3>果菜类</h3>
                                     <ul>
                                        <li><a href="#">南&nbsp;&nbsp;&nbsp;瓜</a></li>
                                         <li><a href="#">冬&nbsp;&nbsp;&nbsp;瓜</a></li>
                                         <li><a href="#">苦&nbsp;&nbsp;&nbsp;瓜</a></li>
                                         <li><a href="#">黄&nbsp;&nbsp;&nbsp;瓜</a></li>
                                         <li><a href="#">青&nbsp;&nbsp;&nbsp;椒</a></li>
                                         <li><a href="#">玉&nbsp;&nbsp;&nbsp;米</a></li>
                                         <li><a href="#">芸&nbsp;&nbsp;&nbsp;豆</a></li>
                                         <li><a href="#">青&nbsp;&nbsp;&nbsp;豆</a></li>
                                         <li><a href="#">豌&nbsp;&nbsp;&nbsp;豆</a></li>
                                         <li><a href="#">茄&nbsp;&nbsp;&nbsp;子</a></li>
                                         <li><a href="#">番&nbsp;&nbsp;&nbsp;茄</a></li>
                                         <li><a href="#">朝天椒</a></li>
                                         <li><a href="#">西葫芦</a></li>
                                         <li><a href="#">佛手瓜</a></li>
                                         <li><a href="#">全&nbsp;&nbsp;&nbsp;部</a></li>
                                     </ul>
                                </div>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-4">
                            <div class="service-icon">
                                <i class="fa fa-flask">根茎/菌菇</i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                               <div class="inner-service">
                                 <h3>根茎类</h3>
								<ul>
									<li><a href="#">萝&nbsp;&nbsp;&nbsp;卜</a></li>                                         
						    		<li><a href="#">大&nbsp;&nbsp;&nbsp;蒜</a></li>                                        
						    		<li><a href="#">洋&nbsp;&nbsp;&nbsp;葱</a></li>                                         
					            	<li><a href="#">生&nbsp;&nbsp;&nbsp;姜</a></li>                                        
					            	<li><a href="#">蕨&nbsp;&nbsp;&nbsp;菜</a></li>                                         
					            	<li><a href="#">山&nbsp;&nbsp;&nbsp;药</a></li>                                         
					            	<li><a href="#">红&nbsp;&nbsp;&nbsp;薯</a></li>                                         
					            	<li><a href="#">莴&nbsp;&nbsp;&nbsp;笋</a></li>                                         
					            	<li><a href="#">茭&nbsp;&nbsp;&nbsp;白</a></li> 
					                <li><a href="#">山&nbsp;&nbsp;&nbsp;药</a></li>                                        
					            	<li><a href="#">红&nbsp;&nbsp;&nbsp;薯</a></li>                                         
					            	<li><a href="#">莴&nbsp;&nbsp;&nbsp;笋</a></li> 
					            	<li><a href="#">绿豆芽</a></li>                                       
					            	<li><a href="#">全&nbsp;&nbsp;&nbsp;部</a></li>                                             	                                
					       		</ul>         
					                                 
								<h3>菌菇类</h3>                              
								<ul>                                
					        		<li><a href="#">木&nbsp;&nbsp;&nbsp;耳</a></li>                                      
					            	<li><a href="#">银&nbsp;&nbsp;&nbsp;耳</a></li> 
					            	<li><a href="#">平&nbsp;&nbsp;&nbsp;菇</a></li>
					            	<li><a href="#">竹&nbsp;&nbsp;&nbsp;荪</a></li>
					            	<li><a href="#">口&nbsp;&nbsp;&nbsp;蘑</a></li>
					            	<li><a href="#">裙带菜 </a></li>
					            	<li><a href="#">杏鲍菇</a></li>                                        
					            	<li><a href="#">金针菇</a></li> 
					            	<li><a href="#">猴头菇</a></li>                                     
					            	<li><a href="#">茶树菇</a></li>                                         
					            	<li><a href="#">鱼腥草</a></li> 
					                <li><a href="#">全&nbsp;&nbsp;&nbsp;部</a></li>                                    
					        	</ul>

                                </div>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#services -->



        <div class="content-section" id="our-team">
            <div class="container">
                <div class="row">
                    <div class="heading-section col-md-12 text-center">
                        <h2>精品旺铺</h2>
                        <p>The best stores customers recommended</p>
                    </div> <!-- /.heading-section -->
                </div> <!-- /.row -->
                <div class="row">
                    <div class="team-member col-md-3 col-sm-6">
                        <div class="member-thumb">
                            <img src="img/member1.jpg" alt="">
                            <div class="team-overlay">
                                <h3>天天果园</h3>
                                <span>鲜果网购，天天果园</span>
                                <ul class="social">
                                    <li><a href="GetStoreByIdServlet?store_id=16" class="fa fa-paper-plane-o"></a></li>
                                   
                                </ul>
                            </div> <!-- /.team-overlay -->
                        </div> <!-- /.member-thumb -->
                    </div> <!-- /.team-member -->
                    <div class="team-member col-md-3 col-sm-6">
                        <div class="member-thumb">
                            <img src="img/member2.jpg" alt="">
                            <div class="team-overlay">
                                <h3>爱果生鲜</h3>
                                <span>一切都是鲜的味道</span>
                                <ul class="social">
                                    <li><a href="GetStoreByIdServlet?store_id=19" class="fa fa-paper-plane-o"></a></li>
                                </ul>
                            </div> <!-- /.team-overlay -->
                        </div> <!-- /.member-thumb -->
                    </div> <!-- /.team-member -->
                    <div class="team-member col-md-3 col-sm-6">
                        <div class="member-thumb">
                            <img src="img/member3.jpg" alt="">
                            <div class="team-overlay">
                                <h3>青木生蔬</h3>
                                <span>自然 青木 生食 蔬物</span>
                                <ul class="social">
                                     <li><a href="GetStoreByIdServlet?store_id=33" class="fa fa-paper-plane-o"></a></li>
                                </ul>
                            </div> <!-- /.team-overlay -->
                        </div> <!-- /.member-thumb -->
                    </div> <!-- /.team-member -->
                    <div class="team-member col-md-3 col-sm-6">
                        <div class="member-thumb">
                            <img src="img/member4.jpg" alt="">
                            <div class="team-overlay">
                                <h3>华农蔬果</h3>
                                <span>纯天然沃土培植</span>
                                <ul class="social">
                                     <li><a href="GetStoreByIdServlet?store_id=32" class="fa fa-paper-plane-o"></a></li>
                                </ul>
                            </div> <!-- /.team-overlay -->
                        </div> <!-- /.member-thumb -->
                    </div> <!-- /.team-member -->
                </div> <!-- /.row -->

                
            </div> <!-- /.container -->
        </div> <!-- /#our-team -->





            
        <div id="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-xs-12 text-left">
                        Copyright &copy; 2014.Zhongcaixing All rights reserved.
                    </div> <!-- /.text-center -->
                    <div class="col-md-4 hidden-xs text-right">
                        <a href="#top" id="go-top">Back to top</a>
                    </div> <!-- /.text-center -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#footer -->
        
        <script src="js/jquery-1.11.1.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.0.min.js"><\/script>')</script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>


        <!-- Google Map -->
        <script src="js/jquery.gmap3.min.js"></script>
        
        <!-- Google Map Init-->
        <script type="text/javascript">
            jQuery(function($){
                $('#map_canvas').gmap3({
                    marker:{
                        address: '16.8496189,96.1288854' 
                    },
                        map:{
                        options:{
                        zoom: 15,
                        scrollwheel: false,
                        streetViewControl : true
                        }
                    }
                });
            });
        </script>

</body>
</html>
