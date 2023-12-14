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
	private String uploadFileName; //고객이 업로드한 파일명
    private String storeFileName; //서버 내부에서 관리하는 파일명
}