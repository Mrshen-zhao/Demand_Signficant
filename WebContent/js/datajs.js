function init(obj_1,val_1,obj_2,val_2){
	
	//定义默认数据
	var ar = ["请选则业务大类","请选择具体分类"];
	var pindex=0;
	//var cindex=0;
	
	//初始化
	$("<option value=''>"+ar[0]+"</option>").appendTo($("#"+obj_1));
	$("<option value=''>"+ar[1]+"</option>").appendTo($("#"+obj_2));
	
	
	//初始化obj_1
	for (i=0;i<mp.length;i++){
			if (mp[i]==val_1){
				pindex = i;
				$("<option >"+mp[i]+"</option>").appendTo($("#"+obj_1));
			}else{
				$("<option>"+mp[i]+"</option>").appendTo($("#"+obj_1));
				}
		}

	if (pindex!=0){
			for (n=1;n<mc[pindex].length+1;n++){
					if (mc[pindex][n-1]==val_2){
						cindex = n;
						$("<option >"+mc[pindex][n-1]+"</option>").appendTo($("#"+obj_2));
					}else{						
						$("<option>"+mc[pindex][n-1]+"</option>").appendTo($("#"+obj_2));
					}			
				}		
		}

	
		
		
	//响应obj_1的change事件	
	$("#"+obj_1).change(function(){
		//获取索引
		pindex = $("#"+obj_1).get(0).selectedIndex;
		//清空c和h
		$("#"+obj_2).empty();
		//重新给c填充内容
		$("<option>"+ar[1]+"</option>").appendTo($("#"+obj_2));
			if (pindex!=0){
				for (k=0;k<mc[pindex-1].length;k++){
					$("<option>"+mc[pindex-1][k]+"</option>").appendTo($("#"+obj_2));
				}
			}	
		//清空h
		
	});
	
	
	
}