package ezen.nowait.store.domain;

import lombok.Data;

@Data
public class MenuOptionVO {

	private int menuOptionNum;
	private int menuNum;
	private String option;
	private int optionPrice;
	private boolean optionStatus;
}
