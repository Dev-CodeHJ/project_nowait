package ezen.nowait.order.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderMenuVO {

	private int orderNum;
	private int menuOptionNum;
	private int menuNum;
	private int orderCnt;
	private int orderMenuPrice;
}
