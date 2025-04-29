<div>If Else</div>
<form action="ifElse.jsp" method="post">
    <input type="text" name="age" placeholder="Age" />
    <input type="submit" value="Submit" />
</form>

<%

if (request.getParameter("age") != null) {
    int age = Integer.parseInt(request.getParameter("age"));

    if (age >= 10) {
        out.println("You are an adult");
    } else {
        out.println("You are not adult");
    }
}

%>