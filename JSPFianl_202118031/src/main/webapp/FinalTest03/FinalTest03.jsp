<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%!
 	String number = "202118031";
	String name = "배이한";
%>
<html>
	<head>
		<title>JSP 기말고사 03문제</title>
		<style>
				ol {
					list-style:none;
					font-size: 18px;
				}
				ul {
					list-style-type : none;
				}
				li {
					border: 1px solid #222;
					padding: 10px 20px;
					margin: 2px;
				}
				.accent{
					font-size : 20px;
					font-weight : bold;
				}
		</style>
	</head>
<body>
	<ol>
		<li><span class="accent">제출자 정보</span>
			<ul type="disc">
					<li>제출자 학번 : <%= number%></li>
					<li>제출자 성명 : <%= name%></li>
			</ul>
		</li><p>
		<li><span class="accent">작업환경 정보</span>
			<ul type="square">
					<li>Server Name : <%=request.getServerName()%></li>
					<li>Server IP : <%=InetAddress.getLocalHost().getHostAddress()%></li>
					<li>Local Port : <%=request.getLocalPort()%></li>
					<li>Remote Port : <%=request.getRemotePort()%></li>
			</ul>
		</li><p>
		<li><span class="accent">작업 폴더 위치</span>
			<ul>
				<li>
				<%=application.getRealPath("/JSPFinal_202118031")%>
				</li>
			</ul>
		</li><p>
		<li><span class="accent">작업 폴더 위치작업 위치 정보</span>
			<ul type="circle">
				<li>현재시간 및 위치 : <div id="msg">이곳에 위치 정보 출력</div></li>
			</ul>
		</li>
		
	</ol>
	<script>
	if(!navigator.geolocation) alert("지원하지 않음");
	else // found() 콜백 함수 등록
	
	navigator.geolocation.getCurrentPosition(found);
	
	function found(position) {
		var now = new Date(position.timestamp);
		var lat = position.coords.latitude; // 위도
		var lon = position.coords.longitude; // 경도
		var acc = position.coords.accuracy; // 정확도
		
		lat = lat.toPrecision(6); lon = lon.toPrecision(6);
		
		var text = "현재 시간 " + now.toUTCString() + "<br>";
		text += "현재 위치 (위도 " + lat + "°, 경도 " + lon + "°)<br>";
		text += "정확도 " + acc + "m<br>";
		
		document.getElementById("msg").innerHTML = text;
	}	
</script>

</body>
</html>