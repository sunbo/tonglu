// The radio and checkbox sytle change
jQuery.fn.rbtCss=function(){
	var thisRbt=this;
	$(this).css("display","none");
	$(this).next().addClass("lblCss");
	var iptL=$(this).size();
	for(i=0;i<iptL;i++){
		if($(this)[i].checked==true){		
			$(this).eq(i).next().addClass("checked");
		}
		$(this).eq(i).next().click(function(){
			$(thisRbt).next().removeClass("checked");
			$(this).addClass("checked");
			$(this).prev()[0].checked=true;
		});
	}
};

jQuery.fn.chkCss=function(){
	var browser=$.browser.msie;
	var thisChk=this;
	$(this).css("display","none");
	$(this).next().addClass("chkLblCss");
	var chkL=$(this).size();
	for(i=0;i<chkL;i++){
		//alert($(this).eq(i).attr("checked"));
		if($(this)[i].checked){		
			$(this).eq(i).next().addClass("chked");
		}
		$(this).eq(i).next().click(function(){
			//$(thisChk).next().removeClass("chked");
			//alert($(this).prev()[0].checked);
			if($(this).prev()[0].checked){
				$(this).removeClass("chked");
				if(browser){
					$(this).prev()[0].checked=false;
				}
				//$(this).prev()[0].checked=false;
				//$(this).prev().attr("checked","checked");
			}
			else{
				$(this).addClass("chked");
				if(browser){
					$(this).prev()[0].checked=true;
				}
				//$(this).prev()[0].checked=true;
			}
		});
	}
};