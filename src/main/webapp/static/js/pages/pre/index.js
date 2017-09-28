$(function(){
});

function loginOut(){
	location.href = '${pageContext.request.contextPath}/';
}
function showAllWeather(){
	$("#showWeatherDetail").modal("show");
}
