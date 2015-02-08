// JavaScript Document
$().ready(function(e) {
	
	var a={};
	
    $(".add_to_cart_bt").click(function(){
		
    	
    	$("table,header").addClass("blur");
		
		var $tip = $(".tip");
		var top = ($(window).height() - $tip.height())/2;  
    	var left = ($(window).width() - $tip.width())/2;  
   		var scrollTop = $(document).scrollTop();   
    	var scrollLeft = $(document).scrollLeft();   
		
    	$tip.css( { position : 'absolute', 'top' : top + scrollTop, left : left + scrollLeft } );
    	
		$(".tip").fadeIn(750);
		
		
		
		
		
		
		
		var $goods_id=$(".goods_id").val();
		
		var $cart_user=$(".cart_user").val();
		
		var $goods_store=$(".goods_store").val();
		
		var $cart_goods_count=$(".goods_count_input").val();
		
		$.ajax({
			type:"POST",
			url:"ChangeCartServlet",
			data:{goods_id:$goods_id,cart_user:$cart_user,goods_store:$goods_store,cart_goods_count:$cart_goods_count}
			//data:{goods_id:1,cart_user:2,goods_store:3,cart_goods_count:4}
			//data:{goods_id:parseInt($goods_id),cart_user:parseInt($cart_user),goods_store:parseInt($goods_store),cart_goods_count:parseInt($cart_goods_count)}
			});
	
		});
    
    

    $(".add_to_cart_bt_nouser").click(function(){
		
		location.href="login.jsp";
	
		});
		
	$(".tip_confirm").click(function(){
		$(".tip").fadeOut(500);
		$("table,header").removeClass("blur");
		
		});
		
		
		
	$(".buy_now_bt").click(function(){
		
		var $goods_id=$(".goods_id").val();
		
		var $cart_user=$(".cart_user").val();
		
		var $goods_store=$(".goods_store").val();
		
		var $cart_goods_count=$(".goods_count_input").val();
		
		$.ajax({
			
			type:"POST",
			url:"BuyNowServlet",
			data:{goods_id:$goods_id,cart_user:$cart_user,goods_store:$goods_store,cart_goods_count:$cart_goods_count}
			});
			location.href="GetOrderByUserServlet";
		});	
		
	
	
	
	
	$(".goods_count_input").blur(function(){//检验是否为整数
		
		var $r = /^\+?[1-9][0-9]*$/;   //正整数 
		
		var boo=$r.test($(this).val());
		
		var $goods_count =$(".goods_count").val();
		
		if(boo==false){
			$(this).val(1);
			};
		
		if($(this).val()<1){
			$(this).val(1);
		};
		
		if($(this).val()>$goods_count){
			$(this).val($goods_count);
		};
		
	});	
	
	
	
});