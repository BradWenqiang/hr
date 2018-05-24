function getTree(data) {
	var tree = [
	/* {
	   text: "Parent 1",
	   icon: "glyphicon glyphicon-stop",
	   selectedIcon: "glyphicon glyphicon-stop",
	   nodes: [
	     {
	       text: "Child 1",
	       nodes: [
	         {
	           text: "Grandchild 1"
	         },
	         {
	           text: "Grandchild 2"
	         }
	       ]
	     },
	     {
	       text: "Child 2"
	     }
	   ]
	 },*/
	/* {
	   text: "Parent 2"
	 },
	 {
	   text: "Parent 3"
	 },
	 {
	   text: "Parent 4"
	 },*/
	{
		text : "无",
		href : "javascript:tetet()"
	} ];

	$.each(data, function(i, item) {
		//tree["text"]=item.name;
		//var node = '{"text:"'+item.name+"}";
		//alert(item.number);
		//var node = '{"text":"'+ item.name +     '"}';  
		var node = '{"text":"' + item.name + '"' + ','
				+ '"href":"javascript:selectList(' + '\''+item.number+'\''+ ')"}';
		//alert(node);
		obj = jQuery.parseJSON(node);
		tree[i] = obj;
		//alert(node);
		//alert(tree["text"]);
		//tree[i].text
	});
	return tree;
};

var getFormData = function(form) {
	var o = {};
	$.each(form.serializeArray(), function(index) {
		if (o[this['name']]) {
			o[this['name']] = o[this['name']] + "," + this['value'];
		} else {
			o[this['name']] = this['value'];
		}
	});
	return o;
}

//日期转换方法
//获得年月日      得到日期oTime  
function getMyDate(str) {
	var oDate = new Date(str), oYear = oDate.getFullYear(), oMonth = oDate
			.getMonth() + 1, oDay = oDate.getDate(), oTime = oYear + '-'
			+ getzf(oMonth) + '-' + getzf(oDay)  ;//最后拼接时间  
	return oTime;
};
//补0操作  
function getzf(num) {
	if (parseInt(num) < 10) {
		num = '0' + num;
	}
	return num;
}