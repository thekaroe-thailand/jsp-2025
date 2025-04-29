<div>Using Cookie</div>

<%

Cookie cookie = new Cookie("name", "kob");
cookie.setMaxAge(3600);

response.addCookie(cookie);
%>