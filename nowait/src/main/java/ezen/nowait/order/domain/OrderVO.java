package ezen.nowait.order.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	
	private int orderNum;
	private String userId;
	private String crNum;
	private int reservCheck;
	private int payMethod;
	private int reservNum;
	private String reservTime;
	private Date orderTime;
	private int totalPrice;
	private String requestMsg;
	
}
