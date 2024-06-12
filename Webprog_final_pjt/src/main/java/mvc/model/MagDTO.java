package mvc.model;

public class MagDTO {
	//members(유저 정보)
	private String id;
	private String name;
	private String pw;
	private String phone1;
	private String phone2;
	private String phone3;
	private String email;
	
	//writedata(글 정보)
	private String magazineid;
	private String magtitle;
	private String magtag;
	private String magcontent;
	private String clientid;
	private String magfile;
	
	
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPhone1() {
		return phone1;
	}


	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}


	public String getPhone2() {
		return phone2;
	}


	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}


	public String getPhone3() {
		return phone3;
	}


	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getMagazineid() {
		return magazineid;
	}


	public void setMagazineid(String magazineid) {
		this.magazineid = magazineid;
	}


	public String getMagtitle() {
		return magtitle;
	}


	public void setMagtitle(String magtitle) {
		this.magtitle = magtitle;
	}


	public String getMagtag() {
		return magtag;
	}


	public void setMagtag(String magtag) {
		this.magtag = magtag;
	}


	public String getMagcontent() {
		return magcontent;
	}


	public void setMagcontent(String magcontent) {
		this.magcontent = magcontent;
	}


	public String getClientid() {
		return clientid;
	}


	public void setClientid(String clientid) {
		this.clientid = clientid;
	}


	public String getMagfile() {
		return magfile;
	}


	public void setMagfile(String magfile) {
		this.magfile = magfile;
	}


	public MagDTO() {
		super();
	}

}
