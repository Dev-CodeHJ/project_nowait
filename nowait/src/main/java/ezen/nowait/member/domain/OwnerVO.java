package ezen.nowait.member.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OwnerVO {

	private String ownerId;
	private String ownerPw;
	private String ownerName;
	private String ownerBirth;
	private String ownerPhone;
	private String ownerEmail;
	private Date ownerRegdate;
}
