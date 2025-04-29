<div>Using JS</div>

<%
String name = request.getParameter("name");
String age = request.getParameter("age");
%>

<script>
    alert("Hello <%= name %>, you are <%= age %> years old");
</script>