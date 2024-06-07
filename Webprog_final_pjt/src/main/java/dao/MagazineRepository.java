package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import dto.Magazine;

public class MagazineRepository {

    private ArrayList<Magazine> listOfMagazines = new ArrayList<Magazine>();

    private static MagazineRepository instance;

    static {
        try {
            instance = new MagazineRepository();
            instance.initializeMagazines();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static MagazineRepository getInstance() {
        return instance;
    }

    private MagazineRepository() {
        // 기본 생성자, 예외를 던지지 않음
    }

    private void initializeMagazines() throws SQLException {
        try {
            Magazine mag1 = new Magazine();
            mag1.setMagazineId();
            mag1.setClientId("관리자");
            mag1.setMagTitle("안녕하세요");
            mag1.setMagTag("Welcome");
            mag1.setMagFile("welcome.jpg");
            mag1.setMagcontent(
                "처음으로 새롭게 이 페이지를 접속하신 여러분들께 감사합니다. 지금부터 이 웹페이지에 대한 설명을 포함하여 이 웹페이지를 하나하나씩 만들어 보도록 하겠습니다.");

            Magazine mag2 = new Magazine();
            mag2.setMagazineId();
            mag2.setClientId("관리자");
            mag2.setMagTitle("안녕하세요");
            mag2.setMagTag("Welcome");
            mag2.setMagFile("welcome.jpg");
            mag2.setMagcontent(
                "처음으로 새롭게 이 페이지를 접속하신 여러분들께 감사합니다. 지금부터 이 웹페이지에 대한 설명을 포함하여 이 웹페이지를 하나하나씩 만들어 보도록 하겠습니다.");

            Magazine mag3 = new Magazine();
            mag3.setMagazineId();
            mag3.setClientId("관리자");
            mag3.setMagTitle("안녕하세요");
            mag3.setMagTag("Welcome");
            mag3.setMagFile("welcome.jpg");
            mag3.setMagcontent(
                "처음으로 새롭게 이 페이지를 접속하신 여러분들께 감사합니다. 지금부터 이 웹페이지에 대한 설명을 포함하여 이 웹페이지를 하나하나씩 만들어 보도록 하겠습니다.");

            listOfMagazines.add(mag1);
            listOfMagazines.add(mag2);
            listOfMagazines.add(mag3);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Magazine> getAllMagazine() {
        return listOfMagazines;
    }

    public void addMagazine(Magazine mag) {
        listOfMagazines.add(mag);
    }
}
