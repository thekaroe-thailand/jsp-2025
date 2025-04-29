<div>Using Session</div>

<%

session.setAttribute("name", "kob");
session.setAttribute("age", 20);

String name = (String) session.getAttribute("name");
Integer age = (Integer) session.getAttribute("age");

out.println(name);
out.println(age);

%>