<%@ page import="java.sql.*" %>
<%!

private static final String URL = "jdbc:postgresql://localhost:5432/db_java_j103_demo";
private static final String USER = "postgres";
private static final String PASS = "1234";

public static Connection getConnection() throws SQLException {
    try { 
        Class.forName("org.postgresql.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        throw new SQLException("PostgreSQL JDBC Driver not found", e.getMessage());
    }
}

%>