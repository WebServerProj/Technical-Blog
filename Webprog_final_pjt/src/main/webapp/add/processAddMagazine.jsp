<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.UUID"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>

<%
//파일 처리르 위한 코드 (나중에 수정 예정)
String realFolder = "C:\\Users\\miso4\\git\\real\\Webprog_final_pjt\\src\\main\\webapp\\resources\\img";
int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
String encType = "utf-8"; //인코딩 타입

request.setCharacterEncoding("UTF-8");

//내컴퓨터로 파일을 저장하는 코드
MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

String magazineID = UUID.randomUUID().toString();
String magTitle = multi.getParameter("magTitle");
String magTag = multi.getParameter("magTag");
String magContent = multi.getParameter("magContent");
// cliId는 세션 정보에서 가져온 값
String clientId = (String) session.getAttribute("id");
String magFile = multi.getFilesystemName("file");

//파일의 이름을 바꾸는 코드 (magazineID로 변경)
File uploadedFile = multi.getFile("file"); // "file"은 클라이언트 폼에서 파일 input의 name 속성

// 데이터베이스 연결 정보 설정
String url = "jdbc:oracle:thin:@localhost:1521:xe"; // 데이터베이스 URL
String uid = "C##JSP"; // 데이터베이스 사용자명
String password = "JSP"; // 데이터베이스 비밀번호

Connection conn = null;
PreparedStatement pstmt = null;
InputStream inputStream = null;

// MEMBERS에서 고객아이디를 외래키로 가져오는 방식 추가 예정
String sql = "INSERT INTO WRITEDATA VALUES (?, ?, ?, ?, ?, ?)";

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
	pstmt.setString(5, clientId);
	pstmt.setString(6, magFile);

	//if (inputStream != null)
	//pstmt.setBlob(6, inputStream);

	// SQL 실행
	int result = pstmt.executeUpdate();

	if (result == 1) { // 성공
		response.sendRedirect("./successAddMag.jsp");
	} else { // 실패
		/* response.sendRedirect("./failAddMag.jsp"); */
		System.out.println("데이터베이스와의 연결에 실패했습니다.");
	}

} catch (Exception e) {
	e.printStackTrace();
} finally {
	try {
		if (conn != null)
	conn.close();
		if (pstmt != null)
	pstmt.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
%>
