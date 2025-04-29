<div>
    <h1>Receive Variable</h1>
    <p>Name: ${param.name}</p>
    <p>Age: ${param.age}</p>
</div>

<div>Keep to variable in java code</div>
<%
String name = request.getParameter("name");
String age = request.getParameter("age");
%>

<p>Name: <%= name %></p>
<p>Age: <%= age %></p>