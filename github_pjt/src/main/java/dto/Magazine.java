package dto;

import java.io.Serializable;

public class Magazine implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String magazineId; //매거진 ID
	private String writer;		//글쓴이
	private String description; //설명
	private String category; 	//카테고리
	private String writeDate;	//작성일
	private String filename;	//이미지
	private String title; //글 제목
	
	public Magazine() {
		super();
	}
	
	public Magazine(String magazineId, String title, String category) {
		this.magazineId = magazineId;
		this.title = title;
		this.category = category;
	}

	public String getMagazineId() {
		return magazineId;
	}

	public void setMagazineId(String magazineId) {
		this.magazineId = magazineId;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	
}