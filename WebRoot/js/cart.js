// JavaScript Document
$().ready(function(){
		var a={};
		a.minus = function(){
			var $cart_goods_count = $(this).siblings(".cart_goods_count");
			var $count = parseInt($cart_goods_count.val())-1;
			$cart_goods_count.val($count);
			
			var $cart_user = $(this).siblings(".cart_user").val();
			var $goods_id = $(this).siblings(".goods_id").val();
			var $goods_store = $(this).siblings(".goods_store").val();
			
			
		};
		
		a.plus = function(){
			var $cart_goods_count = $(this).siblings(".cart_goods_count");
			
			var $count = parseInt($cart_goods_count.val())+1;
			
			$cart_goods_count.val($count);
			
			var $cart_user = $(this).siblings(".cart_user").val();
			var $goods_id = $(this).siblings(".goods_id").val();
			var $goods_store = $(this).siblings(".goods_store").val();
	
			
		};
		
		a.change = function(){
			
			var $count = $(this).val();
			var $cart_user = $(this).siblings(".cart_user").val();
			var $goods_id = $(this).siblings(".goods_id").val();
			var $goods_store = $(this).siblings(".goods_store").val();
			
		};
		
		
		
		a.modify = function(){
			var $td_count = $(this).parent().siblings(".td_count");
			
			var $count = $td_count.find(".cart_goods_count").val();
			var $cart_user = $td_count.find(".cart_user").val();
			var $goods_id = $td_count.find(".goods_id").val();
			var $goods_store = $td_count.find(".goods_store").val();
			
			$.ajax({
					type:"POST",
					url:"ChangeCartServlet",
					data:{goods_id:$goods_id,cart_user:$cart_user,goods_store:$goods_store,cart_goods_count:$count}
					});
			
			};
		
		var $minus = $(".minus");
		var $plus = $(".plus");
		var $modify = $(".modify");
		var $delete = $(".delete");
		
		$minus.bind({click:a.minus});
		$plus.bind({click:a.plus});
		$modify.bind({click:a.modify});
		
		
		$modify.click(function(){
			
			$("table,header").addClass("blur");
			
			var $tip = $(".tip");
			var top = ($(window).height() - $tip.height())/2;  
        	var left = ($(window).width() - $tip.width())/2;  
       		var scrollTop = $(document).scrollTop();   
        	var scrollLeft = $(document).scrollLeft();   
			
        	$tip.css( { position : 'absolute', 'top' : top + scrollTop, left : left + scrollLeft } );
			
			$tip.fadeIn(750);
			});
		
		$(".tip_confirm").click(function(){
			var $tip = $(".tip");
			$tip.fadeOut(500);
			$("table,header").removeClass("blur");
		
		});
		
		
		
		
		$(".cart_goods_count").blur(function(){//检验是否为整数
			
			var $r = /^\+?[1-9][0-9]*$/;   //正整数 
			
			var boo=$r.test($(this).val());
			
			
			if(boo==false){
				$(this).val(1);
				};
			
			if($(this).val()<1){
				$(this).val(1);
			};
			
		
			
		});	
		
	});