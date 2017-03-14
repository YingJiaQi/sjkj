//对象转json
function conveterParamsToJson(paramsAndValues) {  
	paramsAndValues = paramsAndValues.replace(/\+/g," ");   //
	paramsAndValues = decodeURIComponent(paramsAndValues);
	
    var jsonObj = {};  
    var param = paramsAndValues.split("&");  
    for ( var i = 0; param != null && i < param.length; i++) {  
        var para = param[i].split("=");  
        jsonObj[para[0]] = para[1];  
    }  
  
    return jsonObj;  
} 
/**
*easyui校验方法扩展
*/
$.extend($.fn.validatebox.defaults.rules, {
	multiple: {
		validator: function(value, vtypes) {
			var returnFlag = true;
			var opts = $.fn.validatebox.defaults;
			for(var i = 0; i < vtypes.length; i++) {
				var methodinfo = /([a-zA-Z_]+)(.*)/.exec(vtypes[i]);
				var rule = opts.rules[methodinfo[1]];
				if(value && rule) {
					var parame = eval(methodinfo[2]);
					if(!rule["validator"](value, parame)) {
						returnFlag = false;
						this.message = rule.message;
						break;
					}
				}
			}
			return returnFlag;
		}
	},
	minLength: {
		validator: function(value, param) {
			return value.length >= param[0];
		},
		message: '请至少输入(2)个字符.'
	},
	equals: {
		validator: function(value, param) {
			return value.length == param[0];
		},
		message: '长度必须为(2)个字符.'
	},
	RegeMatch: {
		validator: function(value, param) {
			var pattern = new RegExp("[~'!@#$%^&*()-+_=:]");
			return !pattern.test(value);
		},
		message: '非法字符.'
	},
	phone: {
        // 验证手机号码
        validator: function (value) {
            return /^(13|15|18)\d{9}$/i.test(value); //这里就是一个正则表达式
        },
        message: '手机号码格式不正确'           //这里是错误后的提示信息
    },
})
/**
 * easyui-datebox修改默认样式
 * @param date
 * @returns {String}
 */
function yStyle(date){  
    var y = date.getFullYear();  
    var m = date.getMonth()+1;  
    var d = date.getDate();  
    return  y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);  
}  
function yDate(s){
   var t = Date.parse(s);
   if (!isNaN(t)){
    return new Date(t);
   } else {
    return new Date();
   }
}  