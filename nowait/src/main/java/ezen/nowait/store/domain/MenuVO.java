package ezen.nowait.store.domain;

import lombok.Data;

@Data
public class MenuVO {
	
	private int menuNum;
	private String crNum;
	private int menuCategory;
	private String menuName;
	private String uploadFileName; //고객이 업로드한 파일명
    private String storeFileName; //서버 내부에서 관리하는 파일명
	private int price;
	private int popularity;
	private int menuStatus;
}
