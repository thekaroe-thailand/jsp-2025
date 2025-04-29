<%

Cookie[] cookies = request.getCookies();

if (cookies != null) {
    for (Cookie cookie : cookies) {
        out.println(cookie.getName() + ":" + cookie.getValue());
    }
}

%>