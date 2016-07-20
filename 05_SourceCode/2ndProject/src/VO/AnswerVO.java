package VO;

public class AnswerVO {
	/* Member Variable */
	private int answerNo; // 질문에 대한 답변 고유번호
	private String contents; // 답변 내용
	private int questionNo; // 답변의 질문 번호
	private String userId; // 답변에 대한 사용자 계정
	
	/* Constructor */
	public AnswerVO(){super();}
	public AnswerVO(int answerNo, String contents, int questionNo, String userId) {
		super();
		this.answerNo = answerNo;
		this.contents = contents;
		this.questionNo = questionNo;
		this.userId = userId;
	}

	/* Get/Set Method */
	public int getAnswerNo(){return answerNo;}
	public void setAnswerNo(int answerNo){this.answerNo = answerNo;}
	public String getContents(){return contents;}
	public void setContents(String contents){this.contents = contents;}
	public int getQuestionNo(){return questionNo;}
	public void setQuestionNo(int questionNo){this.questionNo = questionNo;}
	public String getUserId(){return userId;}
	public void setUserId(String userId){this.userId = userId;}
}
