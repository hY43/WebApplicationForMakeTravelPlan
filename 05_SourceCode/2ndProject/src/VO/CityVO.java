package VO;

public class CityVO {
	/* Member Variable */
	private int cityno;
	private String cityName; // 도시 명
	private float latitude; // 도시의 위도
	private float longitude; // 도시의 경도
	private String info; // 도시 정보
	private String img; // 도시 사진의 경로
	
	/* Constructor */
	public CityVO(){super();}
	public CityVO(int cityno, String cityName, float latitude, float longitude, String info, String img) {
		super();
		this.cityno = cityno;
		this.cityName = cityName;
		this.latitude = latitude;
		this.longitude = longitude;
		this.info = info;
		this.img = img;
	}

	/* Get/Set Method */
	
	public int getCityno() {return cityno;}
	public void setCityno(int cityno) {this.cityno = cityno;}
	public String getCityName(){return cityName;}
	public void setCityName(String cityname){this.cityName = cityName;}
	public float getLatitude(){return latitude;}
	public void setLatitude(int latitude){this.latitude = latitude;}
	public float getLongitude(){return longitude;}
	public void setLongitude(int longitude){this.longitude = longitude;}
	public String getInfo(){return info;}
	public void setInfo(String info){this.info = info;}
	public String getImg(){return img;}
	public void setImg(String img){this.img = img;}
}
