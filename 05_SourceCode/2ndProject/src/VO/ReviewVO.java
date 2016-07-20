package VO;

public class ReviewVO {
	/* Member Variable */
	private int reviewNo; // 포스트 고유번호
	private int enable; // 공개 여부, 0:공개 1:비공개
	private String regDate; // 작성일자
	private String title; // 포스트 제목
	private String contents; // 포스트 내용
	private String userId; // 포스트에 대한 사용자 계정

	/* Constructor */
	public ReviewVO(){super();}
	public ReviewVO(int reviewNo, int enable, String regDate, String title, String contents, String userId) {
		super();
		this.reviewNo = reviewNo;
		this.enable = enable;
		this.regDate = regDate;
		this.title = title;
		this.contents = contents;
		this.userId = userId;
	}

	/* Get/Set Method */
	public int getReviewNo(){return reviewNo;}
	public void setReviewNo(int reviewNo){this.reviewNo = reviewNo;}
	public int getEnable(){return enable;}
	public void setEnable(int enable){this.enable = enable;}
	public String getRegDate(){return regDate;}
	public void setDate(String regDate){this.regDate = regDate;}
	public String getTitle(){return title;}
	public void setTitle(String title){this.title = title;}
	public String getContents(){return contents;}
	public void setContents(String contents){this.contents = contents;}
	public String getUserId(){return userId;}
	public void setUserId(String userId){this.userId = userId;}
}
