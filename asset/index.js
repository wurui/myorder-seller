define(['oxjs'], function (OXJS) {

    
    return {

        init: function ($mod) {

            //<a href="http://pay.openxsl.com/p/pay/refund?out_trade_no={_id}">退款</a>
            $mod.on('click','[data-action]',function(e){
            	var tar=e.target;
            	var action=tar.getAttribute('data-action');
            	var order_id=tar.parentNode.getAttribute('data-id');
            	
            	switch(action){
            		case 'accept':
	            		tar.setAttribute('disabled','disabled');
		    			$mod.OXPut({
		    				orders:{
		    					_id:order_id,
		    					
		    					$updater:'accept'
		    				}
		    			},function(r){
		    				var result=r && r[0]
		                    if(result.error){
		                        OXJS.toast('提交失败：'+result.error)
		                    }else{
		                    	$mod.OXRefresh();	
		                    }
		    			})
            		break;
            		case 'refund':
	            		if(confirm('确认退款')){
	            			$mod.OXPut({
			    				orders:{
			    					_id:order_id,
			    					$updater:'refundaccept'
			    				}
			    			},function(r){
			    				var result=r && r[0]
			                    if(result.error){
			                        OXJS.toast('提交失败：'+result.error)
			                    }else{
			                    	//$mod.OXRefresh();	
			                    	location.href='http://pay.openxsl.com/p/pay/refund?out_trade_no='+order_id;
			                    }
			    			});
		            	}
	            		break
            	}
            })
        }
    }
})
