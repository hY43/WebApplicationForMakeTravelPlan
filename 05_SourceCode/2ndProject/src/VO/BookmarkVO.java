package VO;

public class BookmarkVO {
	/* Member Variable */
	private int bookmarkNo; // 북마크의 고유번호
	private String url; // 북마크된 포스트에 대한 URL
	private String userid; // 포스트를 북마크한 사용자의 계정
	
	/* Constructor */
	public BookmarkVO(){super();};
	public BookmarkVO(int bookmarkNo, String url, String userid) {
		super();
		this.bookmarkNo = bookmarkNo;
		this.url = url;
		this.userid = userid;
	}
	
	/* Get/Set Method */
	public int getBookmarkNo(){return bookmarkNo;}
	public void setBookmarkNo(int bookmarkNo){this.bookmarkNo = bookmarkNo;}
	public String getUrl(){return url;}
	public void setUrl(String url){this.url = url;}
	public String getUserid(){return userid;}
	public void setUserid(String userid){this.userid = userid;}		
}
