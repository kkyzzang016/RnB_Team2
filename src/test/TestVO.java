package test;

import lombok.Data;

@Data	//Data 어노테이션 사용 시 클래스내 모든필드에 Getter,Setter 자동생성
public class TestVO {

	private String clientId;
	private String clientPw;
}

class TestCoding {

	TestVO t = new TestVO();

	public void test() {
		t.setClientId("");
		t.setClientPw("");
	}
}


/**
 *
 * @author 강광용
 *
 * lombok 다른 기능
 * @ToString //사용 시 ToString 메소드 자동 생성
 * @NoArgsConstructor //사용 시 매개변수가 없는 생성자 자동생성
 * @AllArgsConstructor //사용시 모든 필드를 가진 생성자 자동생성
 *
 */

