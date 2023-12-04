package ezen.nowait.member.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OwnerVO {

	private String ownerId;
	private String ownerPw;
	private String ownerName;
	private String ownerBirth;
	private String ownerPhone;
	private String ownerEmail;
	private Date ownerRegdate;
}
