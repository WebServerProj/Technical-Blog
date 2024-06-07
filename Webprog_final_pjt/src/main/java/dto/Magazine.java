package dto;

import java.io.InputStream;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

public class Magazine implements Serializable {
	private static final long serialVersionUID = 1L;

	private String magazineId; // 매거진 ID
	private String magTitle; // 매거진 제목
	private String magTag; // 태그
	private String magcontent; // 글 내용
	private String clientId; // 사용자 이름
	private String magFile; // 파일이름
	
	// sql문 선언
	String sql01 = "INSERT INTO WRITEDDATA (MAGAZINEID) VALUES(?)";
	String sql02 = "INSERT INTO WRITEDDATA (MAGTITLE) VALUES(?)";
	String sql03 = "INSERT INTO WRITEDDATA (MAGTAG) VALUES(?)";
	String sql04 = "INSERT INTO WRITEDDATA (MAGCONTENT) VALUES(?)";
	String sql05 = "INSERT INTO WRITEDDATA (CLIENTID) VALUES(?)";
	String sql06 = "INSERT INTO WRITEDDATA (MAGFILE) VALUES(?)";

	Connection conn = null;
	PreparedStatement pstmt = null;
	InputStream inputStream = null;

	public Magazine() {
		super();

		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe"; // 데이터베이스 URL
			String uid = "C##JSP"; // 데이터베이스 사용자명
			String password = "JSP"; // 데이터베이스 비밀번호

			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, uid, password);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * public Magazine(String magazineId, String magTitle, String magTag) {
	 * this.magazineId = magazineId; this.magTitle = magTitle; this.magTag = magTag;
	 * }
	 */

	public String getMagazineId() {
		return magazineId;
	}

	public void setMagazineId() throws SQLException {
		this.magazineId = UUID.randomUUID().toString();
		pstmt = conn.prepareStatement(sql01);
		pstmt.setString(1, magazineId);
	}

	public String getMagTitle() {
		return magTitle;
	}

	public void setMagTitle(String magTitle) throws SQLException {
		this.magTitle = magTitle;
		pstmt = conn.prepareStatement(sql02);
		pstmt.setString(1, magTitle);
	}

	public String getMagTag() {
		return magTag;
	}

	public void setMagTag(String magTag) throws SQLException {
		this.magTag = magTag;
		pstmt = conn.prepareStatement(sql03);
		pstmt.setString(1, magTag);
	}

	public String getMagcontent() {
		return magcontent;
	}

	public void setMagcontent(String magcontent) throws SQLException {
		this.magcontent = magcontent;
		pstmt = conn.prepareStatement(sql04);
		pstmt.setString(1, magcontent);
	}

	public String getClientId() {
		return clientId;
	}

	public void setClientId(String clientId) throws SQLException {
		this.clientId = clientId;
		pstmt = conn.prepareStatement(sql05);
		pstmt.setString(1, clientId);
	}

	public String getMagFile() {
		return magFile;
	}

	public void setMagFile(String magFile) throws SQLException {
		this.magFile = magFile;
		pstmt = conn.prepareStatement(sql06);
		pstmt.setString(1, magFile);
	}

}