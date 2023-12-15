package ezen.nowait.order.domain;

import lombok.Data;

@Data
public class OrderMenuVO {

	private int orderNum;
	private int menuOptionNum;
	private int menuNum;
	private int orderCnt;
	private int orderMenuPrice;
}
