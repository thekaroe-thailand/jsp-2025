<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="db.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Edit Book</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="p-8 bg-gray-50">
        <div class="max-w-4xl mx-auto">
            <h1 class="text-2xl font-bold mb-6">Edit Book</h1>

            <% 
            try (
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM tb_book WHERE id = ?");
            ) {
                ps.setInt(1, Integer.parseInt(request.getParameter("id")));
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
            %>
            <div class="bg-white p-6 rounded-lg shadow-md">
                <form action="book_action.jsp" method="post" class="space-y-4">
                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>" />

                    <div>
                        <label class="block mb-2">Book Name</label>
                        <input type="text" name="name" required
                            value="<%= rs.getString("name") %>"
                            class="w-full border p-2 rounded" />
                    </div>

                    <div>
                        <label class="block mb-2">Price</label>
                        <input type="number" name="price" required
                            value="<%= rs.getInt("price") %>" 
                            class="w-full border p-2 rounded" />
                    </div>

                    <div class="flex space-x-4">
                        <button type="submit" name="action" value="update"
                            class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                            Update Book 
                        </button>
                        <a href="book_list.jsp"
                            class="bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600">
                            Cancel
                        </a>
                    </div>
                </form>
            </div>
            <%
                }
            } catch (SQLException e) {
                out.println("Error: " + e.getMessage());
            }
            %>
        </div>
    </body>
</html>