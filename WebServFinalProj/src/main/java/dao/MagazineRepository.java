package dao;
import java.util.ArrayList;

import dto.Magazine;

public class MagazineRepository{
	
	private ArrayList<Magazine> listOfMagazines = new ArrayList<Magazine>();
	
	private static MagazineRepository instance = new MagazineRepository();
	
	public static MagazineRepository getInstance(){
		return instance;
	}
	
	public MagazineRepository() {
		
		Magazine mag1 = new Magazine("ISBN0000", "가이드맵", "소개글");
		mag1.setWriteDate("관리자");
		mag1.setWriteDate(null);
		mag1.setFilename("ISBN0000.jpg");
		mag1.setDescription("처음으로 새롭게 이 페이지를 접속하신 여러분들께 감사합니다. 지금부터 이 웹페이지에 대한 설명을 포함하여 이 웹페이지를 하나하나씩 만들어 보도록 하겠습니다.");
		
		
		Magazine mag2 = new Magazine("ISBN0000", "가이드맵", "소개글");
		mag2.setWriteDate("관리자");
		mag2.setWriteDate(null);
		mag2.setFilename("ISBN0001.jpg");
		mag2.setDescription("처음으로 새롭게 이 페이지를 접속하신 여러분들께 감사합니다. 지금부터 이 웹페이지에 대한 설명을 포함하여 이 웹페이지를 하나하나씩 만들어 보도록 하겠습니다.");
		
		
		Magazine mag3 = new Magazine("ISBN0000", "가이드맵", "소개글");
		mag3.setWriteDate("관리자");
		mag3.setWriteDate(null);
		mag3.setFilename("ISBN0002.jpg");
		mag3.setDescription("처음으로 새롭게 이 페이지를 접속하신 여러분들께 감사합니다. 지금부터 이 웹페이지에 대한 설명을 포함하여 이 웹페이지를 하나하나씩 만들어 보도록 하겠습니다.");
		
		
		Magazine mag4 = new Magazine("ISBN0000", "가이드맵", "소개글");
		mag4.setWriteDate("관리자");
		mag4.setWriteDate(null);
		mag4.setFilename("ISBN0003.jpg");
		mag4.setDescription("처음으로 새롭게 이 페이지를 접속하신 여러분들께 감사합니다. 지금부터 이 웹페이지에 대한 설명을 포함하여 이 웹페이지를 하나하나씩 만들어 보도록 하겠습니다.");
		
		Magazine mag5 = new Magazine("ISBN0000", "가이드맵", "소개글");
		mag5.setWriteDate("관리자");
		mag5.setWriteDate(null);
		mag5.setFilename("ISBN0004.jpg");
		mag5.setDescription("처음으로 새롭게 이 페이지를 접속하신 여러분들께 감사합니다. 지금부터 이 웹페이지에 대한 설명을 포함하여 이 웹페이지를 하나하나씩 만들어 보도록 하겠습니다.");
		
	
		
		listOfMagazines.add(mag1);
		listOfMagazines.add(mag2);
		listOfMagazines.add(mag3);
		listOfMagazines.add(mag4);
		listOfMagazines.add(mag5);
	}
	public ArrayList<Magazine> getAllMagazine(){
		return listOfMagazines;
	}
	public void addMagazine(Magazine mag) {
		listOfMagazines.add(mag);
	}
}