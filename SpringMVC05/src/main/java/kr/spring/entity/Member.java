package kr.spring.entity;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor // 기본생성자
@ToString
public class Member {

	private int memIdx;
	private String memID;
	private String memPassword;
	private String memName;
	private int memAge;
	private String memGender;
	private String memEmail;
	private String memProfile;
	
	// 자신의 권한정보를 저장할 변수 Why List<Aut>?
	// 권한은 여러개가 될 수도 있기 때문에
	private List<Auth> authList;


}
