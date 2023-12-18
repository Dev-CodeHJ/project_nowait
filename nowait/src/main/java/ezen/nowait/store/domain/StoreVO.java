package ezen.nowait.store.domain;

import lombok.Data;

@Data
public class StoreVO {

	private String crNum;
	private String secretCode;
	private String storeName;
	private int storeCategory;
	private String storeAddr;
	private String storeTel;
	private String storeEmail;
	private String opentime;
	private String storeInfo;
	private int orderCnt;
	private int reviewCnt;
	private String userId;
	private String menuName;
	private int reservCheck;
}