<%@ page contentType = "text/html;charset=utf-8"%>
<%@ page import="func.*" %> 
<%@ page import="java.sql.*"%>
<%@include file="con.jsp"%>
<script src="./js/jquery.min.js"></script>
<!--%@ page language="java" import="conexao.*%>-->
 
    
<%
rs=st.executeQuery("select * from bj");
    rs.next();
    %>
 
<html lang="pt-br">
<title><%=rs.getString("nome")%></title>
    <head>
  <meta charset="UTF-8">
</head>
    <link href="https://fonts.googleapis.com/css?family=Lato:100" rel="stylesheet" type="text/css">
  <link rel="stylesheet" type="text/css" href="./css/stilo.css">
<%
BingoJob bng = new BingoJob();
%>
        <div class="container">
            <div class="content">
<div class="title">EnontrarVaga</div>
            <select value="Escolha" id="tipo" onchange="loadXMLDoc()">
   <%
rs=st.executeQuery("select tipo from empresa");
        while(rs.next()){
            out.println("<option>"+rs.getString("tipo")+"</option>");
        }


%>
                </select>
            </div>
        </div>
    <p id="texto">
        
    </p>
   </body>
</html>

<script>
    /*
$(document).ready(function(){
    $("#tipo").change(function(){
        alert($(this).val());
        var nome=$(this).val();
    $.get("EncontrarVagas.jsp",{nome:nome},function(info){
        $("#texto").html(info);
    });
        
    });
    
});
*/
 
    
    
function loadXMLDoc() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("texto").innerHTML =
      this.responseText;
    }
  };
  xhttp.open("GET", "EncontrarVagas.jsp", true);
  xhttp.send();
}
</script>



