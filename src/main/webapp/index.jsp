<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%
  // Retrieve the theme cookie
  String theme = "light"; // Default theme
  Cookie[] cookies = request.getCookies();
  if (cookies != null) {
    for (Cookie cookie : cookies) {
      if ("theme".equals(cookie.getName())) {
        theme = cookie.getValue();
        break;
      }
    }
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Theme Selector</title>
  <style>
    body.light { background-color: #ffffff; color: #000000; }
    body.dark { background-color: #000000; color: #ffffff; }
  </style>
</head>
<body class="<%= theme %>">
<h1>Welcome to Theme Selector</h1>
<p>Current Theme: <strong><%= theme %></strong></p>

<form action="theme-servlet" method="post">
  <label>
    <input type="radio" name="theme" value="light" <%= "light".equals(theme) ? "checked" : "" %>> Light Mode
  </label><br>
  <label>
    <input type="radio" name="theme" value="dark" <%= "dark".equals(theme) ? "checked" : "" %>> Dark Mode
  </label><br><br>
  <button type="submit">Save Theme</button>
</form>
</body>
</html>
