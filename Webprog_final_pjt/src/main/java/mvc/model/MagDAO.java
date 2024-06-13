package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.database.*;

public class MagDAO {

	private static MagDAO instance;

	private MagDAO() {
	}

	public static MagDAO getInstance() {
		if (instance == null)
			instance = new MagDAO();
		return instance;
	}

	// 데이터베이스에서 글 데이터 모두 가져오기 (Arraylist사용)
	public ArrayList<MagDTO> getMagList(String magid, String magtitle, String magtag, String magcon, String cliid,
			String magfile) {
		
		Connection conn  = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM WRITEDATA";

		ArrayList<MagDTO> maglist = new ArrayList<MagDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MagDTO mag = new MagDTO();
				mag.setMagazineid(magid);
				mag.setMagtitle(magtitle);
				mag.setMagtag(magtag);
				mag.setMagcontent(magcon);
				mag.setClientid(cliid);
				mag.setMagfile(magfile);
				maglist.add(mag);
			}

		} catch (Exception e) {
			System.out.println("데이터를 가져오는데 문제가 발생했습니다.(1번 함수)");
			e.printStackTrace();
		}

		return maglist;
	}

// 글 상세 페이지

// 글 수정

// 글 삭제

// 로그인

// 회원가입

// 회원정보 수정

// 검색

// 댓글? 가능할까?

}
