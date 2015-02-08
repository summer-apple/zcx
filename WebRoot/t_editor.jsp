<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>



<!DOCTYPE html>

<!--[if lt IE 7 ]><html class="ie ie6" lang="zh-CN"><![endif]-->

<!--[if IE 7 ]><html class="ie ie7" lang="zh-CN"><![endif]-->

<!--[if IE 8 ]><html class="ie ie8" lang="zh-CN"><![endif]-->

<!--[if (gte IE 9)|!(IE)]><html lang="zh-CN"><![endif]-->

<html lang="zh-CN">

<head>
<base href="<%=basePath%>">
<title>灌木丛 - 是谁来自山川湖海却囿于昼夜，厨房与爱。</title>



<meta name="keywords" content="" />

<meta name="description" content="" />

<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta http-equiv="X-UA-Compatible" content="IE=Edge">

<link rel="icon" type="image/x-icon" href="t/favicon.ico">

<link rel="alternate" type="application/rss+xml" title="灌木丛 &raquo; 未名评论Feed" href="http://localhost/wordpress/?feed=rss2&#038;page_id=8" />
<link rel='stylesheet' id='open-sans-css' href='//fonts.useso.com/css?family=Open+Sans%3A300italic%2C400italic%2C600italic%2C300%2C400%2C600&#038;ver=4.0.1' type='text/css' media='all' />
<link rel='stylesheet' id='bootstrap-css' href='bootstrap/css/bootstrap.min.css' type='text/css' media='all' />
<link rel='stylesheet' id='fontawesome-css' href='css/font-awesome.css' type='text/css' media='all' />
<link rel='stylesheet' id='flexslider-css' href='css/flexslider.css' type='text/css' media='all' />
<link rel='stylesheet' id='zan-css' href='css/zan.css' type='text/css' media='all' />
<link rel='stylesheet' id='custom-css' href='css/custom.css' type='text/css' media='all' />

<link href="css/t_editor.css" rel="stylesheet">


<script type='text/javascript' src='js/jquery-1.11.1.min.js'></script>


<script type='text/javascript' src='js/jquery-migrate.min.js'></script>

	
	<script src="js/jquery.hotkeys.js"></script>
    <script src="js/prettify.js"></script>
    <script src="js/bootstrap-wysiwyg.js"></script>
    
	
	



</head>

<body class="home page page-id-8 page-template-default logged-in">

	<%@ include file="t_head.jsp"%>
	
	<section id="zan-bodyer">
		<div class="container">
			<div class="row">
				<!-- 文本编辑模块开始 -->
				<div class="col-md-8" id="mainstay">
					<!-- 面包屑 -->
			       <!--  <div class="breadcrumb" id="zan-breadcrumb"></div> -->
			        <!-- 面包屑结束 -->
			        
			        <form action="ReleaseArticleServlet" method="post">
			        
					<!-- 标题栏开始 -->
					
						<input class="form-control" type="text" name="article_title" placeholder="文章标题..."> 
						<br>
					<!-- 标题栏结束 -->
					
					
					
					
					
					<!-- 工具条开始 -->
					<div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
					
						 <div class="btn-group">
				        	<a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="fa fa-font"></i><b class="caret"></b></a>
				          		<ul class="dropdown-menu">
				          		</ul>
				        </div>
				        <div class="btn-group">
					        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>
					         	<ul class="dropdown-menu">
						          <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
						          <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
						          <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
					          	</ul>
					   
					   </div>
					   <div class="btn-group">
					        <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="fa fa-bold"></i></a>
					        <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>
					        <!-- <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="fa fa-strikethrough"></i></a> -->
					        <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="fa fa-underline"></i></a>
					       
					        <!-- <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="fa fa-list-ul"></i></a> -->
					        <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="fa fa-list-ol"></i></a>
					        <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="fa fa-outdent"></i></a>
					        <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="fa fa-indent"></i></a>
					      
					        <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>
					        <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>
					        <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="fa fa-align-right"></i></a>
					        <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="fa fa-align-justify"></i></a>
					        <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="fa fa-file-image-o"></i></a>
					      </div>
					     <!--  <div class="btn-group">
					        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" /> 
				      	  </div> -->
      				<!-- 工具条结束 -->
      						
     					<!-- <form id="file-form" action="UploadArticleHeadServlet" enctype="multipart/form-data" method="post" style="display:none">
     						<input type="file" name="file" id="file" style="display:none">
     						<input type="submit" id="file-bt"  style="display:none">
     					</form> -->
     
					
					</div>
					
					<div id="editor">
					<br>
				      <c:if test="${!empty article_head_url }">
				      <div style="text-align: center;">
				      	<img src="${article_head_url }" style="max-width:90%;height:auto;">
				      </div>
				      <br>
				      </c:if>
				    </div>
				    <input name="article_context" id="article_context" type="text" hidden="true" value="">
				    <input name="article_head" type="text" hidden="true" value="${article_head_url }">
				    <br>
				    
				    <div class="row">
				    	<div class="col-md-8">
							<input class="form-control" type="text" name="article_tag" placeholder="文章标签..."> 
						</div>
						<div class="col-md-4">
							<select class="form-control select select-primary" name="article_type" data-toggle="select">
								<option value="Diary" selected>日 记</option>
					            <option value="Idea">创 意</option>
					            <option value="List">清 单</option>
					            <option value="Remember">记 录</option>
					            <option value="Travel">旅 行</option>
					            <option value="Reading">阅 读</option>
					          </select>
						</div>
			        </div>  
			           
				   	<br>
				    <input id="release_bt" class="btn btn-primary btn-lg btn-block" type="submit" value="发 布">
				    </form>
				</div>
				<!-- 文本编辑模块结束 -->
				<%@ include file="t_sidebar.jsp"%>
			</div>
		</div>
	</section>
	

	<%@ include file="t_foot.jsp"%>

	<div id="zan-gotop">
		<div class="gotop visible-lg">
			<i class="fa fa-chevron-up"></i>
		</div>
	</div>
	
	
	
<script>
  $(function(){
    function initToolbarBootstrapBindings() {
      var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
            'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
            'Times New Roman', 'Verdana'],
            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
      $.each(fonts, function (idx, fontName) {
          fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
      });
      $('a[title]').tooltip({container:'body'});
    	$('.dropdown-menu input').click(function() {return false;})
		    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
        .keydown('esc', function () {this.value='';$(this).change();});

      $('[data-role=magic-overlay]').each(function () { 
        var overlay = $(this), target = $(overlay.data('target')); 
        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
      });
      if ("onwebkitspeechchange"  in document.createElement("input")) {
        var editorOffset = $('#editor').offset();
        $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
      } else {
        $('#voiceBtn').hide();
      }
	};
	function showErrorAlert (reason, detail) {
		var msg='';
		if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
		else {
			console.log("error uploading file", reason, detail);
		}
		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
		 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
	};
    initToolbarBootstrapBindings();  
	$('#editor').wysiwyg({ fileUploadError: showErrorAlert} );
    window.prettyPrint && prettyPrint();
  });
</script>
	<script type='text/javascript' src='bootstrap/js/bootstrap.min.js'></script>
	<script type='text/javascript' src='js/jquery.flexslider.js'></script>
	<script type='text/javascript' src='js/jquery.validate.min.js'></script>
	<script type='text/javascript' src='js/audio.min.js'></script>
	<script type='text/javascript' src='js/shine.min.js'></script>
	<script type='text/javascript' src='js/jquery.lazyload.min.js'></script>
	<script type='text/javascript' src='js/zan.js'></script>
	<script type='text/javascript' src='js/custom.js'></script>
	<script type="text/javascript">
	
		jQuery(document).ready(function(e) {
            jQuery("#editor").blur(function(){
				jQuery("#article_context").val(jQuery(this).html());
				});
				
		/* 	jQuery("#pictureBtn").click(function(){
				jQuery("#file").click();
			});	
			
			jQuery("#file").change(function(){
				
				jQuery("#file-bt").click();
				
				jQuery.ajax({
					type:"POST",
					url:"GetArticleHeadUrlServlet",
					success:function(data) {
						jQuery("#editor").append("<img src='"+date+"'>");
					}
					}); 
			
					
			});	*/
				
				
				
				
			
        });
        
	</script>
</body>
</html>