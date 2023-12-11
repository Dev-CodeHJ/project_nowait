package ezen.nowait.store.domain;

import lombok.Data;

@Data
public class MenuVO {
	
	private int menuNum;
	private String crNum;
	private int menuCategory;
	private String menuName;
	private String menuImg;
	private int price;
	private int popularity;
	private int menuStatus;
}
