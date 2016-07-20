package VO;

public class UserInfoVO {
	/* Member Variable */
	private String userId; // 사용자 계정
	private String password; // 사용자 비밀번호
	private String name; // 사용자 이름
	private String tel; // 사용자 연락처
	private String email; // 사용자 이메일
	private String backgroundImg; // 사용자의 배경 이미지 경로.
	private String admin; // 관리자 계정인지 사용자 계정인지 확인을 위한 변수, 0:관리자 1:일반사용자
	
	/* Constructor */
	public UserInfoVO(){super();}
	public UserInfoVO(String userId, String password, String name, String tel, String email, String backgroundImg,
			String admin) {
		super();
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.backgroundImg = backgroundImg;
		this.admin = admin;
	}

	/* Get/Set Method */
	public String getUserId(){return userId;}
	public void setUserId(String userId){this.userId = userId;}
	public String getPassword(){return password;}
	public void setPassword(String password){this.password = password;}
	public String getName(){return name;}
	public void setName(String name){this.name = name;}
	public String getTel(){return tel;}
	public void setTel(String tel){this.tel = tel;}
	public String getEmail(){return email;}
	public void setEmail(String email){this.email = email;}
	public String getBackgroundImg(){return backgroundImg;}
	public void setBackgroundImg(String backgroundImg){this.backgroundImg = backgroundImg;}
	public String getAdmin(){return admin;}
	public void setAdmin(String admin){this.admin = admin;}
}
