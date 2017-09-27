$(function(){
	$.ajax({
		type: "GET",
		url: "${pageContext.request.contextPath }/common/getWeatherForecast?city=1",
		success: function(jsonResult) {
			if(jsonResult.success == 'true') {
				window.location.href = "${pageContext.request.contextPath }/";
			} else {
				$("#verify").focus();
				$("#showWrongNews").css("display","block");
				$("#showWrongNews").html("<b style='color:red;'>"+jsonResult.msg+"</b>");
			}
		}
	});
});


function loginOut(){
	location.href = '${pageContext.request.contextPath}/';
}
