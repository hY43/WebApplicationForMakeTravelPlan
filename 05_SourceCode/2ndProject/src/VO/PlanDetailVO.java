package VO;

public class PlanDetailVO {
	/* Member Variable */
	private int plandetailNo; // 한개 여행 일정에 대한 상세 일정 고유 번호
	private int planOrder; // 하루 여행 일정에 대한 순서
	private int day; // 여행 일차 기록
	private String moveTime; // 이동 시간
	private String planComment; // 일정 메모
	private int planNo; // 상세 일정을 포함하는 여행 일정 고유 번호
	private int placeNo; // 상세 일정에 포함되는 관광지 번호.
	
	/* Constructor */
	public PlanDetailVO(){super();}
	public PlanDetailVO(int plandetailNo, int planOrder, int day, String moveTime, String planComment, int planNo,
			int placeNo) {
		super();
		this.plandetailNo = plandetailNo;
		this.planOrder = planOrder;
		this.day = day;
		this.moveTime = moveTime;
		this.planComment = planComment;
		this.planNo = planNo;
		this.placeNo = placeNo;
	}

	/* Get/Set Method */
	public int getPlandetailNo(){return plandetailNo;}
	public void setPlandetailNo(int plandetailNo){this.plandetailNo = plandetailNo;}
	public int getPlanOrder(){return planOrder;}
	public void setPlanOrder(int planOrder){this.planOrder = planOrder;}
	public int getDay(){return day;}
	public void setDay(int day){this.day = day;}
	public String getMoveTime(){return moveTime;}
	public void setMoveTime(String moveTime){this.moveTime = moveTime;}
	public String getPlanComment(){return planComment;}
	public void setPlanComment(String planComment){this.planComment = planComment;}
	public int getPlanNo(){return planNo;}
	public void setPlanNo(int planNo){this.planNo = planNo;}
	public int getPlaceNo(){return placeNo;}
	public void setPlaceNo(int placeNo){this.placeNo = placeNo;}
}
