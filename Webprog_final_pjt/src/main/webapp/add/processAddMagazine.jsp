<%@page import="java.util.UUID"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	String magazineID = UUID.randomUUID().toString();
	String magTitle = request.getParameter("magTitle");
	String magTag = request.getParameter("magTag");
	String magContent = request.getParameter("magContent");
	
    // 데이터베이스 연결 정보 설정
    String url = "jdbc:oracle:thin:@localhost:1521:xe"; // 데이터베이스 URL
    String uid = "C##JSP"; // 데이터베이스 사용자명
    String password = "JSP"; // 데이터베이스 비밀번호

    Connection conn = null;
    PreparedStatement pstmt = null;

    
    String sql = "INSERT INTO WRITEDATA VALUES (?, ?, ?, ?)";
    
    try {
        // Oracle JDBC 드라이버 로드
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 데이터베이스 연결
        conn = DriverManager.getConnection(url, uid, password);

        // SQL 삽입문 작성
        pstmt = conn.prepareStatement(sql);

        // 파라미터 설정
        pstmt.setString(1, magazineID);
        pstmt.setString(2, magTitle);
        pstmt.setString(3, magTag);
        pstmt.setString(4, magContent);

        // SQL 실행
        int result = pstmt.executeUpdate();
        
        if(result == 1){ // 성공
			response.sendRedirect("./successAddMag.jsp");
		} else{ // 실패
			/* response.sendRedirect("./failAddMag.jsp"); */
			System.out.println("데이터베이스와의 연결에 실패했습니다.");
		}
		
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
        /* if (rowsInserted > 0) {
            out.println("A new magazine record was inserted successfully!");
            response.sendRedirect("./successAddMag.jsp");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error occurred while connecting to the database or inserting data.");
    } finally {
        // 자원 해제
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    } */
%>
