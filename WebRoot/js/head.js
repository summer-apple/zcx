// JavaScript Document

    	$().ready(function(e) {
			
			var a={};
			
///////////////////////////////////////////////////////////////////////////////////////////		
			
            $(".nav_item").click(function(){
				//nav item change
				$(this).parent().find("a").removeClass("item_active");
				$(this).find("a").addClass("item_active");
				});
				


				$(".user_head").parent().mouseover(function(){
					$(".user_opreation").show().mouseover(function(){
							$(this).show();
						});
					});
				$("header .user_head").parent().mouseout(function(){
					$(".user_opreation").hide().mouseout(function(){
							$(this).hide();
						});
					});

				
				//cart list
				
//				$(".cart").mouseover(function(){
//						$(".cart_list").show().mouseover(function(){
//								$(this).show();
//							});
//					}).mouseout(function(){
//						$(".cart_list").hide().mouseout(function(){
//								$(this).hide();
//							});
//						});
				
///////////////////////////////////////////////////////////////////////////////////////////			
//			var $cart_goods_count = $(".cart_goods_count_input");
//			
//			for(var i=0;i<$cart_goods_count.length;i++){
//				
//				var $hhh = parseInt($cart_goods_count.get(i).val());
//				
//				
//				if($hhh==1){
//					
//					$(this).parent().next(".minus").addClass("minus_nouse").removeClass("plus_minus:hover");
//					$(this).parent().next(".count_plus").bind({click:a.plus});	
//					$(this).parent().next(".count_plus").bind({click:a.oneGoodsAmount});		
//				}else{
//					alert("aaaaaaa");
//					$(this).parent().next(".count_minus").bind({click:a.minus});
//					$(this).parent().next(".count_minus").bind({click:a.oneGoodsAmount});
//					$(this).parent().next(".count_plus").bind({click:a.plus});	
//					$(this).parent().next(".count_plus").bind({click:a.oneGoodsAmount});		
//					}
//				
//				
//				}


			a.minus=function(){
				
				var $cart_goods_count_input=$(this).next(".cart_goods_count").find(".cart_goods_count_input");
					
					var $val_before=$cart_goods_count_input.val();//cart_goods_count -1
					$cart_goods_count_input.val($val_before-1);
					
					
					if($cart_goods_count_input.val()==1){//物品数量为1时，隐藏减号
						$(this).unbind({click:a.minus});
						$(this).unbind({click:a.oneGoodsAmount});
						$(this).css({"color":"#999999"});
						
						}
					
					
					
					var $goods_id=$(this).parent().find(".goods_id").val();
					var $cart_user=$(this).parent().find(".cart_user").val();
					
					$.ajax({
					type:"POST",
					url:"CartGoodsCountMinusServlet",
					data:{goods_id:$goods_id,cart_user:$cart_user}
					});
				}

			//a.change=function(){
//				$(this)=$(this).parent();
//					var $cart_goods_count_input=$(this).parent().find(".cart_goods_count_input");
//					
//					var $val_before=$cart_goods_count_input.val();//cart_goods_count +1
//					$cart_goods_count_input.val(parseInt($val_before));
//					
//					if($cart_goods_count_input.val()>=2){//物品数量大于时，显示减号
//						$(this).parent().find(".count_minus").css({"color":"#EC523F"}).bind({click:a.minus}).bind({click:a.amount});
//						
//						}
//					if($cart_goods_count_input.val()==1){//物品数量为1时，隐藏减号
//						$(this).unbind({click:a.minus});
//						$(this).unbind({click:a.oneGoodsAmount});
//						$(this).css({"color":"#999999"});
//						
//						}
//					
//					var $goods_id=$(this).parent().find(".goods_id").val();
//					var $cart_user=$(this).parent().find(".cart_user").val();
//					
//					$.ajax({
//					type:"POST",
//					url:"CartGoodsCountPlusServlet",
//					data:{goods_id:$goods_id,cart_user:$cart_user}
//					});
//				
//				
//				
//					var $cart_list = $(this).parents(".cart_list");//整个购物车
//					
//					var $cart_item = $(this).parents(".cart_item");//当前商店
//					
//					var $cart_store_amount = $(this).parents(".cart_item").find(".cart_store_amount");//当前商店总价
//					//alert($cart_store_amount.html());
//					
//					var $cart_goods_item = $(this).parents(".cart_item").find(".cart_goods_item");
//					
//					var $goods_price= $(this).siblings(".cart_goods_count").find(".goods_price").val();
//					//alert($goods_price);
//					
//					var $goods_count= parseInt($(this).siblings(".cart_goods_count").find(".cart_goods_count_input").val());
//					//alert($goods_count);
//					
//					var $one_goods_amount = parseFloat($goods_count*$goods_price);
//					
//					$(this).parent().find(".one_goods_amount").html($one_goods_amount.toFixed(2));//单个物品总价
//					//alert($one_goods_amount);
//					
//					
//					
//					
//					$store_amount_temp=0.00;
//					$cart_goods_item.each(function(index, element){
//						$store_amount_temp+=parseFloat($(this).find(".one_goods_amount").html());
//						});
//						
//					//alert($store_amount_temp);
//					$cart_store_amount.html($store_amount_temp.toFixed(2));//单个商店物品总价
//					
//					
//					
//					$cart_amount_temp=0.00;
//					$cart_list.find(".cart_item").each(function(index, element){
//							$cart_amount_temp += parseFloat($(this).find(".cart_store_amount").html());
//							//alert($cart_amount_temp);
//						});
//					
//					$(".total_amount").html("￥"+$cart_amount_temp.toFixed(2));//整个购物车总价
//				
//				
//				
//				
//				
//				
//				
//				
//				
//				}

			a.plus=function(){
					var $cart_goods_count_input=$(this).parent().find(".cart_goods_count_input");
					
					var $val_before=$cart_goods_count_input.val();//cart_goods_count +1
					$cart_goods_count_input.val(parseInt($val_before)+1);
					
					if($cart_goods_count_input.val()>=2){//物品数量大于时，显示减号
						$(this).parent().find(".count_minus").css({"color":"#EC523F"}).bind({click:a.minus}).bind({click:a.amount});
						
						}
					
					var $goods_id=$(this).parent().find(".goods_id").val();
					var $cart_user=$(this).parent().find(".cart_user").val();
					
					$.ajax({
					type:"POST",
					url:"CartGoodsCountPlusServlet",
					data:{goods_id:$goods_id,cart_user:$cart_user}
					});
				}
				
			a.amount=function(){
					
					var $cart_list = $(this).parents(".cart_list");//整个购物车
					
					var $cart_item = $(this).parents(".cart_item");//当前商店
					
					var $cart_store_amount = $(this).parents(".cart_item").find(".cart_store_amount");//当前商店总价
					//alert($cart_store_amount.html());
					
					var $cart_goods_item = $(this).parents(".cart_item").find(".cart_goods_item");
					
					var $goods_price= $(this).siblings(".cart_goods_count").find(".goods_price").val();
					//alert($goods_price);
					
					var $goods_count= parseInt($(this).siblings(".cart_goods_count").find(".cart_goods_count_input").val());
					//alert($goods_count);
					
					var $one_goods_amount = parseFloat($goods_count*$goods_price);
					
					$(this).parent().find(".one_goods_amount").html($one_goods_amount.toFixed(2));//单个物品总价
					//alert($one_goods_amount);
					
					
					
					
					$store_amount_temp=0.00;
					$cart_goods_item.each(function(index, element){
						$store_amount_temp+=parseFloat($(this).find(".one_goods_amount").html());
						});
						
					//alert($store_amount_temp);
					$cart_store_amount.html($store_amount_temp.toFixed(2));//单个商店物品总价
					
					
					
					$cart_amount_temp=0.00;
					$cart_list.find(".cart_item").each(function(index, element){
							$cart_amount_temp += parseFloat($(this).find(".cart_store_amount").html());
							//alert($cart_amount_temp);
						});
					
					$(".total_amount").html("￥"+$cart_amount_temp.toFixed(2));//整个购物车总价
				}	
			
		
	
		a.delete=function(){//删除按钮
					
					 
					if($(this).parent().siblings().length!=0){
						$(this).parent().remove();
						}else{
							$(this).parents(".cart_item").remove();
							
							}
					
				}		
			
			
	var $minus = $(".count_minus");
	var $plus = $(".count_plus");
	var $delete = $(".delete_goods");
	//var $cart_goods_count_input = $(".cart_goods_count_input");
	
	$minus.bind({click:a.minus}).bind({click:a.amount});
	//$cart_goods_count_input.bind({click:a.change});
	$plus.bind({click:a.plus}).bind({click:a.amount});
	$delete.bind({click:a.delete}).bind({click:a.amount});
	
	$minus.each(function(index, element) {
        if($(this).next(".cart_goods_count").find(".cart_goods_count_input").val()==1){
				$(this).css({"color":"#999999"}).unbind({click:a.minus}).unbind({click:a.amount});
				//$(this).next(".count_plus").bind({click:a.plus}).bind({click:a.amount});
		}else{
				
		}
    });
	
	
			
	var $first_cart_amount=0.00
	$(".cart_store_amount").each(function(index, element) {
        $first_cart_amount+=parseFloat($(this).html());
    });
			
	$(".total_amount").html("￥"+$first_cart_amount);	//页面加载时计算购物车总价
				
				
				
			
				
			$(".cart_goods_count_input").blur(function(){//检验是否为整数
						
							var $r = /^\+?[1-9][0-9]*$/;　　//正整数 
							
							var boo=$r.test($(this).val());
							
							if(boo==false){
								$(this).val(1);
								}
						});	
				
				
				
			
			
			
			
			
        });
