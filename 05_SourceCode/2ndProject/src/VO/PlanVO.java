package VO;

public class PlanVO {
	/* Member Variable */
	private int planNo; // 계획 일정에 대한 고유 번호
	private String title; // 계획 제목
	private String regDate; // 계획 작성일
	private int period; // 여행 기간
	private String userId; // 일정에 대한 사용자 계정
	
	/* Constructor */
	public PlanVO(){super();}
	public PlanVO(int planNo, String title, String regDate, int period, String userId) {
		super();
		this.planNo = planNo;
		this.title = title;
		this.regDate = regDate;
		this.period = period;
		this.userId = userId;
	}

	/* Get/Set Method */
	public int getPlanNo(){return planNo;}
	public void setPlanNo(int planNo){this.planNo = planNo;}
	public String getTitle(){return title;}
	public void setTitle(String title){this.title = title;}
	public String getRegDate(){return regDate;}
	public void setRegDate(String regDate){this.regDate = regDate;}
	public int getPeriod(){return period;}
	public void setPeriod(int period){this.period = period;}
	public String getUserId(){return userId;}
	public void setUserId(String userId){this.userId = userId;}
}
