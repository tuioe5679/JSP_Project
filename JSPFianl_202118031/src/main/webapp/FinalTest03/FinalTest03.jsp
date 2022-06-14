<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%!
 	String number = "202118031";
	String name = "������";
%>
<html>
	<head>
		<title>JSP �⸻��� 03����</title>
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
		<li><span class="accent">������ ����</span>
			<ul type="disc">
					<li>������ �й� : <%= number%></li>
					<li>������ ���� : <%= name%></li>
			</ul>
		</li><p>
		<li><span class="accent">�۾�ȯ�� ����</span>
			<ul type="square">
					<li>Server Name : <%=request.getServerName()%></li>
					<li>Server IP : <%=InetAddress.getLocalHost().getHostAddress()%></li>
					<li>Local Port : <%=request.getLocalPort()%></li>
					<li>Remote Port : <%=request.getRemotePort()%></li>
			</ul>
		</li><p>
		<li><span class="accent">�۾� ���� ��ġ</span>
			<ul>
				<li>
				<%=application.getRealPath("/JSPFinal_202118031")%>
				</li>
			</ul>
		</li><p>
		<li><span class="accent">�۾� ���� ��ġ�۾� ��ġ ����</span>
			<ul type="circle">
				<li>����ð� �� ��ġ : <div id="msg">�̰��� ��ġ ���� ���</div></li>
			</ul>
		</li>
		
	</ol>
	<script>
	if(!navigator.geolocation) alert("�������� ����");
	else // found() �ݹ� �Լ� ���
	
	navigator.geolocation.getCurrentPosition(found);
	
	function found(position) {
		var now = new Date(position.timestamp);
		var lat = position.coords.latitude; // ����
		var lon = position.coords.longitude; // �浵
		var acc = position.coords.accuracy; // ��Ȯ��
		
		lat = lat.toPrecision(6); lon = lon.toPrecision(6);
		
		var text = "���� �ð� " + now.toUTCString() + "<br>";
		text += "���� ��ġ (���� " + lat + "��, �浵 " + lon + "��)<br>";
		text += "��Ȯ�� " + acc + "m<br>";
		
		document.getElementById("msg").innerHTML = text;
	}	
</script>

</body>
</html>