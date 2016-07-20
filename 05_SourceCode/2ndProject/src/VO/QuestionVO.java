package VO;

public class QuestionVO {
	/* Member Variable */
	private int questionNo; // 질문 게시물의 고유 번호
	private String regDate; // 질문 작성일
	private String title; // 질문 제목
	private String contents; // 질문 내용
	private String userId; // 질문 올린 사용자의 계정

	/* Constructor */
	public QuestionVO(){super();}
	public QuestionVO(int questionNo, String regDate, String title, String contents, String userId) {
		super();
		this.questionNo = questionNo;
		this.regDate = regDate;
		this.title = title;
		this.contents = contents;
		this.userId = userId;
	}

	/* Get/Set Method */
	public int getQuestionNo(){return questionNo;}
	public void setQuestionNo(int questionNo){this.questionNo = questionNo;}
	public String getRegDate(){return regDate;}
	public void setRegDate(String regDate){this.regDate = regDate;}
	public String getTitle(){return title;}
	public void setTitle(String title){this.title = title;}
	public String getContents(){return contents;}
	public void setContents(String contents){this.contents = contents;}
	public String getUserId(){return userId;}
	public void setUserId(String userId){this.userId = userId;}
}
