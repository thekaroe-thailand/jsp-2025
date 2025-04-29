<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="db.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Book Management</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="p-8 bg-gray-50">
        <div class="max-w-4xl mx-auto">
            <h1 class="text-2xl font-bold mb-6">Book Management</h1>

            <% if (request.getParameter("msg") != null) { %>
                <div class="bg-green-100 text-green-700 p-4 rounded mb-4">
                    <%= request.getParameter("msg") %>
                </div>
            <% } %>

            <div class="bg-white p-6 rounded-lg shadow-md mb-8">
                <h2 class="text-xl font-semibold mb-4">Add New Book</h2>
                <form action="book_action.jsp" method="post" class="space-y-4">
                    <div>
                        <label class="block mb-2">Book Name</label>
                        <input type="text" name="name" required 
                            class="w-full border p-2 rounded" />
                    </div>
                    <div>
                        <label class="block mb-2">Price</label>
                        <input type="number" name="price" required
                            class="w-full border p-2 bounded" />
                    </div>
                    <button type="submit" name="action" value="insert"
                        class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                        Add Book
                    </button>
                </form>
            </div>

            <div class="bg-white p-6 rounded-lg shadow-md">
                <h2 class="text-xl font-semibold mb-4">Book List</h2>
                <table class="w-full">
                    <thead class="bg-gray-200">
                        <tr>
                            <th class="p-3 text-left">ID</th>
                            <th class="p-3 text-left">Name</th>
                            <th class="p-3 text-left">Price</th>
                            <th class="p-3 text-left">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        try (Connection conn = getConnection();
                            PreparedStatement ps = conn.prepareStatement("SELECT * FROM tb_book ORDER BY id");
                            ResultSet rs = ps.executeQuery()) {
                                while (rs.next()) {
                        %>
                        <tr class="border-t">
                            <td class="p-3"><%= rs.getInt("id") %></td>
                            <td class="p-3"><%= rs.getString("name") %></td>
                            <td class="p-3"><%= rs.getString("price") %></td>
                            <td class="p-3">
                                <a href="book_edit.jsp?id=<%= rs.getInt("id") %>"
                                    class="text-blue-500 hover:text-blue-700 mr-3">
                                    Edit
                                </a>
                                <form action="book_action.jsp" method="post" class="inline">
                                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                    <button type="submit" name="action" value="delete"
                                        class="text-red-500 hover:text-red-700"
                                        onclick="return confirm('Are you sure?')">
                                        Delete 
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <%
                                }
                            } catch (SQLException e) {
                                out.print("Error: " + e.getMessage());
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>