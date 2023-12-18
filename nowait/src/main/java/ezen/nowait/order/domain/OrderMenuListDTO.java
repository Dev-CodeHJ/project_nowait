package ezen.nowait.order.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderMenuListDTO {
	private List<OrderMenuVO> orderMenuList;
}
