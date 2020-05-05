<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*,java.util.*"%>
<link href="style.css" rel="stylesheet" type="text/css">
<div id="container">
	<%
		int id = Integer.parseInt(request.getParameter("kysymys_id"));
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaalikone", "root",
					"quan12952151");
			Statement st = conn.createStatement();
			int i = st.executeUpdate("DELETE FROM kysymykset WHERE kysymys_id=" + id);
			int p = st.executeUpdate("Delete from vastaukset where kysymys_id=" + id);
			out.println("Data Deleted Successfully!");
			response.sendRedirect("edit.jsp");
		} catch (Exception e) {
			System.out.print(e);
			e.printStackTrace();
		}
	%>
</div>
